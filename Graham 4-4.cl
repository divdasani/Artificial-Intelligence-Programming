(defun bst-elements (mytree)
  (cond
   (mytree
    (append (bst-elements (node-r mytree))
            (list (node-elt mytree))
            (bst-elements (node-l mytree))))
   (t nil)))

(defun bst-elements (mytree)
  (let ((mylist nil))
    (bst-traverse #'(lambda (val) (push val mylist)) mytree)
    mylist))