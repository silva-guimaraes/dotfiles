; fak emac

;;;; cor

;; utf-8
(set-language-environment "UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
;; foreground
(add-to-list 'default-frame-alist '(foreground-color . "#000000"))
;; background
(add-to-list 'default-frame-alist '(background-color . "#FFFFFF"))
;; seleção de texto
(set-face-attribute 'region nil :background "#6EFAFF")
;; linha do cursor
(global-hl-line-mode 1)
(set-face-background 'hl-line "#E8E8E8")
(set-face-foreground 'highlight nil)

;; fonte
(set-face-attribute 'default nil :font "Liberation Mono-14:antialias=1" :height 90)

; set relative line
;(display-line-numbers-mode)
;(setq display-line-numbers 'relative)

; remover barras de menu
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

; melpa 
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
; evil mode
(require 'evil)
(evil-mode 1)

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

;; no wrap
(toggle-truncate-lines)

;; diretório de backups
(setq backup-directory-alist `(("." . "~/.saves")))

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
