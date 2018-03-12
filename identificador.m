Fs=22050;
% Base de datos 
[k0] = audioread('Jairprom.wav'); %Archivo de promedio
[k1] = audioread('promDiana.wav'); %Archivo de promedio
[k2] = audioread('promJurgen.wav'); %Archivo de promedio
[kx] =audioread('Jair1b.wav')

num=(Fs/1024)+3;
W0= lpc(k0,num);
W1= lpc(k1,num); 
W2= lpc(k2,num); 
Wx= lpc(kx,num); 
d0=0;
for z=1:25
    d0(z)=sqrt((W0(z)-Wx(z))*(W0(z)-Wx(z)));
    if d0(z)<=0.15
        d0(z)=1;
    else d0 (z)=0;
    end
end
for z=1:25
    d1(z)=sqrt((W0(z)-Wx(z))*(W0(z)-Wx(z)));
    if d1(z)<=0.15
        d1(z)=1;
    else d1 (z)=0;
    end
end
for z=1:25
    d2(z)=sqrt((W0(z)-Wx(z))*(W0(z)-Wx(z)));
    if d2(z)<=0.15
        d2(z)=1;
    else d2 (z)=0;
    end
end
cont0=0;
for i= 1:25
    cont0=d0(i)+cont0;
end
cont0

cont1=0;
for i= 1:25
    cont1=d1(i)+cont1;
end
cont1

cont2=0 
for i= 1:25
    cont2=d0(i)+cont2;
end
cont2

if ( cont0>17)  %elsif(cont1>17), elsif(cont2>17) 
    op=length (k0); % length (k1), length (k2) 
    %Prediccion de la señal por filtro 
    predic = filter([0-W0(2:end)],1,k0); %filter([0-W1(2:end)],1,k1);----%filter([0-W2(2:end)],1,k2); 
    error = k0 - predic; %Error----- k1 - predic-----  k2 - predic; 
    %Vector de Autocorrelacion 
    Rsw= xcorr(k0); %xcorr(k1)-----xcorr(k2) 
R=Rsw(op:op+num); %Obtencion R(0) 
G= sqrt(sum(W0.*R')) %Obtencion G  ----sqrt(sum(W1.*R'))----sqrt(sum(W2.*R')) 
%Obtencion de la envolvente H(z) 
envolvente = abs(G./fft(W0,op));  %abs(G./fft(W1,op))-----abs(G./fft(W2,op)) 
%Transformada de Fourier de la señal original 
SW= abs(fft(k0,op));%abs(fft(k1,op));----abs(fft(k2,op)); 
axes(handles.axes1);
plot(k0);
axis off;

axes(handles.axes2);
background = imread('jair.png');
axis off;
imshow (background);

sound(k0,Fs);
elseif( cont1>9)
    op=length (k1); % length (k1), length (k2) 
    %Prediccion de la señal por filtro 
    predic = filter([0-W1(2:end)],1,k1); %filter([0-W1(2:end)],1,k1);----%filter([0-W2(2:end)],1,k2); 
    error = k1 - predic; %Error----- k1 - predic-----  k2 - predic; 
    %Vector de Autocorrelacion 
    Rsw= xcorr(k1); %xcorr(k1)-----xcorr(k2) 
R=Rsw(op:op+num); %Obtencion R(0) 
G= sqrt(sum(W1.*R')) %Obtencion G  ----sqrt(sum(W1.*R'))----sqrt(sum(W2.*R')) 
%Obtencion de la envolvente H(z) 
envolvente = abs(G./fft(W1,op));  %abs(G./fft(W1,op))-----abs(G./fft(W2,op)) 
%Transformada de Fourier de la señal original 
SW= abs(fft(k1,op));%abs(fft(k1,op));----abs(fft(k2,op)); 
elseif( cont2>17)
    op=length (k2); % length (k1), length (k2) 
    %Prediccion de la señal por filtro 
    predic = filter([0-W2(2:end)],1,k2); %filter([0-W1(2:end)],1,k1);----%filter([0-W2(2:end)],1,k2); 
    error = k2 - predic; %Error----- k1 - predic-----  k2 - predic; 
    %Vector de Autocorrelacion 
    Rsw= xcorr(k2); %xcorr(k1)-----xcorr(k2) 
R=Rsw(op:op+num); %Obtencion R(0) 
G= sqrt(sum(W2.*R')) %Obtencion G  ----sqrt(sum(W1.*R'))----sqrt(sum(W2.*R')) 
%Obtencion de la envolvente H(z) 
envolvente = abs(G./fft(W2,op));  %abs(G./fft(W1,op))-----abs(G./fft(W2,op)) 
%Transformada de Fourier de la señal original 
SW= abs(fft(k2,op));%abs(fft(k1,op));----abs(fft(k2,op)); 
end

