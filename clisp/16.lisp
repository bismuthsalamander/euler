(defun sumdig (n)
  (do ((sum 0) (str (write-to-string n) (subseq str 1)))
    ((equalp (subseq str 0) "") sum)
    (setf sum (+ sum (search (subseq str 0 1) "0123456789")))
    (print sum)
    (print str)))

(print (sumdig 1234567890))
(print (sumdig (expt 2 1000)))