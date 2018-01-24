(defmacro nth-expr (n &rest exp)
    `(case ,n
       ,@(loop for x in exp
               for n from 1
               collect `((,n) ,x))))

(defmacro n-of (n exp)
  (let ((i (gensym))
        (mylist (gensym))
        (num (gensym)))
    `(do ((,num ,n)
          (,i 0 (1+ ,i))
          (,mylist nil (cons ,exp ,mylist)))
         ((= ,i ,num) (reverse ,mylist)))))