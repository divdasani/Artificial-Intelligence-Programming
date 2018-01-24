(defun solve (fn minval maxval ep)
 (solve-1 fn minval maxval (funcall fn minval) (funcall fn maxval) ep))

(defun solve-1 (fn minval maxval fnmin fnmax ep)
  (let* ((avg (* 0.5 (+ minval maxval)))
        (fnavg (solve-2 fn avg)))
    (cond
     ((< (- maxval minval) ep) avg)
     ((= 0 fnmin) minval)
     ((= 0 fnavg) avg)
     ((= 0 fnmax) maxval)
     ((> 0 (* fnmin fnavg)) (solve-1 fn minval avg fnmin fnavg ep))
     ((> 0 (* fnmax fnavg)) (solve-1 fn avg maxval fnavg fnmax ep))
     (t nil))))

(defun solve-2 (fn avg)
  (funcall fn avg))