(setq-default dotspacemacs-configuration-layers '(shell markdown go org html extra-langs python tmux sql version-control c-c++ git github
  (auto-completion :variables
                     auto-completion-return-key-behavior 'complete
                     auto-completion-enable-snippets-in-popup t
                     auto-completion-tab-key-behavior 'cycle
                     auto-completion-complete-with-key-sequence nil)))

(setq-default dotspacemacs-themes '(james ))
(defvar nose-use-verbose nil) ; default is nil

(defun dotspacemacs/config ()
  ; from regex "b" up to regex "c", bound to k (invoke with "vik" or "vak"):
  ;(define-and-bind-text-object "k" "b" "c")
  (define-and-bind-text-object "j" "[\(,]" "[\),]")
  (golden-ratio-mode 1) ; enable golden ratio mode by default
  (yas-minor-mode 1) ; enable yasnippet
  (subword-mode) ; camelcase motion
  (global-hl-line-mode -1)) ; Disable current line highlight
; (global-linum-mode)) ; Show line numbers by default

(add-hook 'post-command-hook
          (lambda ()
            (let ((ctype (cond ((evil-insert-state-p) (setq cursor-type 'bar))
                               (t (setq cursor-type 'box))))))
            ))

(defun bar-cursor ()
  (setq cursor-type 'bar)
)
(setq server-use-tcp t)
(setq-default evil-escape-key-sequence "jk")
(add-hook 'Buffer-menu-mode-hook 'buffer-disable-undo)

;; Get rid of backup files in individual directories
(add-to-list 'backup-directory-alist '(".*" . "~/.backup"))
(setq backup-by-copying t
      make-backup-files 1
            auto-save-default nil
                  create-lockfiles nil)


(setq global-hl-line-mode nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-requires 4 t)
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (james)))
 '(custom-safe-themes
   (quote
    ("8df40eb4c85b221e3d40ad04559b68b441d9cf69801ef6d1e3d3d17d5773ccd3" "dc5f5383bdc86a03a075880d9313901bb7d44affba5157eaf1f2ebdf35a7b944" "efb148b9a120f417464713fe6cad47eb708dc45c7f2dbfeea4a7ec329214e63e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "b825687675ea2644d1c017f246077cdd725d4326a1c11d84871308573d019f67" "9823333060f12954e41174bfa4c271b94028ff8452b93f9459b362cc89ce39c2" "1bd06e70f0bc667c8912d93db80d408ae011a60469d2d142f0eaee90ddbeeaa0" default)))
 '(fci-rule-color "#073642" t)
 '(fringe-mode 6 nil (fringe))
 '(godef-command "/usr/bin/godef")
 '(gofmt-command "/usr/bin/goimports")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-background-colors
   (quote
    ("#00FF99" "#CCFF99" "#FFCC99" "#FF9999" "#FF99CC" "#CC99FF" "#9999FF" "#99CCFF" "#99FFCC" "#7FFF00")))
 '(hl-paren-colors (quote ("#326B6B")) t)
 '(magit-diff-use-overlays nil)
 '(paradox-github-token t)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(ring-bell-function (quote ignore) t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c37300")
     (60 . "#b97d00")
     (80 . "#b58900")
     (100 . "#a18700")
     (120 . "#9b8700")
     (140 . "#948700")
     (160 . "#8d8700")
     (180 . "#859900")
     (200 . "#5a942c")
     (220 . "#439b43")
     (240 . "#2da159")
     (260 . "#16a870")
     (280 . "#2aa198")
     (300 . "#009fa7")
     (320 . "#0097b7")
     (340 . "#008fc7")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(cursor ((t (:background "color-239"))))
 '(evil-search-highlight-persist-highlight-face ((t (:background "color-172" :foreground "black")))))

(defmacro define-and-bind-text-object (key start-regex end-regex)
  (let ((inner-name (make-symbol "inner-name"))
        (outer-name (make-symbol "outer-name")))
    `(progn
       (evil-define-text-object ,inner-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count nil))
       (evil-define-text-object ,outer-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count t))
       (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
              (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))
