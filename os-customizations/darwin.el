; We only do this on Mac since on Linux this is controlled via the
; XRDB resource files.
(when window-system
  (progn (tool-bar-mode -1)
         (toggle-scroll-bar -1)))

; Disable the menu bar.
(menu-bar-mode -1)
