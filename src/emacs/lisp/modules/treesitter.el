;;; -*- lexical-binding: t; -*-

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (setq treesit-auto-langs '(javascript typescript js ts jsx tsx css html bash))
  (setq treesit-font-lock-level 5)
  (treesit-auto-add-to-auto-mode-alist 'treesit-auto-langs)
  ;; (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode)
  )

(provide 'treesitter)
