%% P2.2. Deteksi sinyal
clear all;
close all;

global Fd Fs;
Fd = 1000; Fs = 100000; T = 1/Fd;
%% 2.2.1. 
b = round(rand(1, 10));
s = modul(b, 'bipolar_nrz');

figure('Name','P2 2.1. Bipolar NRZ Matched Filter','NumberTitle','off')
x = bbchannel(s, 1, 2e-4, 4900);
subplot(312), scope(x, 'one-shot', 10*T);
title('Sinyal dikirim')

y = afilter(x, matched('bipolar_nrz'));
subplot(313), scope(y, 'one-shot', 10*T);
title('Output matched filter')

subplot(311), scope(s, 'one-shot', 10*T);
title('Gelombang asli')

%% 2.2.2.
Fs = 10000;
b = round(rand(1,10000));
s = modul(b, 'bipolar_nrz');

x = bbchannel(s, 1, 0.0e-4, 4900); %kanal
y = afilter(x, matched('bipolar_nrz')); 

figure('Name','P2 2.2. Plot Matched Filter','NumberTitle','off')
scope(y(1:300*Fs/Fd), 'continuous', 2*T);
title('Plot Matched Filter Bipolar NRZ 300 bit pertama');

%% 2.2.3.
% y = transmit(b, 'bipolar_nrz', 0.5e-4, 4900);
% st = 0:1/Fs:1/Fd;
% pe = zeros(1,length(st));
% for i = 1:length(st)
%     pe(i) = detect(y, <treshold>, st(i), b);
%  end;
% plot(st, pe);
% xlabel('waktu sampling');
% ylabel('Bit error rate (BER)');
% title('BER vs waktu sampling');