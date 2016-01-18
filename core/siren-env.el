;;
;; env
;;

;; Nix package manager
(push "~/.nix-profile/bin" exec-path)

;; Homebrew
(push "/usr/local/bin" exec-path)

;; rbenv
(setq exec-path (cons "~/.rbenv/bin" exec-path))
(setenv "PATH" (concat "~/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.rbenv/shims" exec-path))
(setenv "PATH" (concat "~/.rbenv/shims:" (getenv "PATH")))

;; node.js
(setq exec-path (cons "~/.nvm/versions/node/v5.4.0/bin" exec-path))
(setenv "PATH" (concat "~/.nvm/versions/node/v5.4.0/bin:" (getenv "PATH")))


(provide 'siren-env)
