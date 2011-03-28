;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when (and
       (file-exists-p "~/.emacs.d/elpa")
       (load
        (expand-file-name "~/.emacs.d/elpa/package.el")))
  (package-initialize))

; Emacs load path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/util")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/customizations")

; Load utilities
(load "load-directory.el")
(mapc 'load-directory '("~/.emacs.d/util"))

; Load third-party modes
(mapc 'vendor '(color-theme
                android
                espresso
                sass-mode
                haml-mode
                markdown-mode
                thrift-mode))

; Load third-party modes that the vendor function can't handle
(add-to-list 'load-path "~/.emacs.d/vendor/scala")

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
 '(gud-gdb-command-name "gdb --annotate=1"))
