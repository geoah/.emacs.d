;;; siren-company.el --- jimeh's Emacs Siren: company configuration.

;;; Commentary:

;; Basic configuration for company. Auto completion on steroids.

;;; Code:

(siren-require-packages '(company))

(require 'company)

(setq company-begin-commands '(self-insert-command)
      company-dabbrev-downcase nil
      company-echo-delay 0
      company-idle-delay 0.3
      company-minimum-prefix-length 2
      company-tooltip-limit 20)

;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
(setq company-tooltip-flip-when-above t)

(global-company-mode 1)


;; Trigger completion popup by pressing tab
;;  - from: https://github.com/company-mode/company-mode/issues/94#issuecomment-40884387
(define-key company-mode-map [remap indent-for-tab-command]
  'company-indent-for-tab-command)

(define-key company-active-map (kbd "C-n") #'company-select-next)
(define-key company-active-map (kbd "C-p") #'company-select-previous)

(setq tab-always-indent 'complete)

(defvar completion-at-point-functions-saved nil)

(defun company-indent-for-tab-command (&optional arg)
  (interactive "P")
  (let ((completion-at-point-functions-saved completion-at-point-functions)
        (completion-at-point-functions '(company-complete-common-wrapper)))
    (indent-for-tab-command arg)))

(defun company-complete-common-wrapper ()
  (let ((completion-at-point-functions completion-at-point-functions-saved))
    (company-complete-common)))

(provide 'siren-company)
;;; siren-company.el ends here