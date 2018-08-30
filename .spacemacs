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
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'nil
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     html
     markdown
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; ivy
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     ;; git
     ;; markdown
     org
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
                                      ;; lsp
                                      lsp-mode
                                      lsp-ui
                                      lsp-rust
                                      lsp-haskell
                                      company-lsp

                                      ;; c++
                                      cquery

                                      ;; rust
                                      cargo
                                      flycheck-rust
                                      racer
                                      rust-mode

                                      ;; csharp
                                      csharp-mode

                                      ;; elm
                                      elm-mode
                                      flycheck-elm

                                      ;; json
                                      json-mode

                                      ;; javascript
                                      tern
                                      js2-mode
                                      js2-refactor
                                      company-tern

                                      ;; typescript
                                      tide

                                      ;; glsl
                                      glsl-mode

                                      ;; spell checking
                                      flyspell-correct-helm
                                      flycheck-pos-tip

                                      ;; python
                                      elpy

                                      ;; web-mode
                                      web-mode

                                      ;; company
                                      company-flx

                                      ;; tools
                                      ag
                                      avy
                                      company
                                      evil-mc
                                      flycheck
                                      golden-ratio
                                      grizzl
                                      magit

                                      ;; haskell
                                      haskell-mode

                                      ;; modes
                                      cmake-mode
                                      pkgbuild-mode
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
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((projects . 7)
                                (recents . 5))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
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
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 18
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   dotspacemacs-default-font '("hermit"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The command-key
   dotspacemacs-command-key "SPC"
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
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
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

  (global-key-binding (kbd "<f12>") 'xref-find-definitions)
  (global-key-binding (kbd "<f2>") 'lsp-rename)

  ;; Text-mode
  (add-hook 'text-mode-hook 'flyspell-mode)

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

  ;; cpp
  (add-hook 'c++-mode-hook 'lsp-cquery-enable)

  (eval-after-load 'c++-mode
    (lambda ()
      (define-key c++-mode-map (kbd "<f12>") 'xref-find-definitions)
      (define-key c++-mode-map (kbd "<f2>") 'lsp-rename)
    ))

  ;; Company
  (setq-default company-idle-delay 0.1)
  (setq-default company-minimum-prefix-length 1)
  (setq-default company-selection-wrap-around t)

  (eval-after-load 'company-mode
    (lambda ()
      (add-to-list company-backends 'company-elm)
      (add-to-list 'company-backends 'company-lsp)


      (define-key company-active-map (kbd "TAB") 'company-select-next)
      (define-key company-active-map [tab] 'company-select-next)
      (define-key company-active-map (kbd "C-n") 'company-select-next)
      (define-key company-active-map (kbd "C-p") 'company-select-previous)
      ))


  ;; Flycheck
  (setq-default flycheck-display-errors-delay 0.1)

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

  ;; Racer
  (setq-default racer-cmd "~/.cargo/bin/racer")
  (setq-default racer-rust-src-path "~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")

  ;; ispell ccat
  (setq ispell-local-dictionary-alist
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" t ("-d" "en_US") nil iso-8859-1)
          ))
  (setq ispell-program-name "hunspell"
        ispell-dictionary "en_US")

  ;; flyspell
  (setq flyspell-issue-message-flag nil)

  ;; flyspell correction
  (global-set-key (kbd "C-c c") 'flyspell-correct-word-at-point)
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode))

  (global-set-key (kbd "M-m t t") 'hc-toggle-highlight-tabs)

  ;; Ag
  (setq-default ag-reuse-window t)
  (setq-default ag-reuse-buffers t)

  ;; Org-pomodoro
  (defun notify-send (title message)
    (call-process "notify-send" nil 0 nil title message)
    )

  (defun save-all-org-buffer-and-notify (title message)
    (org-save-all-org-buffers)
    (notify-send title message)
    )

  (add-hook 'org-pomodoro-started-hook
            (lambda ()
              (notify-send "Pomodoro started!" "Vegitable time!")))
  (add-hook 'org-pomodoro-finished-hook
            (lambda ()
              (notify-send "Pomodoro completed!" "Time for a break.")))
  (add-hook 'org-pomodoro-break-finished-hook
            (lambda ()
              (notify-send "Pomodoro Short Break Finished" "Ready for Another?")))
  (add-hook 'org-pomodoro-long-break-finished-hook
            (lambda ()
              (notify-send "Pomodoro Long Break Finished" "Ready for Another?")))
  (add-hook 'org-pomodoro-killed-hook
            (lambda ()
              (notify-send "Pomodoro Killed" "One does not simply kill a pomodoro!")))

  ;; C
  (setq-default c-default-style "linux"
                c-basic-offset 4
                c-toggle-auto-state 0)

  (add-hook 'after-save-hook 'run-clang-format)
  (defun run-clang-format ()
    (when (eq major-mode 'c++-mode) (clang-format-buffer)))

  ;; Typescript
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    ;; `M-x package-install [ret] company`
    (company-mode +1))

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)

  (add-hook 'typescript-mode-hook #'setup-tide-mode)

  ;; Haskell
  (add-hook 'haskell-mode-hook #'lsp-haskell-enable)
  (add-hook 'haskell-mode-hook 'flycheck-mode)

  ;; Elm
  (add-hook 'flycheck-mode-hook 'flycheck-elm-setup)

  ;; Rust
  (global-set-key (kbd "M-m C-c B") 'cargo-process-bench)
  (global-set-key (kbd "M-m C-c b") 'cargo-process-build)
  (global-set-key (kbd "M-m C-c d") 'cargo-process-doc)
  (global-set-key (kbd "M-m C-c r") 'cargo-process-run)
  (global-set-key (kbd "M-m C-c t") 'cargo-process-test)

  ;; (add-hook 'rust-mode-hook 'lsp-mode)
  (add-hook 'rust-mode-hook 'company-mode)
  (add-hook 'rust-mode-hook 'racer-mode)
  (add-hook 'rust-mode-hook 'flyspell-prog-mode)
  (add-hook 'rust-mode-hook 'eldoc-mode)

  (add-hook 'flycheck-mode-hook 'flycheck-rust-setup)

  ;; Javascript
  (setq-default js-indent-level 2)

  ;; Python
  (elpy-enable)
  (add-hook 'elpy-mode-hook
            (lambda ()
              (define-key elpy-mode-map (kbd "C-c C-f") 'elpy-format-code)
              (add-hook 'before-save-hook 'elpy-format-code)))

  ;; cmake
  (setq-default cmake-indent 4)

  ;; cquery
  (setq-default cquery-executable "cquery")
  (setq-default cquery-extra-init-params '(:completion (:detailedLabel t)))

  ;; lsp
  (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)


  ;; other
  (load "/usr/share/clang/clang-format.el")
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-checkers
   (quote
    (elm tsx-tide typescript-tide ada-gnat asciidoctor asciidoc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint css-stylelint cwl d-dmd dockerfile-hadolint emacs-lisp emacs-lisp-checkdoc erlang-rebar3 erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert go-megacheck groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy javascript-eslint javascript-jshint javascript-standard json-jsonlint json-python-json jsonnet less less-stylelint llvm-llc lua-luacheck lua markdown-markdownlint-cli markdown-mdl nix perl perl-perlcritic php php-phpmd php-phpcs processing proselint protobuf-protoc pug puppet-parser puppet-lint python-flake8 python-pylint python-pycompile python-mypy r-lintr racket rpm-rpmlint rst-sphinx rst ruby-rubocop ruby-reek ruby-rubylint ruby ruby-jruby rust-cargo rust rust-clippy scala scala-scalastyle scheme-chicken scss-lint scss-stylelint sass/scss-sass-lint sass scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint systemd-analyze tcl-nagelfar tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator vhdl-ghdl xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby javascript-tide jsx-tide)))
 '(package-selected-packages
   (quote
    (powerline spinner org-category-capture alert log4e gntp let-alist with-editor json-snatcher json-reformat multiple-cursors js2-mode hydra parent-mode haskell-mode haml-mode flyspell-correct pos-tip flycheck pkg-info epl iedit anzu evil goto-chg undo-tree highlight yasnippet f dash-functional tern flx company markdown-mode rust-mode bind-map bind-key packed s dash helm-core popup async cquery web-mode tide magit ghub elpy ivy cargo smartparens helm avy lsp-mode projectile org-plus-contrib yaml-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package typescript-mode toml-mode toc-org tagedit srefactor spaceline slim-mode scss-mode sass-mode restart-emacs request rainbow-delimiters racer pyvenv pug-mode protobuf-mode popwin pkgbuild-mode persp-mode pcre2el paradox org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree move-text mmm-mode markdown-toc magit-popup macrostep lsp-ui lsp-rust lsp-haskell lorem-ipsum linum-relative link-hint less-css-mode json-mode js2-refactor indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation highlight-chars helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-css-scss helm-ag grizzl google-translate golden-ratio gnuplot glsl-mode git-commit gh-md flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-elm flx-ido find-file-in-project fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu emmet-mode elm-mode elisp-slime-nav dumb-jump diminish define-word csharp-mode company-tern company-lsp company-flx column-enforce-mode cmake-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent ag adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
