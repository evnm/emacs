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
(setq ruby-insert-encoding-magic-comment nil)
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec" . ruby-mode))

; Python
(add-hook 'python-mode-hook (lambda () (setq python-indent 2)))
(add-to-list 'auto-mode-alist '("BUILD*" . python-mode))

; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))
(setq js-indent-level 2)

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
(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

; Deft
(setq deft-directory "~/Dropbox/.deft")
(setq deft-text-mode 'markdown-mode)
(setq deft-use-filename-as-title t)
(setq deft-auto-save-interval 0)

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

; flyspell-mode
(setq ispell-program-name "/usr/local/bin/aspell")
