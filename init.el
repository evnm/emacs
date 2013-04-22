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
                smex
                gist
                deft
                writegood-mode
                ;nyan-mode
                android
                espresso
                haml-mode
                sass-mode
                markdown-mode
                scala-mode2
                thrift-mode
                coffee-mode
                sml-mode
                ruby-mode
                yaml-mode))

; Load personal customizations
(mapc 'load-directory '("~/.emacs.d/customizations"))

; Load system-specific configs (e.g. "darwin.el" on mac)
(let ((system-type-config (concat "~/.emacs.d/os-customizations/"
                                  (symbol-name system-type) ".el")))
  (if (file-exists-p system-type-config)
      (load system-type-config)))
