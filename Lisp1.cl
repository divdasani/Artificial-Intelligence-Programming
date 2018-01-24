;;Lisp 1
(defun has-number-p (mylist)
  (cond
   ((atom mylist) (numberp mylist))
   (t (some #'has-number-p mylist))))