;; Defining global variables

(defparameter *small* 1) ;; can be overwritten
(defparameter *big* 100)

(defvar *foo* 5) ;; cannot be overwritten

;; see (describe 'ash)
(defun guess-my-number ()
  (ash (+ *small* *big*) -1))

;; 1- is a prebuilt function 
(defun smaller ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))

(defun bigger ()
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))

(defun start-over ()
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))

;; To see documentation of a function: (describe 'mapcar)

;; Defining local variables

(let ((a 5)
      (b 6))
  (+ a b))

;; Defining local functions

(flet ((f (n)
	 (+ n 10)))
  (f 5))

(flet ((f (n)
	 (+ n 10))
       (g (n)
	 (- n 3)))
  (g (f 5)))

;; to go to the paired parenthesis C-M f (close) or C-M b (open)

;; Identical to flet but make function names available in defined functions

(labels ((f (n)
	 (+ n 10))
       (g (n)
	 (- n (f n))))
  (g (f 5)))

;; labels is used for recursion
