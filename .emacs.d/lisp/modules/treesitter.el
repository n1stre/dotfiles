(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (setq treesit-auto-langs '(javascript typescript js ts jsx tsx css html))
  (treesit-auto-add-to-auto-mode-alist '(javascript typescript js ts jsx tsx css html))
  (global-treesit-auto-mode))

(provide 'treesitter)