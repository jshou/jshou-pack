;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

;; set emacs font size
(set-face-attribute 'default nil :height 100)

;; show line numbers
(global-linum-mode t)
(setq linum-format "%d ")

;; use melpa for package management
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-x f") 'fiplr-find-file)

;; set shell
(setq multi-term-program "/bin/zsh")

;; add keybindings to term-mode
; (add-to-list 'term-bind-key-alist '("<M-backspace>" . term-send-raw-meta))
; (add-to-list 'term-bind-key-alist '("C-w" . term-send-backward-kill-word))
; (add-to-list 'term-bind-key-alist '("M-d" . term-send-forward-kill-word))
; (add-to-list 'term-bind-key-alist '("C-y" . term-paste))

;; set space mode
(setq-default indent-tabs-mode nil)
;; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
