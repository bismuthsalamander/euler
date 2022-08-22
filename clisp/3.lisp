(setf *primes* '(3 2))

(defun divides (factor product)
  (= (mod product factor) 0))

(defun anydivide (product factors)
  (find-if #'(lambda (x) (divides x product)) factors))
  
(defun addaprime ()
  (do ((try (+ (first *primes*) 2) (+ try 2)))
    ((not (anydivide try *primes*)) (setf *primes* (cons try *primes*)))))
    
(defun ensureprimes (n)
  (do () ((> (first *primes*) n)) (addaprime)))

(defun find-pf(n)
  (let ((factors (make-hash-table :test 'equalp)))
      (do ((remaining n)) ((= remaining 1))
        (setf f (find-if #'(lambda (x) (divides x remaining)) *primes*))
        (if (eql f nil) (addaprime)
        (progn
          (setf (gethash f factors) (1+ (gethash f factors 0)))
          (setf remaining (/ remaining f)))))
      factors))
      
(defun findtri()
  (let ((sum 3) (lastadded 2)) 
    (do () ((> (countdiv sum) 500) sum) (print lastadded) (setf lastadded (1+ lastadded)) (setf sum (+ lastadded sum)))))

(defun printdiv(n)
  (do ((i 1 (1+ i)))
    ((> i n))
    (if (divides i n) (print i))))

(defun countdiv(n)
  (let ((mypf (find-pf n)) (totaldiv 1))
    (maphash #'(lambda (key val) (setf totaldiv (* totaldiv (1+ val)))) mypf)
    totaldiv))
(print "Calculating prime factorization of target number...")
(print (find-pf 600851475143))
