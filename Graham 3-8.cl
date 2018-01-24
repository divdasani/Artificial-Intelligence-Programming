;;show-dots
(defun show-dots (mylist)
  (cond
    ((atom mylist) (format t "~a" mylist))
    (t  (format t "(")
        (show-dots (car mylist))
        (format t " . ")
        (show-dots (cdr mylist))
        (format t ")"))))

;;show-list
(defun show-list (mylist)
  (cond
   ((atom mylist) (format t "~s" mylist))
   (t (format t "[")
      (do ((element mylist (cdr element)))
          ((null element) (format t "]"))
        (cond ((atom element) 
               (format t ". ~a]" element)
               (return-from show-list))
              (t (show-list (car element))
                 (when (cdr element)
                   (format t " "))))))))