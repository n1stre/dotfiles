;;; -*- lexical-binding: t; -*-

;; VS Code-like shortcuts
;; (global-set-key (kbd "C-p") 'consult-find) ;; open file (like Ctrl+P)
;; (global-set-key (kbd "C-f") 'consult-line) ;; search in file
;; (global-set-key (kbd "M-x") 'consult-M-x)  ;; improved command palette


(global-set-key (kbd "C-`") 'ns-open-zsh)
(define-key key-translation-map (kbd "s-<mouse-1>") 'ns-middle-click)

(provide 'core-keybinds)
