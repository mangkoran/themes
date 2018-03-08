;;; doom-dracula-theme.el - based on https://draculatheme.com/
(require 'doom-themes)

;;
(defgroup doom-dracula-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-dracula-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-dracula-theme
  :type 'boolean)

(defcustom doom-dracula-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-dracula-theme
  :type 'boolean)

(defcustom doom-dracula-comment-bg doom-dracula-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-dracula-theme
  :type 'boolean)

(defcustom doom-dracula-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-dracula-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-dracula
  "A dark theme inspired by Atom One Dark"

  ;; name        default   256       16
  ((bg         '("#1E2029" nil       nil            ))
   (bg-alt     '("#282a36" nil       nil            ))
   (base0      '("#1E2029" "black"   "black"        ))
   (base1      '("#282a36" "#1e1e1e" "brightblack"  ))
   (base2      '("#373844" "#2e2e2e" "brightblack"  ))
   (base3      '("#44475a" "#262626" "brightblack"  ))
   (base4      '("#565761" "#3f3f3f" "brightblack"  ))
   (base5      '("#6272a4" "#525252" "brightblack"  ))
   (base6      '("#b6b6b2" "#6b6b6b" "brightblack"  ))
   (base7      '("#ccccc7" "#979797" "brightblack"  ))
   (base8      '("#f8f8f2" "#dfdfdf" "white"        ))
   (fg         '("#e2e2dc" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#f8f8f2" "#2d2d2d" "white"        ))

   (grey       base4)
   (red        '("#ff5555" "#ff6655" "red"          ))
   (orange     '("#ffb86c" "#dd8844" "brightred"    ))
   (green      '("#50fa7b" "#99bb66" "green"        ))
   (teal       '("#0189cc" "#44b9b1" "brightgreen"  ))
   (yellow     '("#f1fa8c" "#ECBE7B" "yellow"       ))
   (blue       '("#0189cc" "#51afef" "brightblue"   ))
   (dark-blue  '("#0189cc" "#2257A0" "blue"         ))
   (magenta    '("#ff79c6" "#c678dd" "magenta"      ))
   (violet     '("#bd93f9" "#a9a1e1" "brightmagenta"))
   (cyan       '("#8be9fd" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#8be9fd" "#5699AF" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      violet)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        orange)
   (comments       base5)
   (doc-comments   (doom-lighten (if doom-dracula-brighter-comments dark-cyan base5) 0.25))
   (constants      cyan)
   (functions      green)
   (keywords       magenta)
   (methods        teal)
   (operators      violet)
   (type           blue)
   (strings        yellow)
   (variables      base8)
   (numbers        red)
   (region         base3)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     base1)
   (-modeline-bright doom-dracula-brighter-modeline)
   (-modeline-pad
    (when doom-dracula-padded-modeline
      (if (integerp doom-dracula-padded-modeline) doom-dracula-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (doom-darken  0.475)
      `(,(car bg-alt) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken magenta 0.45)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg-alt 0.1))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.075) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-dracula-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
   (solaire-hl-line-face :background base2)
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground base1 :background base1)
   (solaire-org-hide-face :foreground base1 :background base1)
   (org-level-1 :background base1 :foreground magenta :bold t :height 1.2)
   (org-level-2 :background base1 :foreground violet)
   (org-level-3 :background base1 :foreground green)
   (org-level-4 :background base1 :foreground yellow)
   (org-level-5 :background base1 :foreground cyan)
   (org-level-6 :background base1 :foreground orange)
   (org-level-7 :background base1 :foreground blue)
   (org-todo :foreground orange :bold 'inherit :background base2)
   (org-done :foreground green :strike-through nil :background base2 :bold t)
   (org-headline-done :foreground base4 :strike-through nil)
   (org-tag :foreground blue :bold t :background base1)
   (org-agenda-date :foreground cyan)
   (org-agenda-dimmed-todo-face :foreground comments)
   (org-agenda-done :foreground base4)
   (org-agenda-structure :foreground violet)
   (org-block :foreground violet)
   (org-code :foreground yellow)
   (org-column :background base1)
   (org-column-title :background base1 :bold t :underline t)
   (org-date :foreground cyan)
   (org-document-info :foreground blue)
   (org-document-info-keyword :foreground comments)
   (org-ellipsis :foreground comments)
   (org-footnote :foreground blue)
   (org-headline-base :foreground comments :strike-through t :bold nil)
   (org-link :foreground cyan :underline t)
   (org-priority :foreground cyan)
   (org-scheduled :foreground green)
   (org-scheduled-previously :foreground yellow)
   (org-scheduled-today :foreground orange)
   (org-sexp-date :foreground base4)
   (org-special-keyword :foreground yellow)
   (org-table :foreground violet)
   (org-upcoming-deadline :foreground yellow)
   (org-warning :foreground magenta)
   )

  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-dracula-theme.el ends here