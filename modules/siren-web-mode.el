;;; siren-web-mode.el --- jimeh's Emacs Siren: web-mode configuration.

;;; Commentary:

;; Basic configuration for web-mode.

;;; Code:

(require 'siren-programming)

(use-package web-mode
  :mode
  "\\.html\\'"
  "\\.html.erb\\'"

  :config
  (setq web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-markup-indent-offset 2
        web-mode-sql-indent-offset 2)

  (defun siren-web-mode-mode-hook ()
    "Default tweaks for `web-mode'."
    (setq tab-width 2)

    (siren-prog-mode-defaults)
    (company-mode +1)
    (fci-mode -1)
    (hideshowvis-enable)
    (hs-minor-mode +1)
    (highlight-indentation-current-column-mode)
    (highlight-indentation-set-offset 2)
    (subword-mode +1)
    (let ((map web-mode-map))
      (define-key map (kbd "C-j") 'newline-and-indent)
      (define-key map (kbd "C-c C-h") 'siren-toggle-hiding)))

  (add-hook 'web-mode-hook 'siren-web-mode-mode-hook))

(provide 'siren-web-mode)
;;; siren-web-mode.el ends here
