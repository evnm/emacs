;;; wombat-theme.el --- Custom face theme for Emacs

;; Copyright (C) 2010 .

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(deftheme wombat2
  "")

(custom-theme-set-faces
 'wombat2
 '(default ((t (:background "#242424" :foreground "#f6f3e8"))))
 '(cursor ((t (:background "#656565" :foreground "#f6f3e8"))))
 '(region ((t (:background "#444444" :foreground "#f6f3e8"))))
 '(mode-line ((t (:background "#444444" :foreground "#f6f3e8"))))
 '(mode-line-inactive ((t (:background "#444444" :foreground "#857b6f"))))
 '(fringe ((t (:background "#303030"))))
 '(minibuffer-prompt ((t (:foreground "#e5786d"))))
 '(font-lock-builtin-face ((t (:foreground "#e5786d"))))
 '(font-lock-comment-face ((t (:foreground "#99968b"))))
 '(font-lock-doc-face ((t (:foreground "#99968b"))))
 '(font-lock-constant-face ((t (:foreground "#e5786d" :weight bold))))
 '(font-lock-function-name-face ((t (:foreground "#cae682"))))
 '(font-lock-keyword-face ((t (:foreground "#8ac6f2" :weight bold))))
 '(font-lock-string-face ((t (:foreground "#95e454"))))
 '(font-lock-type-face ((t (:foreground "#cae682" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#cae682"))))
 '(font-lock-warning-face ((t (:foreground "#8f8f8f"))))
 '(isearch ((t (:background "#343434" :foreground "#857b6f"))))
 '(lazy-highlight ((t (:background "#384048" :foreground "#a0a8b0"))))
 '(link ((t (:foreground "#8ac6f2" :underline t))))
 '(link-visited ((t (:foreground "#e5786d" :underline t))))
 '(button ((t (:background "#444444" :foreground "#f6f3e8" :underline t :weight bold))))
 '(header-line ((t (:background "#303030" :foreground "#e7f6da")))))

(provide-theme 'wombat2)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; wombat2-theme.el  ends here
