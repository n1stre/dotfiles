(use-package nerd-icons
  ;; :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

;; (use-package dired
;;   :config
;;   (setq dired-listing-switches
;;         "-l --almost-all --human-readable --group-directories-first --no-group")
;;   ;; this command is useful when you want to close the window of `dirvish-side'
;;   ;; automatically when opening a file
;;   (put 'dired-find-alternate-file 'disabled nil))

(use-package dirvish
  :ensure t
  :init
  (dirvish-override-dired-mode)
  :custom
  (dirvish-quick-access-entries ; It's a custom option, `setq' won't work
   '(("h" "~/"                          "Home")
     ("d" "~/Downloads/"                "Downloads")
;;     ("m" "/mnt/"                       "Drives")
;;     ("s" "/ssh:my-remote-server")      "SSH server"
;;     ("e" "/sudo:root@localhost:/etc")  "Modify program settings"
;;     ("t" "~/.local/share/Trash/files/" "TrashCan")
    ))
  :config
  ;; (dirvish-peek-mode)             ; Preview files in minibuffer
  (dirvish-side-follow-mode)      ; similar to `treemacs-follow-mode'
  (setq dirvish-mode-line-format
        '(:left (sort symlink) :right (omit yank index)))
  (setq dirvish-attributes           ; The order *MATTERS* for some attributes
        '(vc-state subtree-state nerd-icons collapse git-msg file-time file-size)
        dirvish-side-attributes
        '(vc-state nerd-icons collapse file-size))
  ;; open large directory (over 20000 files) asynchronously with `fd' command
  (setq dirvish-large-directory-threshold 20000)
  (setq dirvish-side-open-file-action nil)
  :bind ; Bind `dirvish-fd|dirvish-side|dirvish-dwim' as you see fit
  (("C-c f" . dirvish)
   :map dirvish-mode-map               ; Dirvish inherits `dired-mode-map'
   
   ("<mouse-1>" . dirvish-subtree-toggle-or-open) ;; left click for expand/collapse dir or open file
   ("<mouse-2>" . dired-mouse-find-file-other-window) ;; middle click for opening file / entering dir in other window
   ("<mouse-3>" . dired-mouse-find-file) ;; right click for opening file / entering dir
   (";"   . dired-up-directory)        ; So you can adjust `dired' bindings here
   ("?"   . dirvish-dispatch)          ; [?] a helpful cheatsheet
   ("a"   . dirvish-setup-menu)        ; [a]ttributes settings:`t' toggles mtime, `f' toggles fullframe, etc.
   ("f"   . dirvish-file-info-menu)    ; [f]ile info
   ("o"   . dirvish-quick-access)      ; [o]pen `dirvish-quick-access-entries'
   ("s"   . dirvish-quicksort)         ; [s]ort flie list
   ("r"   . dirvish-history-jump)      ; [r]ecent visited
   ("l"   . dirvish-ls-switches-menu)  ; [l]s command flags
   ("v"   . dirvish-vc-menu)           ; [v]ersion control commands
   ("*"   . dirvish-mark-menu)
   ("y"   . dirvish-yank-menu)
   ("N"   . dirvish-narrow)
   ("^"   . dirvish-history-last)
   ("TAB" . dirvish-subtree-toggle)
   ("M-f" . dirvish-history-go-forward)
   ("M-b" . dirvish-history-go-backward)
   ("M-e" . dirvish-emerge-menu)))



(defun dirvish-side--new (path)
  "Open a side session in PATH."
  (let ((bname buffer-file-name)
        (dv (or (dirvish--get-session 'type 'side)
                (dirvish--new
                 :type 'side
                 :dedicated t
                 :root-conf #'dirvish-side-root-conf
                 :root-window-fn #'dirvish-side-root-window-fn
                 :open-file #'dirvish-side-open-file))))
    (with-selected-window (dirvish--create-root-window dv)
      (dirvish--find-entry 'find-alternate-file path)
      (cond ((not bname) nil)
            (dirvish-side-auto-expand
             (dirvish-subtree-expand-to bname))
            (t (dired-goto-file bname))))))



(defun dirvish-side-open-file (dv find-fn file)
  "Open FILE using FIND-FN for default DV sessions."
  (message "OK GO")
  (let ((idx (current-buffer)) fbuf)
    (unwind-protect (if (eq find-fn 'find-file-other-window)
                        (funcall find-fn file) ; a new window is split
                      (dirvish-save-dedication (funcall find-fn file)))
      (cond ((eq (setq fbuf (current-buffer)) idx) nil)
            ((eq find-fn 'find-file-other-window) (dirvish--clear-session dv))
            (t (dirvish--clear-session dv)
               (setf (dv-curr-layout dv) nil)
               (if (buffer-live-p idx) ; `find-alternate-file' kills idx
                   (message "yooo no")
                   (dirvish-save-dedication (switch-to-buffer idx))
                 (delete-window))
;;               (when (dirvish-curr) (other-window 1))
               (when (functionp dirvish-side-open-file-action)
                 (funcall dirvish-side-open-file-action))
;;               (dirvish-save-dedication (switch-to-buffer fbuf))
               )))))

(dirvish-side "~/n/projects")

(provide 'ui)
