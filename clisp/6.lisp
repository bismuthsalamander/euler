(defun squaresum (max)
  (expt (/ (* max (1+ max)) 2) 2))

(defun sumsquares (max)
  (do ((sum 0) (i 1 (1+ i)))
    ((> i max) sum)
    (setf sum (+ sum (* i i)))))
    
(print (- (squaresum 100) (sumsquares 100)))
