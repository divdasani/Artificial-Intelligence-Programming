(defstruct 3tree
  (data nil)
  (left nil)
  (middle nil)
  (right nil))

(defun 3tree-clone (mytree)
  (cond 
   ((null mytree) nil)
   (t (make-3tree :data   (3tree-data mytree)
                  :left   (3tree-clone (3tree-left mytree))
                  :middle (3tree-clone (3tree-middle mytree))
                  :right  (3tree-clone (3tree-right mytree))))))

(defun 3tree-member (myobj mytree)
  (when mytree
    (or
     (eql myobj (3tree-data mytree))
     (3tree-member myobj (3tree-left mytree))
     (3tree-member myobj (3tree-middle mytree))
     (3tree-member myobj (3tree-right mytree)))))