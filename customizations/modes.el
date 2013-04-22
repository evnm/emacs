; Enable full-screen button in OS X window chrome
(menu-bar-mode t)

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
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))

; Python
(add-hook 'python-mode-hook (lambda () (setq python-indent 2)))

; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . espresso-mode))
(setq espresso-indent-level 2)

; CSS
(setq css-indent-offset 2)

; Markdown
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mkd$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

; CoffeeScript
(add-hook 'coffee-mode-hook '(lambda ()
  (interactive)
  (set (make-local-variable 'tab-width) 2)
  (local-set-key (kbd "RET") 'newline-and-indent)))

; Smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

; Deft
(setq deft-directory "~/Dropbox/.deft")
(setq deft-text-mode 'markdown-mode)
(setq deft-use-filename-as-title t)

; Scala
(add-hook 'scala-mode-hook '(lambda ()
  (interactive)
  (setq scala-indent:use-javadoc-style t)
  (local-set-key (kbd "RET") '(lambda ()
    (interactive)
    (newline-and-indent)
    (scala-indent:insert-asterisk-on-multiline-comment)))))

; YAML
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
