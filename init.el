; Emacs load paths
(add-to-list 'load-path "~/.emacs.d/util")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

; Load utilities
(load "load-directory.el")
(mapc 'load-directory '("~/.emacs.d/util"))

; Load third-party modes
(mapc 'vendor '(thrift-mode))

; Load package sources
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

; Load personal customizations
(mapc 'load-directory '("~/.emacs.d/customizations"))

; Load system-specific configs (e.g. "darwin.el" on mac)
(let ((system-type-config (concat "~/.emacs.d/os-customizations/"
                                  (symbol-name system-type) ".el")))
  (if (file-exists-p system-type-config)
      (load system-type-config)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fe9cd53071ba88b499ac46daac636a71b9a22d8ddfa86d615816973570063d4a" "c2472f187b9cbafd1ab38291eeadff9aedc7064a53d074730ebe9f288282d794" "8e83d1670baea24d4c43383d930b11e85d1fb710cf32cb958c846e759550ffed" "9ad3b99e388a6faa876bbcd52eaba3c0fc86db8047a8d0f0e98ce436e0b8f975" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
