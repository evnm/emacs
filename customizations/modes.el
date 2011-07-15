; text-mode
(add-hook 'text-mode-hook (lambda () (setq tab-width 2)))

; Git
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))

; Ruby
(add-hook 'ruby-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))
(setq ruby-indent-tabs-mode nil)
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Vagrantfile" . ruby-mode) auto-mode-alist))

; Python
(add-hook 'python-mode-hook (lambda () (setq python-indent 2)))

; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . espresso-mode))
(setq espresso-indent-level 2)

; Markdown
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mkd$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

; Scala
(require 'scala-mode)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(add-hook 'scala-mode-hook (lambda ()
  (local-set-key (kbd "RET") (lambda ()
    (interactive)
    ; scala-indent-line checks last-command for repeated calls, so we must
    ; set it to nil to prevent extra spaces.
    (setq last-command nil)
    (scala-newline)
    (scala-indent-line)))))

; ENSIME
(add-to-list 'load-path "~/.emacs.d/vendor/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

; CoffeeScript
(add-hook 'coffee-mode-hook (lambda ()
  (interactive)
  (set (make-local-variable 'tab-width) 2)
  (local-set-key (kbd "RET") 'newline-and-indent)))
