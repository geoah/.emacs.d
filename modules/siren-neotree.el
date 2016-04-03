;;; siren-neotree.el --- jimeh's Emacs Siren: neotree configuration.

;;; Commentary:

;; Basic configuration for neotree.

;;; Code:

(siren-require-packages '(neotree))

(require 'neotree)
(global-set-key (kbd "C-x p") 'neotree-toggle)

(setq neo-show-hidden-files t)
(setq neo-smart-open nil)
(setq neo-dont-be-alone t)
(setq neo-theme (quote nerd))
(setq neo-window-width 54)

(provide 'siren-neotree)
;;; siren-neotree.el ends here