; Don't display the initial startup msg
(setq inhibit-startup-message t)

; Disable any bell behavior
(setq ring-bell-function 'ignore)

; Use the system's trash when deleting files
(setq delete-by-moving-to-trash t)

; Use a better frame title format
(setq frame-title-format (concat  "%b - emacs@" (system-name)))

; Don't load all themes by default
(setq color-theme-load-all-themes nil)

; Use Mensch as default font
(set-face-attribute 'default nil :font "Mensch")

; Use smooth scrolling
(require 'smooth-scrolling)

; Blink the cursor (in settings where cursor behavior isn't controlled by
; the terminal)
(blink-cursor-mode t)

; Highlight current line
;(global-hl-line-mode t)

; Don't show warning upon loading large files.
(setq large-file-warning-threshold nil)

(when window-system
  ; Enable color-theme
  (setq color-theme-is-global t)
  (add-to-list 'load-path "~/.emacs.d/vendor/color-theme/themes")
  (require 'color-theme-wombat)
  (color-theme-wombat)

  ; Run emacs as an edit server.
  (server-start))
