(use-package dashboard
  :ensure t
  :config
  
  ;; Set the title
  (setq dashboard-banner-logo-title "Well Hellow There...")

  ;; Set the banner
  (setq dashboard-startup-banner 4)
  ;; Value can be:
  ;;  - 'official which displays the official emacs logo.
  ;;  - 'logo which displays an alternative emacs logo PNG or braille.
  ;;  - 'logo-ansi-truecolor which displays an alternative emacs logo
  ;;    using unicode block characters and ANSI escape sequences.
  ;;  - 'logo-ansi-256color which displays an alternative emacs logo
  ;;    using unicode block characters and ANSI escape sequences.
  ;;  - 'logo-braille which displays an alternative emacs logo
  ;;    using unicode braille characters.
  ;;  - an integer which displays one of the text banners
  ;;    (see dashboard-banners-directory files).
  ;;  - a string that specifies a path for a custom banner
  ;;    currently supported types are gif/image/text/xbm.
  ;;  - a cons of 2 strings which specifies the path of an image to use
  ;;    and other path of a text file to use if image isn't supported.
  ;;    (cons "path/to/image/file/image.png" "path/to/text/file/text.txt").
  ;;  - a list that can display an random banner,
  ;;    supported values are: string (filepath), 'official, 'logo and integers.

  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)

  ;; vertically center content
  (setq dashboard-vertically-center-content t)

  ;; To disable shortcut "jump" indicators for each section, set
  (setq dashboard-show-shortcuts t)


  (setq dashboard-items '((recents   . 10)
                          (bookmarks . 5)
                          ;; (projects  . 5)
                          (agenda    . 5)
                          ;; (registers . 5) 
			  )
	)

  (setq dashboard-display-icons-p t)     ; display icons on both GUI and terminal
  (setq dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package
  
  (dashboard-setup-startup-hook))


(provide 'ui.dashboard)
