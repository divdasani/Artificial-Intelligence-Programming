;;4
(defun greater (x y)
  (cond ((> x y) x)
        (t y)))

;;7
(defun has-list-p (mylist)
  (if mylist 
      (or (listp (car mylist))
          (has-list-p (cdr mylist)))
    nil))

;;8a-iterative
(defun print-dots (x)
  (do ((i 1 (1+ i)))
      ((> i x))
    (format t ".")))

;;8a-recursive
(defun print-dots (x)
  (cond ((> x 0) (format t ".") (print-dots (1- x)))
        (t nil)))

;;8b-iterative
(defun get-a-count (mylist)
  (do ((mylist1 mylist (cdr mylist1))
       (i 0 (+ i (if (eql (car mylist1) 'a) 1 0))))
      ((not mylist1) i)))

;;8b-recursive
(defun get-a-count (mylist)
  (if mylist (+ (if (eql (car mylist) 'a) 1 0) (get-a-count (cdr mylist))) 0))

;;9a) the value of lst is unchanged after the command (remove nil lst)
(defun summit (lst)
  (apply #'+ (remove nil list)))

;;9b) there is no else statement for the final recursion
(defun summit (lst)
  (if lst (+ (if (null (car lst)) 0 (car lst)) (summit (cdr lst))) 0))