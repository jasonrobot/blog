(in-package :cl21-user)
(defpackage jasonrobot.markdown
  (:use :cl)
  (:import-from :cl-markdown
                :markdown)
  (:export :render-md))
(in-package :jasonrobot.markdown)

(defun render-md (path)
  (multiple-value-bind
        (--doc html-string)
      (markdown (merge-pathnames *default-pathname-defaults* path) :stream nil)
    html-string))
