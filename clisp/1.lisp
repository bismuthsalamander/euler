(defun range (min max)
  (setf ret NIL)
  (dotimes (i (- max min))
    ( setf ret (cons (+ i min) ret) ))
  (reverse ret))

(defun fbval (x)
  (if (or (= 0 (mod x 3)) (= 0 (mod x 5))) x 0))

(defun fbsum (x)
  (setf ret 0)
  (dolist (val x)
    (setf ret (+ ret (fbval val))))
  ret)

(print (fbsum (range 2 1000)))