(defun findtrip(total)
  (do ((a 1 (1+ a)))
    ((>= a total))
    (do ((b 1 (1+ b)))
      ((> b a))
      (setf c (sqrt (+ (* b b) (* a a))))
      (if (=(+ b a c) total) (return (format t "~d * ~d * ~d = ~d" a b c (* a b c)))))))

(findtrip 1000)
