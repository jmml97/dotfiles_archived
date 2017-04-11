(require 'iso-transl)

;; Disable whitespace
(setq prelude-whitespace nil)
;; Disable flyspell
(setq prelude-flyspell nil)

;; Disable flycheck
(global-flycheck-mode -1)

;; Enable word wrapping
(setq-default word-wrap 1)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
          '(lambda() (set-fill-column 80)))

;; Visual Line Mode on LaTeX -> Makes text easier to read
(add-hook 'LaTeX-mode-hook #'visual-line-mode)

;; Tell prelude to download auctex if we don't have it
(prelude-require-package 'auctex)

;; Enable AUCTeX on LaTeX file load
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
 
;; Load math mode automatically when loading .tex file
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; Modify shortcut key for LaTeX
(setq LaTeX-math-abbrev-prefix "ç")
;; Custom shortcuts list
(setq LaTeX-math-list
      (quote
       (("e" "varepsilon" "" nil)
        ("C-S" "sum" "" nil)
        (";" "mathbb" "" nil)
        ("=" "cong" "" nil)
        ("C-F" "Rightarrow" "" nil)
        ("C-B" "Leftarrow" "" nil)
        ("<right>" "longrightarrow" "" nil)
        ("<left>" "longleftarrow" "" nil)
        ("C-<right>" "Longrightarrow" "" nil)
        ("C-<left>" "Longleftarrow" "" nil)
        ("^" "widehat" "" nil)
        ("~" "widetilde" "" nil)
        ("'" "\partial" "" nil)
        ("0" "varnothing" "" nil)
        ("(" "left(" "" nil)
        (")" "right)" "" nil)
        ("C-i" "int" "" nil)
        )))

;; Automatically complete $ in LaTeX
;;(electric-pair-mode)
;;(add-hook 'LaTeX-mode-hook
;;          '(lambda ()
;;             (define-key LaTeX-mode-map (kbd "$") 'self-insert-command)
;;             (define-key LaTeX-mode-map (kbd "_") 'tex-smart-underscore)
;;             (define-key LaTeX-mode-map (kbd "^") 'tex-smart-caret))) 


;; LaTeX better underscore and caret. They insert brackets with one keystroke. Thanks to @gdv

(defun tex-smart-underscore ()
  "Smart \"_\" key: insert \"_{}\".
If the underscore key is pressed a second time, \"_{}\" is removed and replaced by the underscore."
  (interactive)
  (let ((assign-len (length "_{")))
    (if (and
         (>= (point) (+ assign-len (point-min))) ;check that we can move back
         (save-excursion
           (backward-char assign-len)
           (looking-at "_{}")))
      ;; If we are currently looking at ess-S-assign, replace it with _
        (progn
          (forward-char)
          (delete-backward-char (+ 1 assign-len))
          (insert "_"))
    (delete-horizontal-space)
    (insert "_{}")
    (backward-char))))

(defun tex-smart-caret ()
  "Smart \"^\" key: insert \"^{}\".
If the caret key is pressed a second time, \"^{}\" is removed and replaced by the caret."
  (interactive)
  (let ((assign-len (length "^{")))
    (if (and
         (>= (point) (+ assign-len (point-min))) ;check that we can move back
         (save-excursion
           (backward-char assign-len)
           (looking-at "\\^{}"))) ;; looking-at reads regexp, so need to escape the caret character
      ;; If we are currently looking at ess-S-assign, replace it with ^
        (progn
          (forward-char)
          (delete-backward-char (+ 1 assign-len))
          (insert "^"))
    (delete-horizontal-space)
    (insert "^{}")
    (backward-char))))

;; Preview tikz

;(eval-after-load "preview"
;  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t)
;  )

;; Proper indent of C/C++ directives

(c-set-offset (quote cpp-macro) 0 nil)


