; TODO: Comment these.
(setq show-paren-mode t
      column-number-mode t
      transient-mark-mode t
      require-final-newline t)

; Wrap lines in a tasteful way
; NOTE: Only available in Emacs 23.
;(global-visual-line-mode 1)

; Tab-width stuff
(setq-default indent-tabs-mode nil)
(setq tab-width 2
      c-basic-offset 2)

; Bind return to do same as C-j (return and indent)
(global-set-key (kbd "RET") 'newline-and-indent)

; Whitespace
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Apply syntax highlighting to all buffers
(global-font-lock-mode t)
