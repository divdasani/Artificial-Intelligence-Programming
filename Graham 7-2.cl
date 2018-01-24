(defun map-stream (myfn mystr)
  (let ((x (gensym)))
    (do ((myexpr (read mystr nil x) (read mystr nil x))
         (ret nil (funcall myfn myexpr)))
        ((eql x myexpr)))))

(defun map-file (myfn mypath)
  (with-open-file (mystr mypath :direction :input)
    (map-stream myfn mystr)))