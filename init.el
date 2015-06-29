;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

;; set emacs font size
(set-face-attribute 'default nil :height 100)

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
;; there's more here http://www.emacswiki.org/emacs/multi-term.el
(setq term-bind-key-alist
      (list (cons "<C-backspace>" 'term-send-backward-kill-word)
            (cons "<M-backspace>" 'term-send-raw-meta)
            (cons "C-c C-c" 'term-interrupt-subjob)
            (cons "C-c C-e" 'term-send-esc)
            (cons "C-m" 'term-send-return)
            (cons "C-n" 'next-line)
            (cons "C-p" 'previous-line)
            (cons "C-r" 'isearch-backward)
            (cons "C-s" 'isearch-forward)
            (cons "C-w" 'term-send-backward-kill-word)
            (cons "C-y" 'term-paste)
            (cons "M-," 'term-send-raw)
            (cons "M-." 'comint-dynamic-complete)
            (cons "M-M" 'term-send-forward-kill-word)
            (cons "M-N" 'term-send-backward-kill-word)
            (cons "M-b" 'term-send-backward-word)
            (cons "M-d" 'term-send-forward-kill-word)
            (cons "M-f" 'term-send-forward-word)
            (cons "M-n" 'term-send-down)
            (cons "M-o" 'term-send-backspace)
            (cons "M-p" 'term-send-up)
            (cons "M-r" 'term-send-reverse-search-history)))

;; set space mode
(setq-default indent-tabs-mode nil)
;; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq fiplr-ignored-globs '((directories (".git" ".svn" ".tox" "venv"))
                            (files ("*.pyc"))))

(git-gutter:linum-setup)
(global-linum-mode 1)

(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))
