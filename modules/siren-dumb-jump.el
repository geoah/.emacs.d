;;; siren-dumb-jump.el --- jimeh's Emacs Siren: dumb-jump configuration.

;;; Commentary:

;; Basic configuration for dumb-jump.

;;; Code:

(use-package dumb-jump
  :bind
  ("M-g o" . dumb-jump-go-other-window)
  ("M-g j" . dumb-jump-go)
  ("M-g b" . dumb-jump-back)
  ("M-g i" . dumb-jump-go-prompt)
  ("M-g x" . dumb-jump-go-prefer-external)
  ("M-g z" . dumb-jump-go-prefer-external-other-window)

  :config
  (setq dumb-jump-selector 'ivy))

(provide 'siren-dumb-jump)
;;; siren-dumb-jump.el ends here
