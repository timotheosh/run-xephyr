;;;; run-xephyr.asd

(asdf:defsystem #:run-xephyr
  :description "Describe run-xephyr here"
  :author "Tim Hawes <trhawes@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-fad)
  :components ((:file "package")
               (:file "run-xephyr"))
  :build-operation "asdf:program-op"
  :build-pathname "target/run-xephyr"
  :entry-point "run-xephyr:-main")
