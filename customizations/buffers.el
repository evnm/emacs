; Use ido-mode instead of builtin buffer list
(ido-mode 1)

; Allow y/n responses instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

; Disable auto-save files (#foo#)
(setq auto-save-default nil)

; Disable backup files (foo~)
(setq backup-inhibited t)

; Pick up changes to files on disk automatically (ie, after git pull)
(global-auto-revert-mode 1)

; Don't confirm opening non-existant files/buffers
(setq confirm-nonexistent-file-or-buffer nil)

(setq initial-scratch-message "")
