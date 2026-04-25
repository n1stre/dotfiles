;;; -*- lexical-binding: t; -*-

(use-package flycheck
  :hook (lsp-mode . flycheck-mode)
  :bind (:map flycheck-mode-map
              ("M-p" . flycheck-previous-error)
              ("M-n" . flycheck-next-error))
  :custom (flycheck-display-errors-delay .3))


(provide 'linting)
