;; fak emac

;;;; cor

;; utf-8
(set-language-environment "UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
;; foreground
;; (add-to-list 'default-frame-alist '(foreground-color . "#000000"))
;; background
;; (add-to-list 'default-frame-alist '(background-color . "#FFFFFF"))
;; seleção de texto
;; (set-face-attribute 'region nil :background "#6EFAFF")
;; linha do cursor
(global-hl-line-mode 1)
;; (set-face-background 'hl-line "#E8E8E8")
(set-face-foreground 'highlight nil)

;; fonte
(set-face-attribute 'default nil :font "Fantasque Sans Mono:antialias=1" :height 100)

;; set relative line
(display-line-numbers-mode)
(setq display-line-numbers 'relative)

;; remover barras de menu
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; melpa
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("gnu" . "https://elpa.gnu.org/packages/"))
 (package-initialize)
 (package-refresh-contents)
(unless (package-installed-p 'evil)
  (package-install 'evil))

; C-u
(setq evil-want-C-u-scroll t)
(setq evil-want-keybinding nil)
; evil mode
(require 'evil)
(evil-mode 1)
(evil-collection-init '(vterm dired))

; paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'slime-mode-hook            #'enable-paredit-mode) ;; ?

; pular para definição do header
(global-set-key (kbd "C-x C-o") 'ff-find-other-file)

;; slime
(setq inferior-lisp-program (executable-find "sbcl"))

;; indentação
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq tab-stop-list (number-sequence 4 200 4))

;; no wrap
;; (toggle-truncate-lines)

;; diretório de backups
(setq backup-directory-alist `(("." . "~/.saves")))

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(global-set-key (kbd "C-'") help-map)
(global-set-key (kbd "C-h") 'delete-backward-char) ;; describe-function

(setq-default show-trailing-whitespace t)

;; set number
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'slime-repl-mode 'display-line-numbers-mode)

;; let não funciona? porque?
(defvar default-colors (cons (face-background 'mode-line) (face-foreground 'mode-line)))

(defun mode-line-colors ()
  (let ((color (cond ((minibufferp) default-colors)
                     ((evil-insert-state-p) '("#000000" . "#ffffff"))
                     ((evil-emacs-state-p)  '("#000000" . "#ffffff"))
                     ((buffer-modified-p)   '("#78007a" . "#ffffff"))
                     (t default-colors))))
    (set-face-background 'mode-line (car color))
    (set-face-foreground 'mode-line (cdr color))))

(add-hook 'post-command-hook #'mode-line-colors)

(add-hook 'go-mode-hook 'lsp-deferred)

(require 'use-package)

(use-package vterm :ensure t)

(use-package lsp-mode
	     ;; :custom
	     ;; (lsp-headerline-breadcrumb-enable t)
         )

(setq lsp-enable-links nil)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-diagnostics t)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)


(global-set-key (kbd "M-x") #'helm-M-x)

;; Treat all themes as safe
(setq custom-safe-themes t)
(load-theme 'obsidian)
;; (load-theme 'moe-dark)

(add-hook 'minibuffer-setup-hook
          (lambda ()
            (local-set-key (kbd "C-w") #'backward-kill-word
                           ;; (kbd "C-l")
                           )
            (local-set-key (kbd "C-h") (kbd "<backspace>"))))

(display-time)
