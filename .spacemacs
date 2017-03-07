;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     ;; git
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; rust
                                      cargo
                                      flycheck-rust
                                      racer
                                      rust-mode

                                      ;; json
                                      json-mode

                                      ;; javascript
                                      tern
                                      company-tern

                                      ;; glsl
                                      glsl-mode

                                      ;; spell checking
                                      flyspell-correct-helm
                                      flycheck-pos-tip

                                      ;; web-mode
                                      web-mode

                                      ;; irony
                                      irony
                                      irony-eldoc
                                      company-irony
                                      flycheck-irony
                                      company-irony-c-headers

                                      ;; tools
                                      ag
                                      avy
                                      company
                                      evil-mc
                                      flycheck
                                      golden-ratio
                                      grizzl
                                      highlight-chars
                                      magit
                                      ;; rtags

                                      ;; modes
                                      cmake-mode
                                      markdown-mode
                                      protobuf-mode
                                      toml-mode
                                      yaml-mode
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    smartparens-config
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages nil))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'source
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 30
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 10
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  ;; Emacs
  (setq-default default-tab-width 4)

  ;; Magit
  (global-set-key (kbd "M-m g s") 'magit-status)
  (global-set-key (kbd "M-m g g") 'magit-dispatch-popup)

  (eval-after-load 'git-commit-modo
    '(progn
       (flyspell-mode)
       ))

  ;; Projectile
  (setq-default projectile-enable-caching t)
  (setq-default projectile-completion-system 'grizzl)

  ;; Company
  (setq-default company-idle-delay 0.3)
  (setq-default company-minimum-prefix-length 1)
  (setq-default company-selection-wrap-around t)
  (global-company-mode 1)
  (eval-after-load 'company
    '(progn
       (define-key company-active-map (kbd "TAB") 'company-select-next)
       (define-key company-active-map [tab] 'company-select-next)))

  ;; Flycheck
  (setq-default flycheck-display-errors-delay 0.1)

  ;; irony
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)

  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))

  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'irony-mode-hook 'irony-eldoc)
  (add-hook 'irony-mode-hook 'flycheck-mode)

  (add-hook 'flycheck-mode-hook 'flycheck-irony-setup)

  (add-to-list 'company-backends '(company-irony-c-headers company-irony))

  ;; golden-ratio-mode
  (golden-ratio-mode 1)
  (setq-default golden-ratio-auto-scale t)
  (setq-default golden-ratio-exclude-modes '("ediff-mode"
                                             "IELM"
                                             "dired-mode"
                                             "eshell-mode"
                                             "gdb-breakpoints-mode"
                                             "gdb-disassembly-mode"
                                             "gdb-frames-mode"
                                             "gdb-inferior-io-mode"
                                             "gdb-inferior-io-mode"
                                             "gdb-locals-mode"
                                             "gdb-memory-mode"
                                             "gdb-registers-mode"
                                             "gdb-threads-mode"
                                             "gud-mode"
                                             "gud-mode"
                                             "helm-mode"
                                             "magit-log-mode"
                                             "magit-reflog-mode"
                                             "magit-status-mode"
                                             "minimap-mode"))

  ;; mc
  (global-evil-mc-mode 1)
  (evil-define-key 'normal map
    (kbd "C-m") 'evil-mc-skip-and-goto-next-match
    )
  (evil-define-key 'visual map
    (kbd "C-m") 'evil-mc-skip-and-goto-next-match
    )

  ;; rtags
  (load "~/Programs/rtags/src/rtags.el")
  (load "~/Programs/rtags/src/rtags-helm.el")

  (setq rtags-path "~/Programs/rtags/build/bin/")

  ;; Racer
  (setq-default racer-cmd "~/.cargo/bin/racer")
  (setq-default racer-rust-src-path "~/Programs/rust/src")

  ;; ispell ccat
  (setq ispell-local-dictionary-alist
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" t ("-d" "en_US") nil iso-8859-1)
          ))
  (setq ispell-program-name "hunspell"
        ispell-dictionary "en_US")

  ;; flyspell
  (setq flyspell-issue-message-flag nil)

  ;; flyspell correction
  (global-set-key (kbd "C-c c") 'flyspell-correct-word-generic)
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode))

  (global-set-key (kbd "M-m t t") 'hc-toggle-highlight-tabs)

  ;; Ag
  (setq-default ag-reuse-window t)
  (setq-default ag-reuse-buffers t)

  ;; C
  (setq-default c-default-style "linux"
                c-basic-offset 4
                c-toggle-auto-state 0)

  ;; C++

  ;; Javascript
  (add-to-list 'company-backends 'company-tern)

  ;; Rust
  (global-set-key (kbd "M-m C-c B") 'cargo-process-bench)
  (global-set-key (kbd "M-m C-c b") 'cargo-process-build)
  (global-set-key (kbd "M-m C-c d") 'cargo-process-doc)
  (global-set-key (kbd "M-m C-c r") 'cargo-process-run)

  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'rust-mode-hook #'flyspell-prog-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)

  (add-hook 'flycheck-mode-hook 'flycheck-rust-setup)

  (setq company-tooltip-align-annotations t)

  ;; Javascript
  (setq-default js-indent-level 2)

  ;; cmake
  (setq-default cmake-indent 4)

  ;; other
  (load "/usr/share/clang/clang-format.el")
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-list-file-prefix "/home/kk/.emacs.d/.cache/auto-save/")
 '(company-auto-complete t)
 '(company-auto-complete-chars nil)
 '(company-idle-delay 0.3)
 '(company-minimum-prefix-length 3)
 '(company-rtags-begin-after-member-access nil)
 '(company-selection-wrap-around t)
 '(company-tooltip-align-annotations t)
 '(company-tooltip-idle-delay 0)
 '(global-company-mode t)
 '(irony-additional-clang-options (quote ("-std=c++11" "-isystem=/usr/include/c++/6.2.1/")))
 '(irony-completion-trigger-commands
   (quote
    (c-context-line-break c-scope-operator c-electric-backspace c-electric-brace c-electric-colon c-electric-lt-gt c-electric-paren c-electric-pound c-electric-semi&comma c-electric-slash c-electric-star)))
 '(magit-commit-arguments (quote ("--signoff")))
 '(package-selected-packages
   (quote
    (mmm-mode markdown-toc gh-md company-irony-c-headers packed bind-map company-tern dash-functional tern js2-mode yaml-mode protobuf-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic rtags irony-eldoc flycheck-irony company-irony irony which-key web-mode use-package toml-mode spaceline powerline restart-emacs racer persp-mode pcre2el paradox spinner org-plus-contrib neotree magit magit-popup git-commit with-editor macrostep info+ hydra hungry-delete hl-todo helm-make helm-ag flyspell-correct-helm flyspell-correct flycheck-pos-tip eyebrowse expand-region evil-surround evil-nerd-commenter evil-mc evil-matchit dumb-jump company-ycmd company cargo rust-mode aggressive-indent ag ace-link iedit smartparens highlight ycmd request flycheck dash projectile helm helm-core async spacemacs-theme ws-butler window-numbering volatile-highlights vi-tilde-fringe uuidgen toc-org request-deferred rainbow-delimiters quelpa pos-tip popwin popup pkg-info org-bullets open-junk-file move-text markdown-mode lorem-ipsum linum-relative link-hint json-mode indent-guide ido-vertical-mode highlight-parentheses highlight-numbers highlight-indentation highlight-chars help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-flx helm-descbinds grizzl google-translate golden-ratio glsl-mode flycheck-ycmd flycheck-rust flx-ido fill-column-indicator fancy-battery exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav diminish define-word column-enforce-mode cmake-mode clean-aindent-mode bind-key auto-highlight-symbol auto-compile adaptive-wrap ace-window ace-jump-helm-line)))
 '(rtags-path "/home/kk/Programs/rtags/build/bin/")
 '(rtags-use-helm t)
 '(rust-format-on-save t)
 '(savehist-autosave-interval 60)
 '(use-package-inject-hooks t)
 '(ycmd-eldoc-always-semantic-server-query-modes t)
 '(ycmd-global-config "/home/kk/.ycm_extra_conf.py")
 '(ycmd-min-num-chars-for-completion 0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
