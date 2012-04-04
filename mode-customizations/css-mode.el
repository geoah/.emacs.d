(add-hook 'css-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (linum-mode t)
            (fci-mode)
            (setq css-indent-offset 2)
            (setq highlight-indentation-offset 2)
            (highlight-indentation-mode)
            (define-key css-mode-map (kbd "RET") 'newline-and-indent)))
