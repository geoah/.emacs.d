;;; siren-linux.el --- jimeh's Emacs Siren: Linux specific settings.

;;; Commentary:

;; Linux specific settings and tweaks for Siren.

;;; Code:

;; Set default font
(if window-system
    (set-face-attribute 'default nil :family "Monaco" :height 80))

;; Keybindinds
(global-set-key (kbd "s-<return>") 'siren-linux-toggle-fullscreen)

;; Fullscreen helper function
(defun siren-linux-toggle-fullscreen ()
  "Toggle full screen on X11."
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(provide 'siren-linux)
;;; siren-linux.el ends here
