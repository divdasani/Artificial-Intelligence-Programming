;;5-8
(defun max-min (v &key (start 0) (end (length v)) maxval minval)
  (cond
   ((= start end) (values maxval minval))
   (t
    (let* ((maxval (max (svref v start) (or maxval (svref v start))))
           (minval (min (svref v start) (or minval (svref v start)))))
      (max-min v :start (incf start) :end end :maxval maxval :minval minval)))))