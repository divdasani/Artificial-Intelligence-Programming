(defun longest-path (initial final paths)
  (or (nreverse (dfs final (list initial) paths))
      (cond
       ((eql initial final) (list initial))
       (t nil))))

(defun longest (temp best)
  (cond
   ((> (length best) (length temp)) best)
   (t temp)))

(defun valid-cycle (end temp)
  (and (eql (car temp) end)
       (eql (car (last temp)) end)))

(defun dfs (final current paths)
  (do ((neighbors (cdr (assoc (car current) paths)) (cdr neighbors))
       (best nil (longest best (get-path final (car neighbors) current best paths))))
      ((null neighbors) best)))

(defun get-path (final neighbors temp best paths)
  (let ((mp (cond
                 (neighbors (cons neighbors temp))
                 (t nil))))
    (cond
      ((null mp) nil)
      ((valid-cycle final mp) mp)
      ((eql (car mp) final) mp)
      ((member (car mp) (cdr mp)) best)
      (t (dfs final mp paths)))))
