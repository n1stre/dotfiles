(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;; Add custom folders to load-path so Emacs can find our modules
(add-to-list 'load-path "~/.emacs.d/lisp/lib/")
(add-to-list 'load-path "~/.emacs.d/lisp/core/")
(add-to-list 'load-path "~/.emacs.d/lisp/modules/")

;; Load core system configs
(require 'core-packages) ;; package manager setup
(require 'core-ui) ;; UI tweaks (theme, bars, etc.)
(require 'core-keybinds) ;; global keybindings

;; Load feature modules
(require 'treesitter) 
(require 'lsp) ;; language server support
(require 'linting) 
(require 'completion) ;; minibuffer + fuzzy search
(require 'formatting) 
(require 'git) ;; git integration
(require 'ui.treemacs) 

(insert "Hello")
