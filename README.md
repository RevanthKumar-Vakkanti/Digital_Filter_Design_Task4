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
 
where:
     
   * x[n] is the input signal.
   
   * y[n] is the output signal.
   
   * 𝑏𝑖 are the filter coefficients (also called tap weights).
   
   * N is the number of filter taps (length of the filter).

## Example of a Simple FIR Filter
   
  Let's consider a 4-tap FIR filter with coefficients: 
     
   -> 𝑏0 = 2, 𝑏1 = 4, 𝑏2 = 6, 𝑏3 = 8
    
  If the input sequence is:
     
   -> x[n]=10,20,30,40,50,… 

 Then the output is computed as:

  -> y[n] = (2 × x[n]) + (4 × x[n−1]) + (6 × x[n−2]) + (8 × x[n−3])

  For example:

When 

   * x = 10, output y = 2(10) + 4(0) + 6(0) + 8(0) = 20
  
   * x = 20, output y = 2(20) + 4(10) + 6(0) + 8(0) = 40 + 40 = 80
   
   * And so on…

## Applications of FIR Filters
  
   FIR filters are widely used in:
       
   1. Audio Processing – Equalizers, noise reduction, echo cancellation.
   
   2. Image Processing – Edge detection, blurring, sharpening.
   
   3. Communication Systems – Channel equalization, modulation, demodulation.
   
   4. Biomedical Signal Processing – ECG filtering, EEG signal enhancement.

## OUTPUT WAVEFORM:

![Image](https://github.com/user-attachments/assets/6ae67035-eaed-4f4c-8566-60a32cdcb096)

## OUTPUT WAVEFORM INCULDING SHIFT REGISTERS:

![Image](https://github.com/user-attachments/assets/78cd07a9-fb4b-4efd-97ce-07cb6fda3ecc)

## SCHEMATIC DIAGRAM:


