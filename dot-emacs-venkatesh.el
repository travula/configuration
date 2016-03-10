;; Emacs support
;; Venkatesh Choppella

; .emacs

(print "running Venkatesh dot emacs")
(print "running Venkatesh dot emacs")
(print "running Venkatesh dot emacs")
(print "running Venkatesh dot emacs")



;;; Package management

;; (require 'package)
;; (add-to-list 'package-archives
;;             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (package-initialize)



;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)



;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

; (load "/home/choppell/.emacs-redhat")

;; elisp files are in /a/megamouth/root/home/raid5/part1/elisp
;; or /usr/local/src/elisp

(setq debug-on-error 1)
(setq max-lisp-eval-depth 2000)
(setq max-specpdl-size 6000)

(require 'cl)

;; Load Path
;; ---------
;;; (listof pathname?) -> void?
(defun add-to-load-path (entries)
  (dolist (entry entries)
	 (add-to-list 'load-path entry)))

(add-to-load-path
'(
	  "/home/choppell/emacs/lisp"
;;	  "/home/choppell/emacs/lisp/xml-parse"
;;	  "/home/choppell/emacs/lisp/html-parse"
;;	  "/home/choppell/emacs/lisp/pcsv"
	  "/home/choppell/emacs/lisp/ebib"
;;	  "/home/choppell/emacs/lisp/org-8.2.1/lisp"
;;	  "/home/choppell/emacs/lisp/org-8.2.1/contrib/lisp"

;;	  "/home/choppell/emacs/lisp/org-8.0.7/lisp"
;;	  "/home/choppell/emacs/lisp/org-8.0.7/contrib/lisp"
;;	  "/home/choppell/emacs/lisp/org-mode/contrib/ox-bibtex/lisp"

	  "/home/choppell/emacs/lisp/org-7.9.2/lisp"
	  "/home/choppell/emacs/lisp/org-7.9.2/contrib/lisp"
;;	  "/home/choppell/emacs/lisp/org-7.8.03/lisp"
;;	  "/home/choppell/emacs/lisp/org-7.8.03/contrib/lisp"
	  "/home/choppell/emacs/lisp/org-mode/norang"
	  "/home/choppell/emacs/lisp/org-mode/"
;;	  "/home/choppell/emacs/lisp/htmlize"
	  "/home/choppell/emacs/lisp/html-from-latex"
          "/home/choppell/emacs/nxml-mode-20041004"
;;	  "/home/choppell/apps/mew-3.3"
          "/home/choppell/emacs/html-helper-mode"
;;          "/home/choppell/emacs/psgml-1.3.1"
          "/home/choppell/emacs/elib-1.0"
;;	  "/usr/share/emacs/site-lisp/auctex"
;;	  "/home/choppell/emacs/lisp/auctex-11.86"
;;	  "/home/choppell/emacs/cc-mode-5.31.3"
;;        "/usr/share/emacs21.4/lisp"
          "/home/choppell/emacs/lisp/javascript"
;;          "/home/choppell/org"
	  ))


(require 'cl)

;;; removes references to default org-mode installations
;;; made by the emacs distributions.  Then removes
;;; duplicates

(setq load-path 
      (delete-dups 
       (remove-if '(lambda (dirname) 
		     (string-match "site-lisp/org-mode" dirname)) 
		  load-path)))

;; (defun at-home-p ()
;;   (let ((host (or (getenv "HOST") (getenv "HOSTNAME"))))
;;     (search "mandira" host)))

;; (defun remote-p ()
;;   (getenv "REMOTEHOST"))

;; (defun at-work-p ()
;;   (not (at-home-p)))


;;(load (if (or (at-home-p) (remote-p)) "local-home" "local-work"))
;(load "local-work")


;; (global-set-key "\C-h" 'help)
(global-set-key "\C-c\C-g" 'goto-line)
(global-set-key "\C-cl" 'font-lock-mode)
(global-set-key "\C-c\C-b" 'eval-buffer)
(global-set-key "\C-cr" 'repeat-complex-command)
(global-set-key "\C-cc" 'compile)
(global-set-key "\C-cu" 'browse-url-at-point)
(global-set-key "\C-h\C-x\C-f" 'describe-face)



;; won't beep anymore.
(setq visible-bell t)

;; (load "keys" nil t)
;;(load "emacs" nil t)
;(load "ispell" nil t)

;; Emacs library from anurag
;; =========================
;; (load-file "/nfs/moose/u/anurag/emacs/emlib.el")
(load-file "/home/choppell/emacs/lisp/emlib.el")
(global-set-key ";" 'comment-region)

(define-key global-map [(escape) (control f)]
  'forward-sexp)


(define-key global-map [(escape) (control b)]
'backward-sexp)

(define-key global-map [(escape) (control k)]
'kill-sexp)

(define-key global-map [(escape) (control c) (f)]
'strip-forward-sexp)
(define-key global-map [(escape) (control c) (b)]
'strip-backward-sexp)

(define-key global-map [(control c) (f)]
'strip-forward-sexp)
(define-key global-map [(control c) (b)]
'strip-backward-sexp)

(define-key global-map [(control x) (r)] 'shell-command-on-region)

(setq blink-matching-paren-distance 100000)

;; (define-key global-map [(control =)] 'text-scale-adjust)

;; Text Mode
;; =========
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
	  (function (lambda ()
		      (set-fill-column 
;		       72
                      70
;		       64
;                      60
;                       48  ; ideal for large font
;                       40  ; large font on projector
		       ))))

;; exported to shell-completions
(make-variable-buffer-local 
 'file-name-beginning-delimiter-regexp)

;; If you want to use C-s and C-q (and they don't cause
;; problems), uncomment:
;(unflow)

;; RMAIL
;; =====
;; (load ".rmail" nil t)


;; VM
;; (load "vm-support" nil t)

;; C 
;; =

;; (load "c-support" nil t)

;; C++
;; ===

;; (load "c++-mode" nil t)

;; Java
;; ====

;; From: http://jdee.sunsite.dk/_emacs_jde
;;
;; for JDEE
;; (add-to-list 'load-path 
;;	     (expand-file-name "~/emacs/jde-2.3.2/lisp")
;; ) ; 2.3.5 doesn't work!


(add-to-list 'load-path (expand-file-name "~/emacs/elib-1.0"))
(add-to-list 'load-path (expand-file-name "~/emacs/speedbar-0.14beta4"))
(add-to-list 'load-path (expand-file-name "~/emacs/semantic-1.4.3"))
(add-to-list 'load-path (expand-file-name "~/emacs/eieio-0.17"))

;; If you want Emacs to defer loading the JDE until you open a 
;; Java file, edit the following line
;; (setq defer-loading-jde nil)
;; to read:
;;
;; (setq defer-loading-jde t)
;;


;; (if defer-loading-jde
;;     (progn
;;       (autoload 'jde-mode "jde" "JDE mode." t)
;;       (setq auto-mode-alist
;; 	    (append
;; 	     '(("\\.java\\'" . jde-mode))
;; 	     auto-mode-alist)))
;;   (require 'jde))


;; Sets the basic indentation for Java source files
;; to two spaces.
;; (defun my-jde-mode-hook ()
;;   (setq c-basic-offset 2))
;; (add-hook 'jde-mode-hook 'my-jde-mode-hook)


;; AspectJ support for Emacs
;; -------------------------

;; for AJDEE [AspectJ support for Emacs]
;; (add-to-list 'load-path 
;;  	     (expand-file-name "~/emacs/AspectJForEmacs-1.1b2/aspectj-mode"))
;;  (add-to-list 'load-path (expand-file-name "~/emacs/AspectJForEmacs-1.1b2/ajdee"))


;;; Can also put this in a project's prj.el file to keep this from affecting
;;; Java projects.  See sample.prj for details.
;; (require 'ajdee)

;; CEDET
;; -----
;; Load CEDET
;; see emacs/cedet-1.0pre3/common/cedet.el
(setq semantic-load-turn-useful-things-on t)
; (load-file "/home/choppell/emacs/cedet-1.0pre3/common/cedet.el")
;; (load-file "/home/choppell/emacs/cedet-1.0beta2b/common/cedet.el")


;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following
;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; Enable this if you develop in semantic, or develop grammars
;; (semantic-load-enable-semantic-debugging-helpers)


;; BASH
;; ====
;; Include the following only if you want to run
;; bash as your shell.

;; Setup Emacs to run bash as its primary shell.
(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))
(if (boundp 'w32-quote-process-args)
  (setq w32-quote-process-args ?\")) ;; Include only for MS Windows.


;; SCRIBBLE
;; ========

(setq auto-mode-alist
      (cons '("\\.scbl$" . scheme-mode) auto-mode-alist))

;; SCHEME 
;; ======
;; (load "scheme-support" nil t)
;; (infer) ; defined in iuscheme

(setq auto-mode-alist
      (cons '("\\.rkt$" . scheme-mode) auto-mode-alist))

(setq load-path (cons "/home/choppell/emacs/lisp/scheme" load-path))
(require 'quack)

;; (autoload 'scheme-mode "iuscheme" "Major mode for Scheme." t)
;; (autoload 'run-scheme "iuscheme" "Switch to interactive Scheme buffer." t)


;;; from http://www.stifflog.com/files/emacs.txt

;;; Scheme config

(defun my-run-scheme ()
  (split-window-vertically)
  (run-scheme "mzscheme")
  (enlarge-window -15)
  (windmove-up))

(defun my-surround-sexp()
  (insert "(")
  (forward-sexp)
  (insert ")")
  (backward-sexp)
  (forward-char))

(defun scheme-load-current-file()
  (scheme-load-file buffer-file-name))

(add-hook 'scheme-mode-hook
          (lambda () 
	    (setq scheme-program-name 
;		  "/home/choppell/apps/racket/racket-5.1.3/bin/mzscheme"
		  "/home/choppell/sys/apps/racket/racket-5.1.3/bin/mzscheme"
		  )

	    (define-key scheme-mode-map [(return)] 'quack-newline)
;;;	    (define-key scheme-mode-map [(?\s-l)] 'my-run-scheme)
	    (define-key scheme-mode-map [(?\s-c)] 'scheme-load-current-file)
;;;	    (define-key scheme-mode-map [(?\s-p)] 'my-surround-sexp)
))

(add-hook 'inferior-scheme-mode-hook
	  (lambda ()
	    (define-key inferior-scheme-mode-map [(return)] 'quack-newline)
;;	    (define-key scheme-mode-map [(?\c-h)] 'help)
	    (define-key inferior-scheme-mode-map [(shift return)] 'comint-send-input)))





;; SCSH
;; ====

(setq load-path (cons "/home/choppell/emacs/lisp/scheme" load-path))
;; PVS
;; ===

;; (load "pvs-load" nil t)

;; SML 
;; ===
;; (load "sml-support" nil t)
;(setq sml-prog-name "/home/choppell/apps/cduce-0.3.2/bin/cduce")
;; (setq sml-prog-name "/home/choppell/apps/cime-2.02/bin/cime-2.02-Linux")

;; AucTeX
;; ======
(require 'tex-site)


(add-hook 'tex-mode-hook
	  (function (lambda ()
		       (load "html-from-latex" nil t)
		       (load "auctex.el" nil t t)
		       (load "preview-latex.el" nil t t)
		       (setq TeX-auto-save t)
		       (setq TeX-parse-self t)
		       (setq-default TeX-master nil)
		       (autoload 'amsmath-mode     "amsmath")
		       (add-hook 'LaTeX-mode-hook  'amsmath-mode)
		       )))

;; TeX
;; ===


(add-hook 'tex-mode-hook
	  (function (lambda ()
		      ; (load "tex-support" nil t)
		      (local-set-key "\C-cv" 'tex-view-region)
		     )))

;; latex  insists on % rgb values
(require 'cl)
(require 'rmail)

(defun hex-to-percent (hex-string)
  (/ (rmail-hex-string-to-integer hex-string) 256.0))

(defun rgb% (hex-rgb)
  (interactive "Mhex:")
  (let* ((r-hex (subseq hex-rgb 0 2))
	 (g-hex (subseq hex-rgb 2 4))
	 (b-hex (subseq hex-rgb 4 6))
	 (percentages (mapcar 'hex-to-percent (list r-hex g-hex b-hex)))
	 (ans (concat (apply 'format (cons "{%f,%f,%f}"  percentages))
	    "  % rgb #" hex-rgb)))
	 (princ ans)))

    
;; CALENDAR
;; (load "calendar-support" nil t)


;; SHELL
;; =====

(defconst shell-prompt-pattern 
  "^\[[A-Za-z0-9]*:[^]]*\]"

  "*Regexp used by Newline command to match subshell prompts.
Anything from beginning of line up to the end of what this pattern matches
is deemed to be a prompt, and is not reexecuted.")

;; (load "shell-support" nil t)

(defun switch-to-shell-other-window ()
  (interactive)
  (switch-to-buffer-other-window "*shell*"))

(global-set-key "\C-cs" 'switch-to-shell-other-window)

(defun wc ()
  (interactive)
  (shell-command-on-region "wc"))


;; Makefiles
(setq auto-mode-alist
      (cons '("\\.mak$" . makefile-mode) auto-mode-alist))


;; Property Files

(setq auto-mode-alist
      (cons '("\\.properties$" . shell-script-mode) 
	    auto-mode-alist))

(setq auto-mode-alist
      (cons '("\\.prop$" . shell-script-mode) 
	    auto-mode-alist))

(setq auto-mode-alist
      (cons '("\\.conf$" . shell-script-mode) 
	    auto-mode-alist))

;; shell scripts
(setq auto-mode-alist
      (cons '("\\.sh$" . shell-script-mode) 
	    auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.bash$" . shell-script-mode) 
	    auto-mode-alist))


;; Python


(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))
;; (setq py-python-command "/home/choppell/apps/Python-2.3.4/python")
(autoload 'python-mode "python-mode" "Python editing mode." t)


(setq browse-url-browser-function 
  'browse-url-generic)


;;   (list ; (cons "*.pdf")
;; 	(cons "." 'browse-url-generic))



;;; PRINTING
;;; =========
;; lpr
;; (if (at-work-p) 
;;     (progn (setq lpr-switches '("-Pps9" "-h"))
;; 	   (setq printer-name "ps9")))
(require 'ps-print)
;(setq ps-paper-type 'ps-a4)
;;(setq ps-lpr-command "print")
;;(setq ps-lpr-switches '("/D:\\\\sholay\\nature")) ; the printer name
;;(setq ps-lpr-buffer "c:\\temp\\psspool.ps")       ; a tmp spool file

;;; Cursor Motion
;;; ============== Normally, `C-n' on the last line of a buffer
;; appends a newline to it.  If the variable
;; `next-line-add-newlines' is `nil', then `C-n' gets an error
;; instead (like `C-p' on the first line).
(setq next-line-add-newline nil)

;;; Comint
;;; ======
(add-hook 'comint-output-filter-functions
	  'comint-watch-for-password-prompt)

;;; dired
;;; =====
(load "cd.el")
(global-set-key "\C-cd" 'cd-buffer-dir)
(global-set-key "\C-cy" 'cd-buffer-dir)
(add-hook 'dired-load-hook
  (function 
    (lambda ()
      (setq dired-copy-preserve-time t)
      (setq dired-recursive-copies 'top)
      (setq dired-dwim-target t) ;
					; set dired-do-rename's
					; default
					; target to the
					; other window
      (define-key dired-mode-map "b" 'browse-url-of-dired-file)
      (load "dired-x")
      (load "dired-operations")
      (define-key dired-mode-map "z" 'dired-remote-copy)
      (define-key dired-mode-map "r" 'rsync-se-101) 
      (define-key dired-mode-map "T" 'dired-trash-files)
      (define-key dired-mode-map "\C-ca" 'dired-acroread-file)
      )))



;;; Buffers
;;; =======
;;; highlights marked region.
(transient-mark-mode 1)
(setq search-highlight t)
(global-set-key "\C-ce" 'shell-command-on-region)

;; show column number in status bar
(setq column-number-mode t)

;; kill current buffer without confirmation
(global-set-key "\C-xk" 'kill-current-buffer)

(defun kill-current-buffer ()
  "Kill the current buffer, without confirmation."
  (interactive)
  (kill-buffer (current-buffer)))

;; do NOT add newlines if cursor goes past last line in file
(setq next-line-add-newlines nil)

;; MISCELLANEOUS
(display-time)
(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(server-start)
;; (resize-minibuffer-mode 1)

;; Appearance
;; ==========


(setq frame-width 60) ;; works for bold-24 on my laptop
(setq frame-height 20);; works for bold-24 on my laptop
(setq font-string 
;      "-*-Courier-medium-r-normal-*-18-*-*-*-m-*-iso8859-1"
;      "-*-Courier-medium-r-normal-*-24-*-*-*-m-*-iso8859-1"

;      "-*-Courier-bold-r-normal-*-12-*-*-*-m-*-iso8859-1"
;      "-*-Courier-bold-r-normal-*-18-*-*-*-m-*-iso8859-1" ;      not defined
      "-*-Courier-bold-r-normal-*-24-*-*-*-m-*-iso8859-1"
)

;; font lock
(require 'font-lock)
;;(global-font-lock-mode 1)
;;(font-lock-mode 1)
(load "faces-config")
; lazy lock breaks font-locking in java files
;; (setq font-lock-support-mode 'lazy-lock-mode)

;; frame-width and frame-height come from 
(setq default-frame-alist 
      `((top . 25) (left . 10)
	(width . ,frame-width) (height . ,frame-height)
	(cursor-type . box)
;; colors are set in faces-config.el
	(cursor-color . "green")
;	(font . ,font-string)

))

(setq debug-on-error nil)

;; ELF
;; ---
;; [vc 12/31/02] Haven't gotten to installing twelf at ORNL yet!
;; (if (at-work-p)
;;     (progn 
;;       (setq twelf-root "/l/twelf-1.3/")
;;       (load (concat twelf-root "emacs/twelf-init.el"))))

;; REFTEX
;; -------

(add-hook 'reftex-mode-hook
	  (function (lambda() 
		      (setq reftex-enable-partial-scans t)
		      (setq reftex-save-parse-info t)
		      (setq 
		       reftex-use-multiple-selection-buffers t)
		      (setq reftex-plug-into-AUCTeX t)
		      (setq reftex-default-bibliography
		        (append 
			     (list 
   "/u/choppell/dissertation/thesis/lib/biblio/ref.bib"
   "/u/choppell/dissertation/thesis/lib/biblio/prolog.bib"
   "/u/choppell/dissertation/thesis/lib/biblio/type-error.bib")
			     reftex-default-bibliography)))))


;; Fill Column
;(set-fill-column 80)
;(set-fill-column 72)
;(set-fill-column 64)
(set-fill-column 60)

;; mode-line
(defun set-mode-line ()
  (interactive)
  "sets customized mode-line"
  (setq mode-line-format   
	(list
	 "-" 
	 'mode-line-mule-info 
	 'mode-line-modified 
	 '(line-number-mode "L%l--") 
	 '(column-number-mode "C%c--") 
	 '(-3 . "%p") 
	 'mode-line-frame-identification 
	 'mode-line-buffer-identification 
	 "   " 
	 'global-mode-string 
	 "   %[(" 
	 'mode-name 
	 'mode-line-process 
	 'minor-mode-alist 
	 "%n" 
	 ")%]--" 
	 '(which-func-mode ("" which-func-format "--")) 
	 "-%-")))


(defun add-hook-to-modes (modes hook)
  (dolist (mode modes)
    (add-hook mode hook)))

;; (setq-default fill-column 80)
;; (setq-default fill-column 64)
(setq-default fill-column 60)

(add-hook-to-modes 
 (list 
  'emacs-lisp-mode-hook
  'TeX-mode-hook
  'LaTeX-mode-hook
  'mail-mode-hook
  'rmail-mode-hook
  'text-mode-hook
  'scheme-mode-hook
  'TeX-mode-hook)
 (function (lambda ()
;;	     (turn-on-font-lock)
;;             (font-lock-mode)
             ; (font-lock-fontify-buffer t)
	     (kill-local-variable 'fill-column)
	     (set-mode-line))))


;;;; mew  http://www.mew.org
;;;; ===
(setq mew-rc-file "~/emacs/lisp/mew/mew-rc.el")
;; (load mew-rc-file)

;;; edebug
(setq edebug-trace t)

;; haskell
(setq load-path (cons "/home/choppell/emacs/haskell/haskell-mode-1.44" 
		      load-path))
(defun run-haskell (arg)
  (interactive "P")
  (haskell-hugs-start-process arg))


(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hi$"     . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
   "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
   "Major mode for editing literate Haskell scripts." t)

(add-hook 'haskell-mode-hook 'turn-on-haskell-hugs)
(add-hook 'haskell-mode-hook
          (function 
           (lambda ()
             (setq haskell-hugs-program-args
                   '("+." "+s" "+t" "+g" "+o" "-h128000000")))))

(add-hook 'haskell-hugs-hook 
	  (function
	   (lambda ()
 	     (switch-to-buffer "*hugs*"))))

                      

;; html and nxml
;; =============
;; (require 'psgml)

;; (load "rng-auto")
;; (autoload 'nxml-mode "nxml-mode")
;; (add-hook 'nxml-mode-hook
;; 	  (function (lambda ()
;; 	     (load "rng-nxml")
;;  	     (setq rng-nxml-auto-validate-flag t)
;; 	     (setq nxml-sexp-element-flag t))))

;; From html-chooser-mode.el

;; (when (boundp 'magic-mode-alist)
;;    (setq magic-mode-alist
;;                (cons '("<\\?xml\\s " . nxml-mode) magic-mode-alist)))

;; (setq auto-mode-alist (cons '("\\.x?html?$" . html-chooser-mode) auto-mode-alist))
;; (autoload 'html-chooser-mode "html-chooser-mode")

;; (autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;; ;; (add-hook 'html-helper-load-hook
;; ;;  (function (lambda () (load "css")
;; ;;              (load "semantic-fw"))))

;; ;; (add-to-list 'auto-mode-alist '("\\.html" . html-helper-mode))
;; ;; (add-to-list 'auto-mode-alist '("\\.htm" . html-helper-mode))
;; ;; (add-to-list 'auto-mode-alist '("\\.htm" . html-helper-mode))
;; ;; (add-to-list 'auto-mode-alist '("\\.jsp" . html-helper-mode))
;; (add-to-list 'auto-mode-alist '("\\.adp" . nxml-mode))
;; (add-to-list 'auto-mode-alist '("\\.xml" . nxml-mode))
;; (add-to-list 'auto-mode-alist '("\\.xsl" . nxml-mode))
;; (add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
;; (autoload 'css-mode "css-mode" nil t)

(setenv "EDITOR" "/usr/bin/emacsclient")
;;; FIXME !!!
(setq revert-without-query nil)

;; TODO!  Remove speedbar and semantic bovinator since CEDET is being loaded
;; ;; speedbar

;; (add-to-list 'load-path "~/emacs/speedbar-0.14beta4")
;; (autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
;; (autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
;; (global-set-key [(f4)] 'speedbar-get-focus)


;; ;; semantic bovinator

;; (add-to-list 'load-path "~/emacs/semantic-1.4.3")
;; (setq semantic-load-turn-everything-on t)
;; (require 'semantic-load)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(quack-pltish-comment-face ((((class color) (background dark)) (:foreground "DeepSkyBlue4" :slant oblique))))
 '(quack-pltish-keyword-face ((t (:foreground "DarkOrchid" :weight bold))))
 '(quack-pltish-paren-face ((((class color) (background dark)) (:foreground "DarkOrange4"))))
 '(quack-pltish-selfeval-face ((((class color) (background dark)) (:foreground "PaleGreen4"))))
 '(quack-threesemi-semi-face ((((class color) (background light)) (:background "light blue" :foreground "slate blue"))))
 '(quack-threesemi-text-face ((((class color) (background light)) (:background "light blue" :foreground "dark slate gray")))))

(put 'downcase-region 'disabled nil)

(setq html-helper-htmldtd-version 
"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"
\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">")


(setq html-helper-timestamp-start "<!-- hhmts start --> <p id=\"html-helper-timestamp\"> ")

(setq html-helper-timestamp-end "</p> <!-- hhmts end -->")

; Load the LAML Emacs support.
; This fragment has been inserted by the LAML configuration program.
; You can delete it if you do not want it. Do not edit it, however.

;; (load "/home/choppell/apps/laml-28-00/emacs-support/laml-emacs-support.el")

; End of LAML Emacs configuration.



; Load the LAML Emacs support.
; This fragment has been inserted by the LAML configuration program.
; You can delete it if you do not want it. Do not edit it, however.

;; (load "/home/choppell/apps/laml-28-00/emacs-support/laml-emacs-support.el")

; End of LAML Emacs configuration.


;;; BMACS

(if (locate-library "bmacs")
    (require 'bmacs))

(setq load-path (cons "/home/choppell/emacs/bmacs" load-path))

(put 'set-goal-column 'disabled nil)

;;; Clipboard

;;; In Konsole or Terminal on Linux, you highlight what you
;;; want then press Shift+Ctrl+C for copy and Shift+Ctrl+V
;;; for paste.

(setq x-select-enable-clipboard t)


;;; SCILAB
;;; ------

(setq load-path (append (list "/home/choppell/emacs/scilabelisp-2.1.7" ) load-path))

(load "scilab-startup")
(setq auto-mode-alist (cons '("\\(\\.sci$\\|\\.sce$\\)" . scilab-mode) 
			    auto-mode-alist))
(setq scilab-mode-hook '(lambda () (setq fill-column 64)))
(setq scilab-shell-file-name "/home/choppell/apps/scilab-4.0/bin/scilab")
(setq scilab-shell-command "/home/choppell/apps/scilab-4.0/bin/scilab")


;;; MOZREPL
;;; -------
;; no longer using mozrepl choppell
;;; js-mode is javascript major mode for MozRepl
;; (autoload 'js-mode "js-mode")
;; (add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
;; (add-hook 'js-mode-hook 'js-mozrepl-custom-setup)
;; (autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)
;; (defun js-mozrepl-custom-setup ()
;;   (moz-minor-mode 1)
;;   (setq comint-input-sender-no-newline nil))


;; Javascript mode
;; ---------------
;; javascript major mode
;; (autoload 'javascript-mode "js-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
;; (add-hook 'javascript-mode-hook 'javascript-mode-custom-setup)


;; js-comint  
;; http://js-comint-el.sourceforge.net/

(require 'js-comint)
;; (setq inferior-js-program-command "/usr/bin/java org.mozilla.javascript.tools.shell.Main")

(setq inferior-js-program-command "/usr/local/bin/node")

(add-hook 'js2-mode-hook '(lambda () 
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)
			    ))

(defun javascript-mode-custom-setup ()
  (autoload 'javascript-shell "javascript-shell"
    "Switch to interactive Javascript buffer." t)
  (setq comint-input-sender-no-newline nil)
  (setq javascript-shell-prompt-pattern "> ")
  (setq javascript-shell-command "java")
  (setq javascript-shell-command-args 
	'("-jar"  "/home/choppell/apps/rhino1_6R7/js.jar")))


(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[GK]" "" output)))))

;; Javascipt js2 major mode
;; ------------------------
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook 'javascript-mode-custom-setup)

(setenv "NODE_NO_READLINE" "1")


;;; Wikipedia mode
;;; --------------
(autoload 'wikipedia-mode "wikipedia-mode.el"
 "Major mode for editing documents in Wikipedia markup." t)
(add-hook 'wikipedia-mode-hook 'flyspell-mode)
(add-to-list 'auto-mode-alist 
  '("\\.wiki\\'" . wikipedia-mode))

(defun unset-wikipedia-bindings ()
  (interactive)
  (local-unset-key (kbd "C-<up>"))
  (local-unset-key (kbd "C-<down>"))
  (local-unset-key (kbd "C-<left>"))
  (local-unset-key (kbd "C-<right>")))
(add-hook 'wikipedia-mode-hook 'unset-wikipedia-bindings)


;;; OCAML
;;; See 
;;; caml.inria.fr/pub/docs/u3-ocaml/emacs/index.html

;;; 
(setq auto-mode-alist
          (cons '("\\.ml[iyl]?$" .  caml-mode) auto-mode-alist))

;; you should probably comment the next line or replace ~remy by another path 
(setq load-path (cons "/home/choppell/emacs/ocaml" load-path))

(autoload 'caml-mode "ocaml" (interactive)
  "Major mode for editing Caml code." t)
(autoload 'camldebug "camldebug" (interactive) "Debug caml mode")

(defun guess-location ()
  "Guesses the location of this machine as work or home
   (i.e., not at work) based on whether login.iiitmk.ac.in is
   visible or not."
  (interactive)
  (let ((result (shell-command "host login.iiitmk.ac.in")))
    (case result
     (0 'work)
     (t 'home)))) ; result is non-zero if the command fails.



;;

;; rsync
;; -----

(require 'rsync)

(setq rsync-info
      '((se-101
	 "/home/choppell/teaching/pantoto.org/pop" ;; rsync-local-dir
	 "courses/se-101/"                         ;; rsync-server-dir
;;	 "tmp/"                                    ;; rsync-server-dir for testing
	 "cde.iiitb.ac.in"                         ;; rsync-server. nil if local
	 "rsync -avzC")                            ;; rsync-cmd 
	))

(put 'upcase-region 'disabled nil)

(fset 'py-reset
   [?\C-c ?\C-d ?\M-x ?p ?y ?  ?s ?h ?e ?  ?\C-m ?\M->])


(add-hook 'comint-output-filter-functions
                    'comint-strip-ctrl-m)
     

;; Cut-paste  between emacs and the X-clipboard.
;; see http://blog4gng.blogspot.com/2008_02_01_archive.html
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function
      'x-cut-buffer-or-selection-value)


;; rst mode
;; =========

(require 'rst)
(setq auto-mode-alist
      (append '(("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))

(defmacro defrstgrouper (name ss es)
  (list 'progn
	(list 'defun name '()
	      '(interactive)
	      (list 'isolate-region ss es
		    '(region-beginning) '(region-end)))))


(defrstgrouper rst-math-inline-region ":math:`" "`")

(define-key rst-mode-map [(control c) (control m)]
  'rst-math-inline-region)

;;; org-mode
;;; ========

;;; install latest org mode

;; (require 'package)
;; (package-initialize)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; (unless (package-installed-p 'org-plus-contrib)
;;   (package-refresh-contents)
;;   (package-install 'org-plus-contrib))

(load "org-custom.el")


;; tables

(require 'table)

(add-hook 'text-mode-hook 'table-recognize)


;; gconftool-2 -s
;; /desktop/gnome/url-handlers/org-protocol/command
;; '/usr/bin/emacsclient %s' --type String



;; fold-dwim.el
;; http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/fold-dwim.el

(global-set-key (kbd "<f7>")      'fold-dwim-toggle)
(global-set-key (kbd "<M-f7>")    'fold-dwim-hide-all)
(global-set-key (kbd "<S-M-f7>")  'fold-dwim-show-all)



;; (global-font-lock-mode 1)


(autoload 'latex-spread-mode "latex-spread" "Simple LaTeX spreadsheet."  t)
(put 'scroll-left 'disabled nil)


;;; remember

(require 'remember)

(add-hook 'remember-mode-hook 'org-remember-apply-template)

(define-key global-map [(control meta ?r)] 'remember)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;;  '(browse-url-generic-program "/usr/bin/firefox")
 '(browse-url-generic-program "/usr/bin/google-chrome")
 '(comint-password-prompt-regexp "\\(\\([Oo]ld \\|[Nn]ew \\|[Bb]ad \\|Kerberos \\|'s \\|login \\|^\\)?[Pp]assword\\( (again)\\)?\\|[Pp]ass ?phrase,?\\|Enter PEM pass phrase\\|Enter passphrase\\|Enter password\\|try again\\)\\( for [^:]+\\)?\\( try again\\)?:\\s *\\'")
 '(comment-auto-fill-only-comments t)
 '(fill-column 60)
 '(gnuserv-program "/usr/lib/xemacs-21.0/i386-pc-linux/gnuserv")
 '(jde-bug-jpda-directory "/usr/local/java/1.4.1_01/j2sdk")
 '(jde-debugger (quote ("JDEbug")))
 '(jde-javadoc-version-tag-template "nil")
 '(prolog-program-name "gprolog")
 '(py-default-interpreter (quote cpython))
 '(py-jpython-command "jython")
 '(py-python-command "/usr/bin/python")
 '(quack-default-program "/home/choppell/apps/racket/racket-5.1.3/bin/mzscheme")
 '(quack-fontify-style (quote plt))
 '(quack-pltish-fontify-keywords-p t)
 '(quack-pltish-keywords-to-fontify (quote ("define-check" "define-simple-check" "cases" "define-datatype" "and" "begin" "begin0" "c-declare" "c-lambda" "case" "case-lambda" "class" "class*" "class*/names" "class100" "class100*" "compound-unit/sig" "cond" "cond-expand" "define" "define-class" "define-const-structure" "define-constant" "define-embedded" "define-entry-point" "define-external" "define-for-syntax" "define-foreign-record" "define-foreign-type" "define-foreign-variable" "define-generic" "define-generic-procedure" "define-inline" "define-location" "define-macro" "define-method" "define-module" "define-opt" "define-public" "define-reader-ctor" "define-record" "define-record-printer" "define-record-type" "define-signature" "define-struct" "define-structure" "define-syntax" "define-syntax-set" "define-values" "define-values-for-syntax" "define-values/invoke-unit/sig" "define/contract" "define/override" "define/private" "define/public" "define/kw" "delay" "do" "else" "exit-handler" "field" "if" "import" "inherit" "inherit-field" "init" "init-field" "init-rest" "instantiate" "interface" "lambda" "lambda/kw" "let" "let*" "let*-values" "let+" "let-syntax" "let-values" "let/ec" "letrec" "letrec-values" "letrec-syntax" "match-lambda" "match-lambda*" "match-let" "match-let*" "match-letrec" "match-define" "mixin" "module" "opt-lambda" "or" "override" "override*" "namespace-variable-bind/invoke-unit/sig" "parameterize" "parameterize*" "parameterize-break" "private" "private*" "protect" "provide" "provide-signature-elements" "provide/contract" "public" "public*" "quasiquote" "quasisyntax" "quasisyntax/loc" "quote" "receive" "rename" "require" "require-for-syntax" "send" "send*" "set!" "set!-values" "signature->symbols" "super-instantiate" "syntax" "syntax/loc" "syntax-case" "syntax-case*" "syntax-error" "syntax-rules" "unit/sig" "unless" "unquote" "unquote-splicing" "when" "with-handlers" "with-method" "with-syntax" "define-type-alias" "define-struct:" "define:" "let:" "letrec:" "let*:" "lambda:" "plambda:" "case-lambda:" "pcase-lambda:" "require/typed" "require/opaque-type" "require-typed-struct" "inst" "ann" "values")))
 '(quack-pretty-lambda-p nil)
 '(quack-programs (quote ("/home/choppell/sys/apps/racket/racket-5.1.3/bin/mzscheme" "/home/choppell/apps/racket/racket-5.1.3/bin/gracket" "/home/choppell/apps/racket/racket-5.1.3/bin/mzscheme" "/home/choppell/apps/racket/racket-5.1.3/bin/drracket" "bigloo" "csi" "csi -hygienic" "gosh" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "mred -z" "mzscheme" "mzscheme -M errortrace" "mzscheme -il r6rs" "mzscheme -il typed-scheme" "mzscheme3m" "mzschemecgc" "rs" "runscheme" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(require-final-newline nil))

;;; Encrypting files
;;; ----------------
;;; http://emacs.wordpress.com/2008/07/18/keeping-your-secrets-secret/
;;; see http://yenliangl.blogspot.com/2009/12/encrypt-your-important-data-in-emacs.html
(require 'epa)
(epa-file-enable)



;;; For full screen on starting Emacs

(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  )
(when window-system
  (toggle-fullscreen))


;;; To disable the splash screen
(setq inhibit-splash-screen t)

;;; Display Battery Status
(display-battery-mode t)

;;; Show Column Number
(column-number-mode t)

;;; To show date and time
(setq display-time-day-and-date t
     display-time-12hr-format t)
     (display-time)

;;; To set aspell as the default spell-check
;;; ALERT: You might need to install aspell and aspell-en
(setq-default ispell-program-name "aspell")

;;; Set English as the default dictionary
(setq ispell-dictionary "en")

;; ;;; Define hooks for the following file-types
;; (add-hook 'org-mode-hook 'LaTeX-mode-hook 'text-mode-hook)
;; (add-hook 'python-mode-hook 'html-mode-hook 'javascript-mode-hook)

;;; Turn on flyspell mode
(defun turn-on-flyspell () (flyspell-mode t))
(add-hook 'find-file-hooks 'turn-on-flyspell)


;;; Turn on Auto-fill 
(add-hook 'find-file-hooks 'turn-on-auto-fill)

;;; Turn on Linum-mode
;; (add-hook 'find-file-hook '(lambda () (linum-mode t)))

;;; Enable ido-mode on startup
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;;; Using Emacs Package Manager
(setq load-path (cons "/usr/share/emacs/23.3/lisp" load-path))

;;; Turn on parentheses match highlighting
(show-paren-mode 1)

;;; Turn on Syntax Coloring
(global-font-lock-mode 1) 


;;; file-system-types
(require 'pathname)
(setq file-system-types '((unix . unix) (dos . dos)))


;; (text-scale-adjust 3)

;;; scroll-lock mode on
(setq scroll-lock-mode t)
(setq scroll-step 1)

;; replace yes or no with y or n
(fset 'yes-or-no-p 'y-or-n-p) 



;;; start off with a large sized font



;;; info
;;; http://www.emacswiki.org/emacs/InfoPath
(add-to-list 'Info-default-directory-list "~/emacs/info")
(add-hook 
 'Info-mode-hook
 (lambda ()
   (setq Info-additional-directory-list Info-default-directory-list)))


;;; split windows vertically, 
;;; see responses in the blog
;;; http://galder.zamarreno.com/?p=134

(setq split-width-threshold nil)

;;; changing the text size in the minibuffer
;;; http://stackoverflow.com/questions/7869429/altering-the-font-size-for-the-emacs-minibuffer-separately-from-default-emacs

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup)
(defun my-minibuffer-setup ()
       (set (make-local-variable 'face-remapping-alist)
          '((default :height 1.5))))

;;; Restoring font size when visiting files.

;;; https://groups.google.com/forum/#!topic/gnu.emacs.help/0CVSYlNm9J4
 ;; Restore text-scale after change of major mode.

;; ;;  (setq text-scale-mode-amount 3)
;; (autoload 'text-scale-mode "face-remap")
;; (add-hook 'change-major-mode-hook 
;; 	  (lambda ()
;; ;	    (put 'text-scale-mode-amount 'permanent-local t)
;; 	    (text-scale-set 3)
;; 	    ))
;; (add-hook 'after-change-major-mode-hook 'text-scale-mode)

(set-face-attribute 'default nil :height 120)
;; (add-hook 'after-change-major-mode-hook (lambda ()
;; (text-scale-set 3)))


;; British English
(ispell-change-dictionary "british" t)

;; 

;; psvn.el for better svn integration (ships with the
;; subversion package in Fedora) M-x svn-status to add a
;; whole new dimension to your svn-ing!

;; (require 'psvn)
;; run 'svn status' instead of 'svn status -v' in svn-status
;; (setq svn-status-verbose nil)


;; ediff buffers sid-by-side, like it should
(setq ediff-split-window-function 'split-window-horizontally)



;; (add-hook 'before-save-hook 'time-stamp)
;; (add-hook 'org-mode-hook
;;     (lambda ()
;;       ;; file modification date
;;       (set (make-local-variable 'time-stamp-format) "%:y-%02m-%02d %3a %02H:%02M:%02S %Z")
;;       (set (make-local-variable 'time-stamp-start) "^#\\+DATE: +")
;;       (set (make-local-variable 'time-stamp-end) "$")))




;; 
;;; Cleaning unused buffers

;;; http://emacs-fu.blogspot.in/2010/03/cleaning-up-buffers-automatically.html

(require 'midnight)


;; from sankalp [2012-03-24 Sat]
;; openwith minor mode
;; for opening pdfs in evince, mp3s in some player etc...
(require 'openwith)
(setq openwith-associations
      '(
        ("\\.pdf\\'"  "evince"  (file))
        ("\\.ps\\'"   "evince"  (file))
        ("\\.doc\\'"  "ooffice" (file))
        ("\\.docx\\'" "ooffice" (file))
        ("\\.xls\\'"  "ooffice" (file))
        ("\\.xlsx\\'" "ooffice" (file))
        ("\\.ppt\\'"  "ooffice" (file))
        ("\\.pptx\\'" "ooffice" (file))
        ;; ("\\.\\(?:jp?g\\|png\\)\\'" "display" (file))
        ))
(openwith-mode t)



(global-set-key (kbd "C-c [") 'insert-pair)
(global-set-key (kbd "C-c {") 'insert-pair)
(global-set-key (kbd "C-c \"") 'insert-pair)


;;; ebib

(autoload 'ebib "ebib" "Ebib, a BibTeX database manager." t)


;;; macro that send, prints, and evaluates an s-expression

(fset 'send-print-eval-exp
   [?\C-s ?\( ?\C-a ?\C-\M-f ?\C-\M-b ?\C-  ?\C-\M-f ?\M-w ?\C-x ?o ?\C-y S-return ?\C-x ?o])
;; Keyboard Macro Editor.  Press C-c C-c to finish; press C-x k RET to cancel.
;; Original keys: C-s ( C-a M-C-f M-C-b C-SPC M-C-f M-w C-x o C-y <S-return> C-x o
