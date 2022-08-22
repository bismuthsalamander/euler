#|
(defun anydivide (product factors)
  (if (= 0 (length factors))
    nil
    (if (= 0 (mod product (first factors)))
      t
      (anydivide product (rest factors)))))
|#

(defun addaprime (primes)
  (do ((try (+ (first primes) 2) (+ try 2)))
    ((not (anydivide try primes)) (cons try primes))))

#|
(defun maxprime (composite primes)
  (do
    ((maxprime 0)
     (theprime (find-if #'(lambda (x) (divides x composite)) primes) (find-if #'(lambda (x) (divides x composite)) primes))
     (remaining composite))
    ((= theprime nil) maxprime)
    (print "iter")
    (setf remaining (/ remaining theprime)))
    (print "reduced to" remaining theprime))
  |#
(defun maxprime (composite primes)
  (setf val (find-if #'(lambda (x) (divides x composite)) primes))
  (if (not val) 1 val))

#|
(defun findmaxprime(composite primes)
  (do ((remaining composite (/ remaining theprime))
  (theprime 0))
  ((not theprime) (print "exiting, here's remaining") (print remaining))
  (print "setting")
  (setf theprime (maxprime remaining primes))
  (print theprime)))
|#
(defun findmaxprime(composite)
  (do (
  (primes '(3 2) (addaprime primes))
  (remaining composite (/ remaining theprime))
  (theprime 1 (maxprime (/ remaining theprime) primes))
  (maxprime 1 (max theprime maxprime)))
  ((and (= theprime 1) (> (first primes) remaining)) maxprime)))
  #|
  (print "iter")
  (print "theprime")
  (print theprime)
  (print "remaining")
  (print remaining)
  (print "first primes")
  (print (first primes))
  (print (> (first primes) (ceiling (/ remaining 2))))|#
  #|
  (do
    ((maxprime 0)
     (theprime 0)
     (remaining composite))
    ((not theprime) maxprime)
    (print "iter")
    (setf theprime 
    (print theprime)
    (setf remaining (/ remaining theprime))
    (print remaining)
    (print theprime)))|#
(defun divides (factor product)
  (= (mod product factor) 0))

(defun anydivide (product factors)
  (find-if #'(lambda (x) (print x) (divides x product)) factors))
  
#|
(defun checkdivide (product factors)
  (do ((remaining factors (rest factors)) (f (elt factors i) (elt factors i)
    ((>= i (length factors)) (if (divides ((elt factors i)
    |#
(defun makeprimes (max)
  (do
    ((primes '(3 2)) (try 5 (+ try 2)))
    ((> try max) primes)
    (if (not (anydivide try primes))
      (setf primes (cons try primes)))))

(defun genprimes (max primes try)
  (if (> try max)
    primes
    (if (anydivide try primes)
      (genprimes max primes (+ try 2))
      (genprimes max (cons try primes) (+ try 2)))))

(defun findfactor (product max primes)
  (if (and (= (mod product max) 0) (= max (find max primes)))
    max
    (findfactor product (- max 1))))

; (setf p (genprimes 5000 '(3 2) 5))
;(setf p (findmaxprime 600851475143))
;(print p)
#|
(setf p '(3 2))
(do ((i 0 (1+ i)))
  ((> i 10002) (print p))
  (setf p (addaprime p))
  (print (length p)))
|#
(defun primecheck (composite)
  (do ((n (- (1- composite) (- 1 (mod (1- composite) 2))) (1- n)))
    ((= (mod composite n) 0) (= n 1))))
(print (primecheck 2))
(print (primecheck 3))
(print (primecheck 4))
(print (primecheck 5))
(print (primecheck 6))
(print (primecheck 7))
(print (primecheck 8))
(print (primecheck 9))
(print (primecheck 2000000))
(print (primecheck 1999999))
(print (primecheck 1999998))
(print (primecheck 1999997))
(print (primecheck 1999996))
(print (primecheck 1999995))
(print (primecheck 1999994))
(print (primecheck 2000000))
(print (primecheck 2000000))
(print (primecheck 2000000))
;(print p)