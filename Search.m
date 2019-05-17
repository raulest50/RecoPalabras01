
function [Txt, pts] = Search(DT, Fs, net, y)

% se hace una grabacion solo para saber cuantas muestras corresponden
% para una grabacion de DT  segundos.
recorder = audiorecorder(Fs,16,1);
recordblocking(recorder, DT);
x = getaudiodata(recorder);

% se obtinene cual debe ser la dimension de la ventana
len = length(x);
win = [1 len]; 

Dwin = 1000; % pasos de avancce de la ventana

loop = 1;

dcd = [];

R={};

pts = [];

while loop==1
    
    R = {mfcc( y(win(1):win(2)), Fs, 'NumCoeffs', 11 )'};
    r = classify(net, R);
    
    if r==categorical(3)
        win = win + len;
        dcd = [dcd 'gol'];
    end
    
    if r==categorical(2)
        win = win + len;
        dcd = [dcd 'america'];
    end
    
    if r==categorical(1)
        win = win + len;
        dcd = [dcd 'cali'];
    end
    
    if r==categorical(0)
        win = win + Dwin;
    end
    
    if win(2)>length(y)
        loop=0;
    end
    
    pts = [pts win(1)];
end


Txt = dcd;







