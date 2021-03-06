;;; siren-scss.el --- jimeh's Emacs Siren: scss-mode configuration.

;;; Commentary:

;; Basic configuration for scss-mode.

;;; Code:

(require 'siren-css)

(use-package scss-mode
  :mode "\\.scss\\'"

  :config
  ;; turn off annoying auto-compile on save
  (setq scss-compile-at-save nil)

  (defun siren-scss-mode-defaults ()
    (siren-css-mode-defaults))

  (setq siren-scss-mode-hook 'siren-scss-mode-defaults)
  (add-hook 'scss-mode-hook (lambda () (run-hooks 'siren-scss-mode-hook))))

(provide 'siren-scss)
;;; siren-scss.el ends here
