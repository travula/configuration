;; Full Screen
(setenv "PATH" (concat (getenv "PATH") "/home/travula/racket/bin/"))
(setq exec-path (append exec-path '("/home/travula/racket/bin/")))

(setq debug-on-error 1)
(setq max-lisp-eval-depth 2000)
(setq max-specpdl-size 6000)

(require 'cl)
(setq url-proxy-services '(("http" . "proxy.iiit.ac.in:8080")
                         ("https" . "proxy.iiit.ac.in:8080")))


(require 'package)

(add-to-list 'package-archives
            '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives 
             '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)


;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

;; Load Path
;; ---------
;;; ((list )of pathname?) -> void?
(defun add-to-load-path (entries)
  (dolist (entry entries)
	 (add-to-list 'load-path entry)))

;;; Also highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(quack-programs
   (quote
    ("mzscheme" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi"))))

(setq font-string 
;      "-*-Courier-medium-r-normal-*-18-*-*-*-m-*-iso8859-1"
;      "-*-Courier-medium-r-normal-*-24-*-*-*-m-*-iso8859-1"

;      "-*-Courier-bold-r-normal-*-12-*-*-*-m-*-iso8859-1"
;      "-*-Courier-bold-r-normal-*-18-*-*-*-m-*-iso8859-1" ;      not defined
      "-*-Courier-bold-r-normal-*-24-*-*-*-m-*-iso8859-1"
)



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Don't use TABS for indentations.
(setq-default indent-tabs-mode nil)

;; Set the number to the number of columns to use.
(setq-default fill-column 79)

;; Add Autofill mode to mode hooks.
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Show line number in the mode line.
(line-number-mode 1)

;; Show column number in the mode line.
(column-number-mode 1)

;;Enable syntax highlighting. This will also highlight lines that form a
;;region.
(require 'font-lock)
(global-font-lock-mode 1)

;;;;org-mode configuration
;; Enable org-mode
(require 'org)
;; Make org-mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen



;;;Indentation is automatically added. When a tab is pressed it is replaced
;;;with 4 spaces. When backspace is pressed on an empty line, the cursor will
;;;jump to the previous indentation level.


(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'indent-tabs-mode nil))))

;; Highlight character at "fill-column" position.
(require 'column-marker)
(set-face-background 'column-marker-1 "red")
(add-hook 'python-mode-hook
          (lambda () (interactive)
            (column-marker-1 fill-column)))



;;; setting up python with flycheck
;;; http://dreamrunner.org/wiki/public_html/Python/flycheck-pylint-emacs-with-python.html
(defun flycheck-python-setup ()
  (flycheck-mode))
(add-hook 'python-mode-hook #'flycheck-python-setup)

;; Remove trailing whitespace manually by typing C-t C-w.
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "C-t C-w")
                           'delete-trailing-whitespace)))

;; Automatically remove trailing whitespace when file is saved.
(add-hook 'python-mode-hook
      (lambda()
        (add-hook 'local-write-file-hooks
              '(lambda()
                 (save-excursion
                   (delete-trailing-whitespace))))))

;; Use M-SPC (use ALT key) to make sure that words are separated by
;; just one space. Use C-x C-o to collapse a set of empty lines
;; around the cursor to one empty line. Useful for deleting all but
;; one blank line at end of file. To do this go to end of file (M->)
;; and type C-x C-o.


(setq org-src-preserve-indentation t)
(add-hook 'org-mode-hook
  (lambda()
    (flyspell-mode 1)))

(dolist (hook '(org-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)
(setq js-indent-level 2)

;; auto complete for python
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;; open json files in js-mode
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
;;yasnippet (https://truongtx.me/2013/01/06/config-yasnippet-and-autocomplete-on-emacs/)
(require 'yasnippet)
(yas-global-mode 1)
;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")


(require 'quack)
(setq scheme-program-name "mzscheme")
(setq racket-racket-program "mzscheme")

(load-library "ox-reveal")

