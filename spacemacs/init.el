;; Spacemacs settings
(setq-default
 dotspacemacs-default-font '("Hack"
                             :size 24
                             :weight normal
                             :width normal
                             :powerline-scale 1.5)
 dotspacemacs-themes '(sanityinc-tomorrow-night)
 ;; dotspacemacs-themes '(spacemacs-dark)
 dotspacemacs-smooth-scrolling t
 )

;; Before loading packages
(defun dotspacemacs/init ()
  )

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-configuration-layers '(auto-completion
                                       docker
                                       themes-megapack
                                       git
                                       github
                                       version-control
                                       restclient
                                       syntax-checking
                                       c-c++
                                       html
                                       markdown
                                       org
                                       (haskell :variables haskell-completion-backend 'ghc-mod)
                                       shell-scripts
                                       (shell :variables shell-default-shell 'eshell)
                                       sql
                                       yaml)
    dotspacemacs-excluded-packages '(niflheim-theme firebelly-theme monochrome-theme pastels-on-dark-theme tronesque-theme hlint-refactor)
   )


  ;; Add packages that are not included in layers
  ;; (setq-default dotspacemacs-additional-packages '(rudel irfc company-restclient company-shell))
  (setq-default dotspacemacs-additional-packages '(company-restclient company-shell))
  )

;; called after dotspacemacs/init and before dotspacemaces/user-config
(defun dotspacemacs/user-init ()
  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  ;; (push '(ensime . "melpa-stable") package-pinned-packages)
  )

;; After loading packages
(defun dotspacemacs/user-config ()
  (windmove-default-keybindings)
  (setq-default truncate-lines t)
  (setq-default flycheck-disabled-checkers '(haskell-hlint))
  (setq solarized-high-contrast-mode-line t)
  (setq x-underline-at-descent-line t)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
                                        ; (setq projectile-enable-caching t)
                                        ; (define-globalized-minor-mode global-flycheck-pos-tip-mode flycheck-pos-tip-mode flycheck-pos-tip-mode)
                                        ; (global-flycheck-pos-tip-mode 1)

                                        ; (custom-set-variables
                                        ;  '(global-hl-line-mode t)
                                        ;  '(ring-bell-function (quote ignore) t))

  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
   '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
   ;; (hl-line ((t (:background "#3d3d3d"))))
   )

  ;; personal config
  (linum-mode)
  (setq linum-format "%4d \u2502")
  (spacemacs/declare-prefix "mo" "custom-major-commands")

  ;; re-builder config
  (require 're-builder)
  (setq reb-re-syntax 'string)

  ;; helm config
  (require 'helm)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

  ;; company config
  (require 'company)
  ;; (setq company-idle-delay 2)
  (setq company-idle-delay nil)
  (define-key global-map (kbd "\C-ct") 'company-manual-begin)
  ;; (spacemacs/set-leader-keys (kbd "mot") 'company-manual-begin)

  ;; company-restclient config
  (require 'company-restclient)
  ;; (add-hook 'restclient-mode-hook
  ;;   (lambda ()
  ;;     (set (make-local-variable 'company-backends) '(company-restclient))))
  (add-to-list 'company-backends 'company-restclient)

  ;; yasnippet config
  (define-key global-map (kbd "C-c s") 'helm-yas-complete)
  (setq yas-indent-line 'fixed)

  ;; shell config
  ;; (setq-default dotspacemacs-configuration-layers
  ;;   '(shell :variables shell-default-term-shell "/usr/local/bin/zsh"))

  ;; company-shell config
  (require 'company-shell)
  (add-to-list 'company-backends 'company-shell)
  (add-to-list 'company-backends 'company-fish-shell)
  (setq company-shell-modes '(sh-mode fish-mode shell-mode eshell-mode))
  (setq company-fish-shell-modes '(fish-mode shell-mode eshell-mode))

  ;; multi-cursor/evil-mc configuration..
  (require 'evil-mc)
  (global-evil-mc-mode)

  ;; org-indent config
  (require 'org-indent)
  (setq org-startup-indented 't)

  ;; org config
  (require 'org)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)

  ;; tabs
  (setq-default tab-width 2 indent-tabs-mode nil)

  ;; whitespace config
  ;;(require 'whitespace)
  ;;(setq whitespace-style (quote (spaces)))
  ;;(setq whitespace-display-mappings '(
  ;;  (space-mark 32 [182] [46])
  ;;  ))
  ;;(autoload 'global-whitespace-toggle-options "whitespace" "Toggle global whitespace options" t)

  ;; diff-hl
  '(version-control :variables version-control-diff-tool 'diff-hl)
  '(version-control :variables version-control-global-margin t)
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#373b41" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#c5c8c6"))
 '(beacon-color "#cc6666")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#373b41" t)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(magit-fetch-arguments (quote ("--prune")))
 '(magit-log-arguments
   (quote
    ("--graph" "--color" "--decorate" "--show-signature" "-n256")))
 '(magit-merge-arguments (quote ("--ff-only")))
 '(magit-rebase-arguments (quote ("--interactive")))
 '(package-selected-packages
   (quote
    (white-sand-theme rebecca-theme org-mime exotica-theme elfeed-web simple-httpd elfeed-org elfeed-goodies ace-jump-mode noflet elfeed magit-gh-pulls github-search github-clone ghub let-alist github-browse-file gist gh marshal logito pcache ht yapfify web-mode tagedit powerline slim-mode scss-mode sass-mode pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pcre2el spinner org-category-capture alert log4e gntp org-plus-contrib omnisharp shut-up live-py-mode less-css-mode hydra hy-mode dash-functional parent-mode helm-pydoc projectile request helm-css-scss haml-mode ham-mode markdown-mode html-to-markdown gitignore-mode fringe-helper git-gutter+ git-gutter pos-tip flycheck pkg-info epl flx magit git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree highlight emmet-mode dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diminish autothemer cython-mode csharp-mode company-web web-completion-data restclient know-your-http-well ghc haskell-mode company-math math-symbol-lists company-anaconda company inf-ruby bind-map bind-key yasnippet auctex anaconda-mode pythonic f dash s helm avy helm-core async auto-complete popup yaml-mode utop tuareg caml ocp-indent merlin fsharp-mode company-quickhelp zonokai-theme zenburn-theme zen-and-art-theme xterm-color ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme sql-indent spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle shell-pop seti-theme rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restclient-helm restart-emacs rcirc-notify rcirc-color rbenv rake rainbow-delimiters railscasts-theme purple-haze-theme puppet-mode professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pbcopy pastels-on-dark-theme paradox osx-trash osx-dictionary orgit organic-green-theme org-projectile org-present org-pomodoro org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-restclient ob-http noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme lush-theme lorem-ipsum linum-relative link-hint light-soap-theme launchctl jbeans-theme jazz-theme irfc ir-black-theme intero insert-shebang inkpot-theme info+ indent-guide hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gmail-message-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flymd flycheck-pos-tip flycheck-haskell flx-ido flatui-theme flatland-theme fish-mode firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help engine-mode edit-server dumb-jump dracula-theme django-theme disaster diff-hl deft darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-statistics company-shell company-restclient company-ghci company-ghc company-coq company-cabal company-c-headers company-auctex column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmm-mode cmake-mode clues-theme clean-aindent-mode clang-format chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme base16-theme badwolf-theme auto-yasnippet auto-highlight-symbol apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

