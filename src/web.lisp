(in-package :cl21-user)
(defpackage jasonrobot.web
  (:use :cl
        :caveman2
        :jasonrobot.config
        :jasonrobot.view
        :jasonrobot.db
        :jasonrobot.markdown
        :datafly
        :sxql
        :cl-markup
        :cl21.re)
  ;; (:import-from :jasonrobot.markdown
                ;; :render-md)
  (:export :*web*))
(in-package :jasonrobot.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render-page
   '(:p "Hello, world!")))

(defroute "/markdown" ()
  (render-md #P"posts/test.md"))

(defroute "/test-page" ()
  (render-cl-markup "test-page.lisp"))

(defroute "/post/:name" (&key name)
  (render-cl-markup (merge-pathnames (format nil "../posts/~a.lisp" name))))


;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
