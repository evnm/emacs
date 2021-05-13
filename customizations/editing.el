; Apply syntax highlighting to all buffers
(global-font-lock-mode t)

; Show column numbers in the mode line.
(setq column-number-mode t)

; Highlight selections
(setq transient-mark-mode t)

; Paren-matching with no delay
(show-paren-mode t)
(setq show-paren-delay 0)

; Wrap lines in a tasteful way
; NOTE: Only available in Emacs 23.
;(global-visual-line-mode 1)

; Tab-width stuff
(setq-default indent-tabs-mode nil)
(setq tab-width 2
      c-basic-offset 2)

; Bind return to do same as C-j (return and indent)
(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-a") #'crux-move-beginning-of-line)

; Whitespace
(global-whitespace-cleanup-mode)
(setq-default show-trailing-whitespace t)

; Silently put newline at EOF upon save
(setq require-final-newline t)
