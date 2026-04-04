;; VS Code-like shortcuts
;; (global-set-key (kbd "C-p") 'consult-find) ;; open file (like Ctrl+P)
;; (global-set-key (kbd "C-f") 'consult-line) ;; search in file
;; (global-set-key (kbd "M-x") 'consult-M-x)  ;; improved command palette


;; super-left-click is middle click
(defun middle-click (prompt)
  (defun inner (e)
    (interactive "e")
    (setcar e 'mouse-2)
    (vector e))
  (call-interactively 'inner))

(define-key key-translation-map (kbd "s-<mouse-1>") 'middle-click)

(provide 'core-keybinds)
