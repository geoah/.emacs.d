;;; siren-ruby.el --- jimeh's Emacs Siren: ruby-mode configuration.

;;; Commentary:

;; Basic configuration for ruby-mode.

;;; Code:

(use-package inf-ruby
  :defer t)

(use-package rspec-mode
  :defer t
  :init
  (eval-after-load 'rspec-mode '(rspec-install-snippets)))

(use-package ruby-refactor
  :defer t)

(use-package ruby-tools
  :defer t)

(use-package yari
  :defer t
  :init
  (define-key 'help-command (kbd "R") 'yari))

(require 'siren-programming)
(require 'siren-company)
(require 'siren-smartparens)
(require 'siren-toggle-quotes)

(require 'smartparens-ruby)
(require 'rubocopfmt)
(require 'ruby-mode)

;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cap\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Podfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.podspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Appraisals\\'" . ruby-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

;; Set up hs-mode (HideShow) for Ruby
(add-to-list 'hs-special-modes-alist
             `(ruby-mode
               ,(rx (or "def" "class" "module" "do" "if" "case")) ;; Block start
               ,(rx (or "end"))                                   ;; Block end
               ,(rx (or "#" "=begin"))                            ;; Comment start
               ruby-forward-sexp nil))

;; Make company-mode play nice
(push 'ruby-mode company-dabbrev-code-modes)

(defun siren-ruby-mode-defaults ()
  (siren-prog-mode-defaults)

  (setq c-tab-always-indent nil
        rspec-primary-source-dirs '("app")
        ruby-align-chained-calls t
        ruby-insert-encoding-magic-comment t
        ruby-refactor-add-parens t
        ruby-use-smie t
        tab-width 2)

  (rubocopfmt-mode)
  (ruby-tools-mode +1)
  (hs-minor-mode 1)
  (company-mode +1)
  (subword-mode +1)
  (highlight-indentation-current-column-mode)
  (hideshowvis-enable)

  (let ((map ruby-mode-map))
    (define-key map (kbd "C-j") 'newline-and-indent)
    (define-key map (kbd "RET") 'newline-and-indent)
    (define-key map (kbd "C-c C-h") 'siren-toggle-hiding)
    (define-key map (kbd "C-c C-l") 'goto-line)
    (define-key map (kbd "C-M-f") 'sp-ruby-forward-sexp)
    (define-key map (kbd "C-M-b") 'sp-ruby-backward-sexp))

  (let ((map ruby-tools-mode-map))
    (define-key map (kbd "C-'") 'toggle-quotes)))

(setq siren-ruby-mode-hook 'siren-ruby-mode-defaults)
(add-hook 'ruby-mode-hook (lambda ()
                            (run-hooks 'siren-ruby-mode-hook)))

(provide 'siren-ruby)
;;; siren-ruby.el ends here
