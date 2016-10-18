#lang racket

;; show an X-expression in the browser 

;; -----------------------------------------------------------------------------
;; services 

(provide
 ;; X-expression -> String
 ;; converts the given X-expression to a String
 ;; EFFECT sends the String to an external browser 
 show-in-browser)

;; -----------------------------------------------------------------------------
;; dependencies 

(require net/sendurl)
(require xml/xml)
(require htdp/error)

(module+ test
  (require rackunit))

;; -----------------------------------------------------------------------------
;; implementation 

(define (show-in-browser x)
  (check-the-argument x (xexpr? x))
  (define x-as-string (xexpr->string x))
  (send-url/contents x-as-string #true)
  x-as-string)

;; Any Boolean [String] -> Void 
(define (check-the-argument x y [expected "X-expression"])
  (check-arg 'show-in-browser y expected "first" x))

;; -----------------------------------------------------------------------------
;; tests 

(module+ test
  (check-exn exn:fail? (lambda () (show-in-browser #f)))
  (check-exn exn:fail?
             (lambda ()
               (show-in-browser '(html ([a 10]) (body (b "hello world")))))))
