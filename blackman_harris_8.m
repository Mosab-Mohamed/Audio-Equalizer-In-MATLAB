function Hd = blackman_harris_8(input)
%BLACKMAN_HARRIS_8 Returns a discrete-time filter object.

%
% MATLAB Code
% Generated by MATLAB(R) 7.12 and the Signal Processing Toolbox 6.15.
%
% Generated on: 25-Jan-2016 16:18:04
%

% FIR Window Bandpass filter designed using the FIR1 function.

% All frequency values are in kHz.
Fs = input;  % Sampling Frequency

N    = 50;       % Order
Fc1  = 12;       % First Cutoff Frequency
Fc2  = 14;       % Second Cutoff Frequency
flag = 'scale';  % Sampling Flag
% Create the window vector for the design algorithm.
win = blackmanharris(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);
Hd = dfilt.dffir(b);

% [EOF]
