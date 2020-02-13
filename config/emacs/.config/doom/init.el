;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       company           ; the ultimate code completion backend
       (ivy              ; a search engine for love and life
        +icons)

       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       hydra
       (modeline         ; snazzy, Atom-inspired modeline, plus API
        ;; TODO after some time it starts throwing Symbol's function definition is void: set-modeline!
        ;;      when I try to open the magit status
        ;+light
        )
       nav-flash         ; blink the current line after jumping
       ophints           ; highlight the region an operation acts on
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       treemacs          ; a project drawer, like neotree but cooler
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format +onsave)  ; automated prettiness
       ;;lispy             ; vim for lisp, for people who dont like vim
       multiple-cursors  ; editing in many places at once
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired            ; making dired pretty [functional]
        +ranger         ; bringing the goodness of ranger to dired
        +icons          ; colorful icons for dired-mode
        )
       electric          ; smarter, keyword-based electric-indent
       vc                ; version-control and Emacs, sitting in a tree

       :checkers
       syntax            ; tasing you for every semicolon you forget
       (spell
        +everywhere)     ; tasing you for misspelling mispelling
       grammar           ; tasing grammar mistake every you make

       :tools
       direnv
       docker
       ein               ; tame Jupyter notebooks with emacs
       eval              ; run code, run (also, repls)
       (lookup           ; helps you navigate your code and documentation
        +dictionary
        +offline)

       magit             ; a git porcelain for Emacs

       :lang
       (clojure          ; java with a lisp
        +syntax-checker)
       data              ; config/data formats
       emacs-lisp        ; drown in parentheses
       go                ; the hipster dialect
       (haskell +dante)  ; a language that's lazier than I am
       idris             ;
       (java +meghanada) ; the poster child for carpal tunnel syndrome
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       kotlin            ; a better, slicker Java(Script)
       markdown          ; writing docs for people to ignore
       nix               ; I hereby declare "nix geht mehr!"
       (org              ; organize your plain life in plain text
        +pandoc          ; pandoc integration into org's exporter
        +present)        ; Emacs for presentations
       (python           ; beautiful is better than ugly
        +pyenv)
       rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       scala             ; java, but good
       (sh +fish +bash)  ; she sells {ba,z,fi}sh shells on the C xor
       web               ; the tubes

       :config
       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme and a smartparens
       ;; config. Use it as a reference for your own modules.
       (default +bindings +smartparens))