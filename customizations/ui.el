; Don't display the initial startup msg
(setq inhibit-startup-message t)

; Disable any bell behavior
(setq ring-bell-function 'ignore)

; Use the system's trash when deleting files
(setq delete-by-moving-to-trash t)

; Use a better frame title format
(setq frame-title-format (concat  "%b - emacs@" (system-name)))

; Use Mensch as default font
(set-face-attribute 'default nil :font "Mensch")

; Use smooth scrolling
(require 'smooth-scrolling)

; Blink the cursor (in settings where cursor behavior isn't controlled by
; the terminal)
(blink-cursor-mode t)

; Don't show warning upon loading large files.
(setq large-file-warning-threshold nil)

; Don't show a toolbar
(tool-bar-mode 0)

(when window-system
  (load-theme 'wombat2 t)

  ; Run emacs as an edit server.
  (server-start))
