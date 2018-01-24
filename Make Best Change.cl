(defun make-best-change (change &optional (denomlist '(25 10 5 1)))
  (cond 
   ((null change) nil)
   (t (values-list (nreverse (car (return-change change denomlist)))))))

(defun find-change (change denomlist &key (opt nil) (val nil))
  (do ((cents (return-coinlist change denomlist) (cdr cents))
       (optlist opt (return-change (- change (* (car denomlist) (car cents))) (cdr denomlist)
                                    :opt optlist :val (cons (car cents) val))))
      ((null cents) (cond
                     ((or (null optlist)
                          (< change (cdr optlist))) (cons val change))
                     ((and (< (reduce #'+ val) (reduce #'+ (car optlist)))
                           (= change (cdr optlist))) (cons val change))
                     (t optlist)))))

(defun find-coinlist (change denomlist) 
  (let* ((i (1+ (floor change (car denomlist)))) 
             (n i))
        (mapcar #'(lambda (x) (decf n)) (make-list i))))