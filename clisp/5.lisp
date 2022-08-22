(defun divides (factor product)
  (= (mod product factor) 0))

(defun anydivide (product factors)
  (find-if #'(lambda (x) (divides x product)) factors))
  
(defun makeprimes (max)
  (do
    ((primes '(3 2)) (try 5 (+ try 2)))
    ((> try max) primes)
    (if (not (anydivide try primes))
      (setf primes (cons try primes)))))

(defun countprime (prime composite)
  (do ((count 0 (1+ count)) (c composite (/ c prime)))
    ((or (/= 0 (mod c prime)) (= c 1)) count)))

(defun maxcountprime (prime composites)
  (apply #'max (mapcar #'(lambda(x) (countprime prime x)) composites)))

(defun primefac (prime composites)
  (expt prime (maxcountprime prime composites)))

(setf myprimes (makeprimes 20))
(setf mynums '(20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2))
(print (apply #'* (mapcar #'(lambda (x) (primefac x mynums)) myprimes)))