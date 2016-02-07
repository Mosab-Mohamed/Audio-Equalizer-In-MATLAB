prompt='Enter wave file ';
file_name = input(prompt);

[x Fs]=wavread(file_name);

prompt='Rate:\n1-normal\n2-half\n3-double\n';
rate = input(prompt);

if rate == 1
    rate = Fs;
end
if rate==2
    rate = Fs * 0.5;
end
if rate==3
        rate = Fs * 2;
end

temp = 1;
while temp~=4
    prompt='What do you want:\n1-Play Original\n2-Plot Original(Time Domain)\n3-Plot Original(Frequncy Domain)\n4-continue\n';
    temp = input(prompt);

    if temp==1
        sound(x, rate);
    end
    if temp == 2
        t=linspace(0, length(x)/Fs,length(x));
        plot(t, x); 
    end
    if temp == 3
        Nfft = length(x);
        f=linspace(0, Fs, Nfft);
        G=abs(fft(x, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
    end
end

prompt='Choose filter:\n1-IIR\n2-Blackman Harris\n3-Equaripple\n4-Hamming\n5-Least Square\n6-Rectangular\n';
filter_type = input(prompt);

if filter_type == 1
     H_1=IIR_1(Fs);
     H_2=IIR_2(Fs);
     H_3=IIR_3(Fs);
     H_4=IIR_4(Fs);
     H_5=IIR_5(Fs);
     H_6=IIR_6(Fs);
     H_7=IIR_7(Fs);
     H_8=IIR_8(Fs);
     H_9=IIR_9(Fs);
end
if filter_type == 2
     H_1=blackman_harris_1(Fs);
     H_2=blackman_harris_2(Fs);
     H_3=blackman_harris_3(Fs);
     H_4=blackman_harris_4(Fs);
     H_5=blackman_harris_5(Fs);
     H_6=blackman_harris_6(Fs);
     H_7=blackman_harris_7(Fs);
     H_8=blackman_harris_8(Fs);
     H_9=blackman_harris_9(Fs);
end
if filter_type == 3
     H_1=Equaripple_1(Fs);
     H_2=Equaripple_2(Fs);
     H_3=Equaripple_3(Fs);
     H_4=Equaripple_4(Fs);
     H_5=Equaripple_5(Fs);
     H_6=Equaripple_6(Fs);
     H_7=Equaripple_7(Fs);
     H_8=Equaripple_8(Fs);
     H_9=Equaripple_9(Fs);
end
if filter_type == 4
     H_1=hamming_1(Fs);
     H_2=hamming_2(Fs);
     H_3=hamming_3(Fs);
     H_4=hamming_4(Fs);
     H_5=hamming_5(Fs);
     H_6=hamming_6(Fs);
     H_7=hamming_7(Fs);
     H_8=hamming_8(Fs);
     H_9=hamming_9(Fs);
end
if filter_type == 5
     H_1=leastSquare_1(Fs);
     H_2=leastSquare_2(Fs);
     H_3=leastSquare_3(Fs);
     H_4=leastSquare_4(Fs);
     H_5=leastSquare_5(Fs);
     H_6=leastSquare_6(Fs);
     H_7=leastSquare_7(Fs);
     H_8=leastSquare_8(Fs);
     H_9=leastSquare_9(Fs);
end
if filter_type == 6
     H_1=rectangular_1(Fs);
     H_2=rectangular_2(Fs);
     H_3=rectangular_3(Fs);
     H_4=rectangular_4(Fs);
     H_5=rectangular_5(Fs);
     H_6=rectangular_6(Fs);
     H_7=rectangular_7(Fs);
     H_8=rectangular_8(Fs);
     H_9=rectangular_9(Fs);
end

y_1=filter(H_1, x);
y_2=filter(H_2, x);
y_3=filter(H_3, x);
y_4=filter(H_4, x);
y_5=filter(H_5, x);
y_6=filter(H_6, x);
y_7=filter(H_7, x);
y_8=filter(H_8, x);
y_9=filter(H_9, x);

temp = 1;
while temp~=10
    prompt='What do you want:\n1-Plot Band 1\n2-Plot Band 2\n3- Plot Band 3\n4-Plot Band 4\n5-Plot Band 5\n6- Plot Band 6\n7- Plot Band 7\n8- Plot Band 8\n9- Plot Band 9\n10- Continue\n';
    temp = input(prompt);

    if temp==1
        t=linspace(0, length(y_1)/Fs,length(y_1));
        plot(t, y_1); 
        Nfft = length(y_1);
        f=linspace(0, Fs, Nfft);
        G=abs(fft(y_1, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
    end
    if temp==2
        t=linspace(0, length(y_2)/Fs,length(y_2));
        plot(t, y_2); 
        Nfft = length(y_2);
        f=linspace(0, Fs, Nfft);
        G=abs(fft(y_2, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
    end
    if temp==3
        t=linspace(0, length(y_3)/Fs,length(y_3));
        plot(t, y_3); 
        Nfft = length(y_3);
        f=linspace(0, Fs, Nfft);
        G=abs(fft(y_3, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
    end
    if temp==4
        t=linspace(0, length(y_4)/Fs,length(y_4));
        plot(t, y_4); 
        Nfft = length(y_4);
        f=linspace(0, Fs, Nfft);
        G=abs(fft(y_4, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
    end
    if temp==5
        t=linspace(0, length(y_5)/Fs,length(y_5));
        plot(t, y_5); 
        Nfft = length(y_5);
        f=linspace(0, Fs, Nfft);
        G=abs(fft(y_5, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
    end
    if temp==6
        t=linspace(0, length(y_6)/Fs,length(y_6));
        plot(t, y_6); 
        Nfft = length(y_6);
        f=linspace(0, Fs, Nfft);
        G=abs(fft(y_6, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
    end
    if temp==7
        t=linspace(0, length(y_7)/Fs,length(y_7));
        plot(t, y_7); 
        Nfft = length(y_7);
        f=linspace(0, Fs, Nfft);
        G=abs(fft(y_7, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
    end
    if temp==8
        t=linspace(0, length(y_8)/Fs,length(y_8));
        plot(t, y_8); 
        Nfft = length(y_8);
        f=linspace(0, Fs, Nfft);
        G=abs(fft(y_8, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
    end
    if temp==9
        t=linspace(0, length(y_9)/Fs,length(y_9));
        plot(t, y_9); 
        Nfft = length(y_9);
        f=linspace(0, Fs, Nfft);
        G=abs(fft(y_9, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
    end
end

prompt='Gain 1 ==> ';
g_1 = input(prompt);
prompt='Gain 2 ==> ';
g_2 = input(prompt);
prompt='Gain 3 ==> ';
g_3 = input(prompt);
prompt='Gain 4 ==> ';
g_4 = input(prompt);
prompt='Gain 5 ==> ';
g_5 = input(prompt);
prompt='Gain 6 ==> ';
g_6 = input(prompt);
prompt='Gain 7 ==> ';
g_7 = input(prompt);
prompt='Gain 8 ==> ';
g_8 = input(prompt);
prompt='Gain 9 ==> ';
g_9 = input(prompt);

y_1=y_1*(10^(g_1/20));
y_2=y_2*(10^(g_2/20));
y_3=y_3*(10^(g_3/20));
y_4=y_4*(10^(g_4/20));
y_5=y_5*(10^(g_5/20));
y_6=y_6*(10^(g_6/20));
y_7=y_7*(10^(g_7/20));
y_8=y_8*(10^(g_8/20));
y_9=y_9*(10^(g_9/20));

Y = y_1+y_2+y_3+y_4+y_5+y_6+y_7+y_8+y_9;

temp = 1;
while temp~=4
    prompt='What do you want:\n1-Play Composite\n2-Plot Composite(Time Domain)\n3-Plot Composite(Frequncy Domain)\n4- Quit\n';
    temp = input(prompt);

    if temp==1
        sound(Y, rate);
    end
    if temp == 2
        t=linspace(0, length(Y)/Fs,length(Y));
        plot(t, Y); 
    end
    if temp == 3
        Nfft = length(Y);
        f=linspace(0, Fs, Nfft);
        G=abs(fft(Y, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
    end
end