;; git version

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(let ((cask_filepath "~/.emacs.d/.cask/cask.el"))
  (if (file-exists-p cask_filepath)
      (require 'cask "~/.emacs.d/.cask/cask.el")
    ;; homebrew cask
    (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
    )
  )
(cask-initialize)

(set-keyboard-coding-system nil)
(global-git-gutter-mode +1)


(setq mac-option-key-is-meta t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(toggle-frame-fullscreen)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(ansi-term-color-vector
   [unspecified "#1F1611" "#660000" "#144212" "#EFC232" "#5798AE" "#BE73FD" "#93C1BC" "#E6E1DC"])
 '(coffee-args-compile (quote ("-c" "--bare")))
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "f5eb916f6bd4e743206913e6f28051249de8ccfd070eae47b5bde31ee813d55f" "11636897679ca534f0dec6f5e3cb12f28bf217a527755f6b9e744bd240ed47e1" "19352d62ea0395879be564fc36bc0b4780d9768a964d26dfae8aad218062858d" "b06aaf5cefc4043ba018ca497a9414141341cb5a2152db84a9a80020d35644d1" "3dafeadb813a33031848dfebfa0928e37e7a3c18efefa10f3e9f48d1993598d3" "e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" "c4e6fe8f5728a5d5fd0e92538f68c3b4e8b218bcfb5e07d8afff8731cc5f3df0" "cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" default)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(fci-rule-character-color "#452E2E")
 '(fci-rule-color "#383838")
 '(js-indent-level 2)
 '(org-agenda-files (quote ("~/org/todo.org")))
 '(projectile-completion-system (quote helm))
 '(projectile-tags-command
   "ctags -Re -f %s %s --exclude=node_modules --exclude=public")
 '(projectile-tags-file-name ".tags")
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tool-bar-position (quote top))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))


;; HELM =========================
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)


;; PROJECTILE ====================
(projectile-global-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
;;(setq projectile-rails-keymap-prefix (kbd "C-c p C-r"))

(setq-default cursor-type 'bar)
(add-hook 'ruby-mode-hook 'robe-mode)

(setq backup-directory-alist
      `((".*" . , temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" , temporary-file-directory t)))

(powerline-default-theme)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)


;; ORG MODE Options ============
(setq org-log-done 'time)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)

(global-set-key "\C-cb" 'org-iswitchb)

;; MARKDOWN MODE Options ======
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; == Note taking confs
(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

;; MAGIT Options ===========================
(global-set-key (kbd "C-x g") 'magit-status)


;; XCLIP Share with OS clipboard
(xclip-mode 1)

;; Whitespace mode
(global-whitespace-mode 1)
;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

;; COFFEE MODE
;; coffeescript
(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
     (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))


;; MOUSE Configuration ======================
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)

;; Disables bell when cursor gets to the end
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char scroll-down-line scroll-up-line))
    (ding)))
(setq ring-bell-function 'my-bell-function)
