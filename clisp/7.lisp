(defun addaprime (primes)
  (do ((try (+ (first primes) 2) (+ try 2)))
    ((not (anydivide try primes)) (cons try primes))))

(defun divides (factor product)
  (= (mod product factor) 0))

(defun anydivide (product factors)
  (find-if #'(lambda (x) (divides x product)) factors))
  
(setf p '(3 2))
(do ((i 0 (1+ i)))
  ((= 10001 (length p)) (format t "biggestprime: ~d~%" (first p)))
  (setf p (addaprime p))
  (if (divides 100 (length p)) (format t "numprimes ~d~%" (length p))))
