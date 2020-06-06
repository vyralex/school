(defun my-find (list elem &key (test #'equal))
  (if list
      (if (funcall test elem (car list))
          elem
        (my-find (cdr list) elem :test test))
    nil))
