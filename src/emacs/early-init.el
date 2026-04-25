;;; -*- lexical-binding: t; -*-
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; The default setting is too low for lsp-mode's needs due to the fact that client/server communication generates a lot of memory/garbage.
;; Set it to big number(100mb) like most of the popular starter kits like Spacemacs/Doom/Prelude, etc do:
;; (setq gc-cons-threshold 100000000)
(setq gc-cons-threshold 134217728) ; 128mb
(setq gc-cons-percentage 1.0)

;; If you don’t edit right-to-left languages (Arabic, Hebrew, etc.), Emacs is doing a bunch of work on every redisplay cycle for nothing.
;; These settings tell Emacs to assume left-to-right text everywhere and skip the bidirectional parenthesis algorithm:
(setq bidi-inhibit-bpa t)
(setq-default bidi-display-reordering 'left-to-right)
(setq-default bidi-paragraph-direction 'left-to-right)

;; Emacs normally fontifies (syntax-highlights) text even while you’re actively typing.
;; This can cause micro-stutters, especially in tree-sitter modes or large buffers. One setting fixes it:
(setq redisplay-skip-fontification-on-input t)

;; The default read-process-output-max is 64KB, which is still quite conservative.
;; Modern LSP servers like rust-analyzer or clangd routinely send multi-megabyte responses.
;; Bumping this reduces the number of read calls Emacs has to make:
(setq read-process-output-max (* 4 1024 1024)) ; 4MB

;; When you split a window with C-x 2 or C-x 3, Emacs halves the current window.
;; If you already have a multi-window layout, this can produce one awkwardly tiny window while others stay large.
;; With this setting, all windows in the frame resize proportionally:
(setq window-combination-resize t)

;; Change "yes or no" to "y or n"
(setopt use-short-answers t)

(setq desktop-dirname "~/.emacs.d/.cache/desktop/")
