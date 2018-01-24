;;Lisp 3: Make Balance
;;Code Critic says that I shouldn't "reassign input parameters",
;;but I see no other way to retain the balance value
(defun make-balance (initial-balance)
    (lambda (&optional (increment 0)) (incf initial-balance increment)))