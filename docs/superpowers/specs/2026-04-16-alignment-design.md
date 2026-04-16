# Alignment Support Design

## Goal
Add `.left`, `.center`, `.right` alignment to `AdvancedPageControlView` so consumers can pin the dot indicator to either edge of its container rather than always centering it.

## Context
Issue #15 — users want left/right alignment. A community workaround exists (override `getCenteredXPosition`) but requires subclassing. This adds it as a first-class property.

---

## New Type: PageControlAlignment

Added to `AdvancedPageControl/Classes/Drawers/DrawerProtocol.swift`:

```swift
public enum PageControlAlignment {
    case left, center, right
}
```

---

## AdvancedPageControlDrawerParent

**New property** (internal — not exposed on the protocol):
```swift
var alignment: PageControlAlignment = .center
```

**Modified `getCenteredXPosition`** — branches on alignment:

- `.center` — existing formula, unchanged:
  ```swift
  let individualDotPos = itemPos * (dotSize + space)
  let halfViewWidth = rect.width / 2
  let halfAllDotsWidth = (CGFloat(numberOfPages) * (dotSize + (space - 1))) / 2.0
  return individualDotPos - halfAllDotsWidth + halfViewWidth
  ```

- `.left` — dots start at rect origin:
  ```swift
  return itemPos * (dotSize + space)
  ```

- `.right` — dots end at rect right edge:
  ```swift
  let individualDotPos = itemPos * (dotSize + space)
  let totalDotsWidth = CGFloat(numberOfPages) * dotSize + CGFloat(numberOfPages - 1) * space
  return rect.width + individualDotPos - totalDotsWidth
  ```

All 13 drawer subclasses inherit the change automatically with no modifications.

---

## AdvancedPageControlView

**New public property:**
```swift
public var alignment: PageControlAlignment = .center {
    didSet {
        (drawer as? AdvancedPageControlDrawerParent)?.alignment = alignment
        setNeedsDisplay()
    }
}
```

Syncs to the drawer whenever set. Calls `setNeedsDisplay()` so the change is immediately visible. Custom drawers that implement `AdvancedPageControlDraw` directly (not via `AdvancedPageControlDrawerParent`) are unaffected — they handle their own layout.

Also syncs on drawer assignment — when the user sets a new drawer, the current alignment is applied:
```swift
public var drawer: AdvancedPageControlDraw = InfiniteScrollingDrawer() {
    didSet {
        (drawer as? AdvancedPageControlDrawerParent)?.alignment = alignment
        setNeedsDisplay()
    }
}
```

---

## Tests

**DrawerParentAlignmentTests** (new file):
- `.left`: first dot x == 0
- `.right`: last dot x + dotSize == rect.width
- `.center`: matches existing getCenteredXPosition output (no regression)
- Switching alignment mid-session updates positions correctly

**AdvancedPageControlViewAlignmentTests** (new file):
- Setting `view.alignment` syncs to drawer
- Assigning a new drawer inherits current alignment
- All 13 drawers draw without crashing with `.left` and `.right`
