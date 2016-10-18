#lang scribble/manual

@(require (for-label racket xml/xml))

@title{Web IO for Fundamentals I, 2016, Northeastern University}
@author{matthias}

@defmodule[web-io]

The teachpack provides a single function: 

@defproc[(show-in-browser [x xexpr?]) string?]{
 Translates the given X-expression into a String. It also has the
 @bold{effect} of opening an external browser and displaying the
 X-expression rendered as XHTML.}

@history[
 #:changed "1.0" @list{Tue Oct 18 11:38:26 EDT 2016}
]
