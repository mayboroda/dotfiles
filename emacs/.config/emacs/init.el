; UI
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar
;; no startup  screen
(setq inhibit-startup-screen t)

;; no startup message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; initial buffer
(setq initial-buffer-choice nil)

;; no frame title
(setq frame-title-format nil)

;; no file dialog
(setq use-file-dialog nil)

;; no dialog box
(setq use-dialog-box nil)

;; no empty line indicators
(setq indicate-empty-lines nil)

;; no cursor in inactive windows
(setq cursor-in-non-selected-windows nil)

(setq initial-scratch-message nil)
(setq inhibit-default-init t)

;; no beeping and no blinking please
(setq ring-bell-function #'ignore)
(setq visible-bell nil)

;; Set the best font for coding and writing
(set-face-attribute 'default nil :font "JetBrains Mono" :height 180)

;; Set a color theme
(load-theme 'leuven)        

; Editor

;; buffer encoding
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment   'utf-8)

;; this battle is simple
(setq-default indent-tabs-mode nil)
(setq-default tab-always-indent t)

;; Whitespaces
(setq-default require-final-newline t)

;; Disable backup files.
(setq make-backup-files nil)

;; auto-save files
(setq-default
 auto-save-list-file-prefix (expand-file-name
                             "auto-save-list/.saves-"
                             "~/.cache/emacs/"))

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; Packages
;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

;; https://github.com/jwiegley/use-package
(require 'use-package)
(setq use-package-always-ensure t)

;;; Vim Bindings
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  ;; allows for using cgn
  ;; (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  ;; no vim insert bindings
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

;;; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

;;; Org-mode
(setq org-directory "~/src/mayboroda/notes/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

