(setf *ones* '(0 3 3 5 4 4 3 5 5 4 3))
(setf *teens* '(0 0 0 0 0 0 0 0 0 0 3 6 6 8 8 7 7 9 8 8))
(setf *tens* '(0 3 6 6 5 5 5 7 6 6))
(setf *hundred* (length "hundred"))
(setf *thousand* (length "thousand"))

(defun len-twodig (val)
  (if (= 0 val) 0
    (if (and (>= val 10) (<= val 19))
      (elt *teens* val)
      (if (< val 10)
        (elt *ones* val)
        (progn (print val) (+ (elt *tens* (/ (- val (mod val 10)) 10)) (elt *ones* (mod val 10))))))))

(defun len-hundreds (val)
  (if (= val 0) 0
    (if (= val 1000) (+ (length "one") *thousand*) (+ (elt *ones* (/ val 100)) *hundred*))))

(defun len-fourdig (val)
  (let ((hundreds (- val (mod val 100))) (subhundreds (mod val 100)))
    (format t "~%hundreds ~d subhundreds ~d" hundreds subhundreds)
    (print (len-twodig subhundreds))
    (print (len-hundreds hundreds))
    (+ (len-hundreds hundreds) (len-twodig subhundreds) (+ (if (> (* subhundreds hundreds) 0) (length "and") 0)))))
    
(defun sumdig (n)
  (do ((sum 0) (str (write-to-string n) (subseq str 1)))
    ((equalp (subseq str 0) "") sum)
    (setf sum (+ sum (search (subseq str 0 1) "0123456789")))
    (print sum)
    (print str)))

(do ((i 1 (1+ i)))
  ((> i 25))
  (format t "~%number: ~d digits: ~d digits: ~d" i (len-twodig i) (len-fourdig i)))

(do ((i 1 (1+ i)))
  ((> i 10))
  (format t "~%number: ~d digits: ~d" (* i 100) (len-hundreds (* i 100))))
  
(setf tmp 0)
(do ((i 1 (1+ i)))
  ((> i 1000))
  (setf tmp (+ tmp (len-fourdig i))))
(print tmp)
  