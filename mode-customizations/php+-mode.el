(add-to-list 'auto-mode-alist '("\\.php\\'" . php+-mode))

(defun customizations-for-php+-mode ()
  (interactive)
  (setq whitespace-action (quote (auto-cleanup)))
  (flyspell-prog-mode)
  (linum-mode t)
  (fci-mode)
  (auto-complete-mode)
  (setq php-basic-offset 2)
  (setq tab-width 2)
  (setq highlight-indentation-offset 2)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode))

(add-hook 'php+-mode-hook 'customizations-for-php+-mode)
