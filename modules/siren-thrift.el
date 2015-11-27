;;
;; coffeescript
;;

(require 'siren-programming)

(siren-require-packages '(thrift))

(defun siren-thrift-mode-defaults ()
  (siren-prog-mode-defaults)

  (setq tab-width 2)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode)
  (subword-mode +1))

(setq siren-thrift-mode-hook 'siren-thrift-mode-defaults)

(add-hook 'thrift-mode-hook (lambda ()
                              (run-hooks 'siren-thrift-mode-hook)))


(provide 'siren-thrift)
