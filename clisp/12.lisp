(defun divides (factor product)
  (= (mod product factor) 0))

(defun countfac (n)
  ;init count to 2; saves us having to count 1 and n
  (do ((f 2 (1+ f)) (count 2))
    ((> f (/ n 2)) count)
    (if (divides f n) (setf count (1+ count)))))

;(print (countfac 6))
;(print (countfac 28))

(defun findtri()
  (let ((sum 3) (lastadded 2)) 
    (do () ((> (countfac sum) 200) sum) (print lastadded) (setf lastadded (1+ lastadded)) (setf sum (+ lastadded sum)))))

(defun printdiv(n)
  ;(let ((tmp 0))
  (do ((i 1 (1+ i)))
    ((> i n))
    (if (divides i n) (print i))))
(print (findtri))

(printdiv 73920)
