(setf *dp* (make-hash-table :test 'equalp))

(defun cstep (n)
  (if (= (mod n 2) 0) (/ n 2) (+ (* 3 n) 1)))

(defun countcsteps(n)
  (if (/= 0 (gethash n *dp* 0)) (gethash n *dp*)
    (do ((steps 0) (remainder n))
      ((= remainder 1) (setf (gethash n *dp*) steps) steps)
      (setf remainder (cstep remainder))
      (setf steps (1+ steps))
      (if (/= 0 (gethash remainder *dp* 0)) (progn
          (setf (gethash n *dp*) (+ steps (gethash remainder *dp*)))
          (return (gethash n *dp*)))))))

(defun maxsteps(top)
  (do ((winner 0) (hiscore 0) (n 1 (1+ n)))
    ((= n top) (format t "FINAL WINNER ~d STEPS ~d~%" winner hiscore) winner)
    (let ((score (countcsteps n))) (if (> score hiscore) (progn (setf hiscore score) (setf winner n) (format t "new hiscore of ~d by ~d~%" hiscore winner))))))

(print (maxsteps 1000000))
