;;; siren-anzu.el --- jimeh's Emacs Siren: anzu configuration.

;;; Commentary:

;; Basic configuration for anzu.

;;; Code:

(use-package anzu
  :config
  (set-face-attribute 'anzu-mode-line nil
                      :foreground "yellow" :weight 'bold)

  (setq anzu-mode-lighter ""
        anzu-deactivate-region t
        anzu-search-threshold 1000
        anzu-replace-threshold 50
        anzu-replace-to-string-separator " => ")

  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key (kbd "C-c C-r") 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key (kbd "C-x C-r") 'anzu-query-replace-regexp)

  (global-anzu-mode +1))

(provide 'siren-anzu)
;;; siren-anzu.el ends here
