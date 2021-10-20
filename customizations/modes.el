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
(add-to-list 'auto-mode-alist '("\\.apib$" . markdown-mode))

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

; Java
;; Indent argument lists sanely.
(add-hook 'java-mode-hook '(lambda ()
                             (c-set-offset 'arglist-intro '+)))
(c-set-offset 'arglist-cont
              '(c-lineup-arglist-operators 0))
(c-set-offset 'arglist-cont-nonempty
              '(c-lineup-arglist-operators c-lineup-arglist))
(c-set-offset 'arglist-close
              '(c-lineup-close-paren))

; YAML
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

; flycheck
(require 'flycheck)
(setq flycheck-highlighting-mode 'lines)
(custom-set-faces
 '(flycheck-error ((((class color)) (:underline "Red"))))
 '(flycheck-warning ((((class color)) (:underline "Orange")))))

; sh-mode
(setq sh-basic-offset 2
      sh-indentation 2)

; Go
;; Is goimports available? If not, default to gofmt.
;(setq exec-path (append exec-path '("~/co/backend/go/bin")))
;(setq go-save-hook #'gofmt-before-save)
;(dolist (path exec-path)
;  (when (file-exists-p (concat path "/goimports"))
;    (setq gofmt-command "goimports")
;    (setq gofmt-args (list "-local" "samsaradev.io"))))
; Disabled goreturns because it seemed to inducing weird
; cursor-jumping behavior on save.
;(dolist (path exec-path)
;  (when (file-exists-p (concat path "/goreturns"))
;    (setq gofmt-command "goreturns")
;    (setq gofmt-args (list "-local" "samsaradev.io"))))

(add-hook 'go-mode-hook
          (lambda ()
            (setq-default)
            (setq tab-width 2)
            (setq standard-indent 2)
            (setq indent-tabs-mode t)))
(require 'go-projectile)

; Protocol Buffers
(add-hook 'protobuf-mode-hook
  (lambda ()
    (if (string-match "samsara" (buffer-file-name)) (add-hook 'before-save-hook 'clang-format-buffer nil 't))))

; web-mode
(require 'web-mode)
(add-hook 'web-mode-hook
      (lambda ()
        (setq-default)
        (setq tab-width 2)
        (setq standard-indent 2)
        (setq web-mode-markup-indent-offset 2)
        (setq web-mode-css-indent-offset 2)
        (setq web-mode-code-indent-offset 2)
        (setq indent-tabs-mode nil)))

;; web mode for jsx, js, json, and tsx files.
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
    ad-do-it)
    ad-do-it))

; lsp-mode
(require 'lsp-mode)
(require 'lsp-ido)
(add-hook 'go-mode-hook #'lsp-deferred)
(setq lsp-enable-file-watchers nil)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(setq lsp-go-goimports-local "samsaradev.io")
(lsp-workspace-folders-add "~/co/backend/go/src/samsaradev.io")

; company-mode
(setq company-minimum-prefix-length 1
      ;; default idle delay is 0.2.
      company-idle-delay 0)

; zoom-mode
(custom-set-variables
 '(zoom-mode t)
 '(zoom-size '(0.618 . 0.618)))
