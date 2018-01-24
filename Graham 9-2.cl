(defun make-change (value &optional (denomlist '(25 10 5 1)))
  (values-list (return-coins value denomlist)))

(defun return-coins (value denomlist)
  (if (not (null denomlist))
      (multiple-value-bind (a b)
          (floor value (car denomlist))
        (cons a (return-coins b (cdr denomlist))))
    nil))