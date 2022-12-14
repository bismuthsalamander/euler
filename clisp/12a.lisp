(setf *primes* '(3 2))
(defun divides (factor product)
  (= (mod product factor) 0))

(defun anydivide (product factors)
  (find-if #'(lambda (x) (divides x product)) factors))
  
(defun addaprime ()
  ;(print "adding a prime - length and first:")
  ;(print (length *primes*))
  ;(print (first *primes*))
  (do ((try (+ (first *primes*) 2) (+ try 2)))
    ((not (anydivide try *primes*)) (setf *primes* (cons try *primes*)))))
    
(defun ensureprimes (n)
  (do () ((> (first *primes*) n)) (addaprime)))

(print "ensuring")
(ensureprimes 50000)
(print "ensured")
;(print *primes*)
;(ensureprimes 254)
;(print *primes*)
;(print (countfac 6))
;(print (countfac 28))

(defun find-pf(n)
  (ensureprimes n)
  (let ((factors (make-hash-table :test 'equalp)))
      (do ((remaining n)) ((= remaining 1))
        (setf f (find-if #'(lambda (x) (divides x remaining)) *primes*))
        (setf (gethash f factors) (1+ (gethash f factors 0)))
        (setf remaining (/ remaining f)))
      factors))
      
(defun findtri()
  (let ((sum 3) (lastadded 2)) 
    (do () ((> (countdiv sum) 500) sum) (format t "~d (~d)~%" lastadded (first *primes*)) (setf lastadded (1+ lastadded)) (setf sum (+ lastadded sum)))))

(defun printdiv(n)
  ;(let ((tmp 0))
  (do ((i 1 (1+ i)))
    ((> i n))
    (if (divides i n) (print i))))

(defun countdiv(n)
  (let ((mypf (find-pf n)) (totaldiv 1))
    (maphash #'(lambda (key val) (setf totaldiv (* totaldiv (1+ val)))) mypf)
    totaldiv))
    
;(print (findtri))

;(printdiv 73920)

;(print (find-pf 99))
;(print (find-pf 13720))
;(print (countdiv 28))
;(print (countdiv 99))
;(print (countdiv 13720))
(print (findtri))
