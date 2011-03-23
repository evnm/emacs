; TODO: Comment these.
(setq inhibit-startup-message t
      ring-bell-function 'ignore
      delete-by-moving-to-trash t
      frame-title-format (concat  "%b - emacs@" (system-name))
      color-theme-load-all-themes nil)

(require 'smooth-scrolling)
(blink-cursor-mode t)

; Highlight current line
;(global-hl-line-mode t)

; Only enable color-theme when a windowing system is active.
(when window-system
  (setq color-theme-is-global t)
  (add-to-list 'load-path "~/.emacs.d/vendor/color-theme/themes")
  (require 'color-theme-wombat)
  (color-theme-wombat))
