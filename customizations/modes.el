; text-mode
(add-hook 'text-mode-hook (lambda () (setq tab-width 2)))

; Git
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))

; Ruby
(add-hook 'ruby-mode-hook'(lambda ()
  (local-set-key "\r" 'newline-and-indent)))
(setq ruby-indent-tabs-mode nil)

; Python
(add-hook 'python-mode-hook (lambda () (setq python-indent 2)))

; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))
(setq espresso-indent-level 2)
