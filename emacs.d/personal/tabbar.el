(prelude-require-package 'tabbar)

(tabbar-mode 1)

;; Tabbar
(require 'tabbar)
;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "#fdf6e3"
 :foreground "#fdf6e3"
 :box '(:line-width 1 :color "#fdf6e3" :style nil)
 :height 1.1
 )
(set-face-attribute
 'tabbar-unselected nil
 :background "#fdf6e3"
 :foreground "#839496"
 :box '(:line-width 5 :color "#fdf6e3" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "#eee8d5"
 :foreground "#839496"
 :box '(:line-width 5 :color "#eee8d5" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 :background "#eee8d5"
 :foreground "#839496"
 :underline nil
 :box '(:line-width 5 :color "#eee8d5" :style nil))
(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "#fdf6e3" :style nil))
(set-face-attribute
 'tabbar-separator nil
 :background "#fdf6e3"
 :height 0.6)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

;; Keyboard shortcuts

(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-forward-tab)

;; Hide top left buttons
(defcustom tabbar-hide-header-button t
  "Hide header button at left-up corner.
Default is t."
  :type 'boolean
  :set (lambda (symbol value)
         (set symbol value)
         (if value
             (setq
              tabbar-scroll-left-help-function nil ;don't show help information
              tabbar-scroll-right-help-function nil
              tabbar-help-on-tab-function nil
              tabbar-home-help-function nil
              tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
              tabbar-scroll-left-button (quote (("") ""))
              tabbar-scroll-right-button (quote (("") "")))))
  :group 'tabbar)
