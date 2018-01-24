;;9-6
(defun horner (x &rest nums)
  (reduce #'(lambda (val1 val2)
              (+ (* x val1) val2)) 
          nums))