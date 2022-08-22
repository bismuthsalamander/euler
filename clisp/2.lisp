(defun fibnext (fib) (+ (first fib) (first (rest fib))))

(defun fibmax (max &optional (fib '(1 0))) (if (> (fibnext fib) max) fib (fibmax max (cons (fibnext fib) fib))))

(defun sumeven (items)
  (setf sum 0)
  (dolist (val items)
    (setf sum (+ sum
      (if (= (mod val 2) 0) val 0)
    )))
  sum)

;(print (sumeven '(1 2 3 4 5 6)))
;(print (fibmax 20))
;(print (sumeven (fibmax 20)))
;(print (fibmax 4000000))
(print (sumeven (fibmax 4000000)))
