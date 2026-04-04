(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config

  (setq treesit-auto-langs '(javascript typescript js ts jsx tsx css html bash))
  (treesit-auto-add-to-auto-mode-alist 'treesit-auto-langs)
  ;; (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(provide 'treesitter)
