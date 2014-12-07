;; Cask and Pallet for emacs auto-configuration
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)


(setq custom-file "~/.emacs.d/emacs-custom.el")


;; General appearance
(menu-bar-mode -1) (tool-bar-mode -1)
;; (global-linum-mode 1)

(setq inhibit-startup-message           t
      inhibit-startup-echo-area-message t)

(set-face-attribute 'default nil :height 150)


;; Attivazione dei keybindings ErgoEmacs
;;(require 'ergoemacs-mode)
;;(setq ergoemacs-theme nil)
;;(setq ergoemacs-keyboard-layout "us")
;;(ergoemacs-theme-option-on '(guru))
;;(ergoemacs-mode 1)


;; Packages repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)


;; Settings for ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t
      ido-everywhere           t)
(global-set-key (kbd "M-x") 'smex)


;; General programming facilities
(setq-default indent-tabs-mode nil)                                        ; no tabs
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)) ; no junk
      backup-directory-alist         `((".*" . ,temporary-file-directory)))


;; Haskell programming facilities

;;(require 'haskell-mode-autoloads)
(require 'haskell-mode)
(require 'ghc)

;; (add-to-list 'load-path "~/.nix-profile/share/emacs/site-lisp")

;; ghc-mod integration
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`")     'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c")   'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC")     'haskell-mode-contextual-space)
(define-key haskell-mode-map (kbd "M-.")     'haskell-mode-jump-to-def)

(global-set-key (kbd "<f9>") 'ghc-insert-template)
(global-set-key (kbd "<f10>") 'ghc-goto-prev-error)
(global-set-key (kbd "<f11>") 'ghc-display-errors)
(global-set-key (kbd "<f12>") 'ghc-goto-next-error)

(global-set-key (kbd "C-;") 'ace-jump-mode)



;; Questo e' per il completamento delle snippet di programmazione
;;(require 'yasnippet)
;;(setq yas-snippet-dirs '("~/.emacs.d/snippets/shnippet"
;;        "/other/paths/"
;;        ))
;;(setq-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-prompt))

;; Questo e' temporaneo, per le espressioni regolari potenziate
(require 'visual-regexp-steroids)

;; Test per evil-mode
    (require 'evil)
    (evil-mode 1)


;; Test per powerline
(require 'powerline)
(powerline-default-theme)

(require 'sublimity)
(require 'sublimity-attractive)

(sublimity-attractive-hide-bars)
(sublimity-attractive-hide-vertical-border)
(sublimity-attractive-hide-fringes)

(setq sublimity-attractive-centering-width 110)

(sublimity-mode 1)

;; Questa e' una sperimentazione per l'uso dei file .dot
;; in org-mode
(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (java . t)
         (dot . t)
         (calc . t)
         (haskell . t)
         (ditaa . t)
         (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (sh . t)
         (ledger . t)
         (org . t)
         (lilypond t)
         (plantuml . t)
         (latex . t))))

(setq org-babel-lilypond-nix-ly-path "lilypond")

(autoload 'LilyPond-mode "lilypond-mode")
(setq auto-mode-alist
      (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))

(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;; Questo serve per le chat IRC
(require 'erc)
;; joining && autojoing
;; make sure to use wildcards for e.g. freenode as the actual server
;; name can be be a bit different, which would screw up autoconnect
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
  '((".*\\.freenode.net" "#nixos")
   ))

;; check channels
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                 "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(defun djcb-erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667") ;; ERC already active?

    (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.freenode.net" :port 6667 :nick "meditans" :full-name "Carlo Nucera")
  )))

;; Variable edited using customize.el


;; Utilizzo del browser esterno
(setq browse-url-generic-program (executable-find "conkeror"))
(setq browse-url-browser-function 'browse-url-generic)

;; Setting di una scorciatoia per remember
(global-set-key (kbd "<f6>") 'remember)

(load custom-file)
