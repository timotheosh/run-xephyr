;;;; run-xephyr.lisp

(in-package #:run-xephyr)

(defun get-display-number (path)
  "Takes a pathname and returns the display number as an integer"
  (multiple-value-bind (display pos)
      (parse-integer (subseq (namestring (path:basename path)) 1))
    display))

(defun get-next-display ()
  (1+ (car (sort (mapcar 'get-display-number (cl-fad:list-directory "/tmp/.X11-unix")) '>))))

(defun run-xephyr ()
  (let ((display (format nil ":~A" (get-next-display))))
    (uiop:launch-program (list "Xephyr" "-resizeable" display) :ignore-error-status t)
    (uiop::setf (uiop:getenv "DISPLAY") display) ;; Set $DISPLAY to the new display
    (uiop:run-program (list "konsole" "--display" display) :ignore-error-status t)))

(defun -main()
  (run-xephyr))
