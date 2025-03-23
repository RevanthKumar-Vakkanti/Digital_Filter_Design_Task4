# Digital Filter Design

*COMPANY*: CODTECH IT SOLUTIONS

*NAME*: VAKKANTI LAKSHMI REVANTH KUMAR

*INTERN ID*: CT08VZT

*DOMAIN*: VLSI

*DURATION*: 4 WEEKS

*MENTOR*: NEELA SANTOSH KUMAR

## DESCRIPTION: TASK-4

=> Design and simulate a digital FIR (Finite Impulse Response) Filter using Verilog or MATLAB.

  * A Finite Impulse Response (FIR) filter is a type of digital filter used in signal processing to modify or enhance signals.
    It is called "finite" because it only depends on a finite number of past and present input values and does not have feedback (i.e., no recursive elements).

## Key Features of an FIR Filter:
  
  1. *No Feedback* – The output depends only on the current and past input values, unlike Infinite Impulse Response (IIR) filters, which use feedback.
  
  2. *Finite Duration Response* – If you input an impulse (a single '1' followed by '0's), the output will settle to zero after a finite number of steps.
  
  3. *Linear Phase* – FIR filters can be designed to have a linear phase response, meaning they do not distort the phase of different frequency components in a signal.
  
  4. *Stability* – Since there is no feedback, FIR filters are inherently stable.

## Mathematical Representation

  An FIR filter computes its output y[n] as a weighted sum of the current and past input values:
        
   -> y[n]= b0 . x[n] + b1 . x[n−1] + b2 . x[n−2] + ⋯ + bN−1 . x[n−(N−1)]
 
