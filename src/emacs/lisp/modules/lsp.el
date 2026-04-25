;;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :after treesit-auto
  :commands (lsp lsp-deferred)
  :hook (
	       (js-ts-mode . lsp-deferred)
	       (typescript-ts-mode . lsp-deferred)
	       (tsx-ts-mode . lsp-deferred)
	       (bash-ts-mode . lsp-deferred)
	       ;;         (lsp-mode . lsp-enable-which-key-integration)
	       )
  :custom
  ;; The default setting is too low for lsp-mode's needs due to the fact that client/server communication generates a lot of memory/garbage.
  ;; Set it to big number(100mb) like most of the popular starter kits like Spacemacs/Doom/Prelude, etc do:
  (gc-cons-threshold 100000000)

  ;; Emacs default is too low 4k considering that the some of the language server responses are in 800k - 3M range.
  (read-process-output-max (* 1024 1024)) ;; 1mb.
  :init
  ;; (setq lsp-enable-snippet nil)
  (setq lsp-semgrep-languages '())
  (setq lsp-completion-provider :none)
  (setq lsp-keymap-prefix "C-c")
  (setq lsp-diagnostics-provider :flycheck)
  (setq lsp-session-file (expand-file-name ".cache/lsp/.lsp-session-v1" user-emacs-directory)))


(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'bottom)
  (lsp-ui-doc-show)
  )

(use-package lsp-treemacs
  :config
  (setq lsp-treemacs-error-list-severity 4)
  (setq lsp-treemacs-error-list-expand-depth 2)
  (setq lsp-treemacs-symbols-buffer-name " *lsp-treemacs-symbols-buffer*")
  (lsp-treemacs-sync-mode 1)
  )




(provide 'lsp)

