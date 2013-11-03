(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
;; '(custom-enabled-themes (quote (wheatgrass)))

)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Enable copy and pasting from clipboard
 (setq x-select-enable-clipboard t)

;; Rails casts theme
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/site-lisp/themes/color-theme-railscasts.el")
(color-theme-railscasts)

 ;; Auto-complete configuration
(require 'auto-complete-config)
 (add-to-list 'ac-dictionary-directories "~/.emacs.d/.cask/24.3.50.1/elpa/auto-complete-20130724.1750/dict")
 (ac-config-default)
 (setq ac-ignore-case nil)
 (add-to-list 'ac-modes 'enh-ruby-mode)
 (add-to-list 'ac-modes 'web-mode)

;; Smartparens config
(require 'smartparens-config)
 (require 'smartparens-ruby)
 (smartparens-global-mode)
 (show-smartparens-global-mode t)
 (sp-with-modes '(rhtml-mode)
   (sp-local-pair "<" ">")
   (sp-local-pair "<%" "%>"))

;; Projectile config
 (require 'grizzl)
 (projectile-global-mode)
 (setq projectile-enable-caching t)
 (setq projectile-completion-system 'grizzl)
 ;; Press Command-p for fuzzy find in project
;; (globbal-set-key (kbd "s-p") 'projectile-find-file)
 ;; Press Combmand-b for fuzzy switch bufferxqq
;; (global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

;; Robe mode config
(add-hook 'ruby-mode-hook 'robe-mode)

;; Ruby tools mode
(require 'ruby-tools)
