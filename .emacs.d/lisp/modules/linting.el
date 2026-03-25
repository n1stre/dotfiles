(use-package flycheck
  :hook (lsp-mode . flycheck-mode)
  :bind (:map flycheck-mode-map
              ("M-n" . flycheck-previous-error)
              ("M-p" . flycheck-next-error))
  :custom (flycheck-display-errors-delay .3))


(provide 'linting)