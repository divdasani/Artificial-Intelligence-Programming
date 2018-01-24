(defmacro preserve (varlist &body body)
  `((lambda ,varlist ,@body) ,varlist))