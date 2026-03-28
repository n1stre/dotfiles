(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

(add-to-list 'load-path "~/.emacs.d/lisp/lib/")
(add-to-list 'load-path "~/.emacs.d/lisp/core/")
(add-to-list 'load-path "~/.emacs.d/lisp/modules/")

(require 'core-packages)
(require 'core-ui)
(require 'core-keybinds)

(require 'ui.theme)
(require 'ui.treemacs)

(require 'treesitter) 
(require 'lsp)
(require 'linting) 
(require 'completion)
(require 'formatting) 
(require 'git)

(insert "Hello")
