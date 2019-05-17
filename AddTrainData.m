function [Ro, Yo] = AddTrainData(DT, Fs, fin, Rt, Yt)

recorder = audiorecorder(Fs,16,1);

R = {}; % en cada iteracion se agregaran los datos de entrenamiento

% gol
for x=1:1:fin(1)
    input([ '[' num2str(x) ']' 'digite ENTER para empezar a grabar']);
    recordblocking(recorder, DT);
    y = getaudiodata(recorder);
    R = [R; mfcc(y, Fs, 'NumCoeffs', 11)'];
end

% america
for x=1:1:fin(2)
    input([ '[' num2str(x) ']' 'digite ENTER para empezar a grabar']);
    recordblocking(recorder, DT);
    y = getaudiodata(recorder);
    R = [R; mfcc(y, Fs, 'NumCoeffs', 11)'];
end

% cali
for x=1:1:fin(3)
    input([ '[' num2str(x) ']' 'digite ENTER para empezar a grabar']);
    recordblocking(recorder, DT);
    y = getaudiodata(recorder);
    R = [R; mfcc(y, Fs, 'NumCoeffs', 11)'];
end

% no pertenece
for x=1:1:fin(4)
    input([ '[' num2str(x) ']' 'digite ENTER para empezar a grabar']);
    recordblocking(recorder, DT);
    y = getaudiodata(recorder);
    R = [R; mfcc(y, Fs, 'NumCoeffs', 11)'];
end


Ro = [Rt; R];

% los targets
Y = categorical([repmat(3, fin(1), 1); repmat(2, fin(2), 1); ones(fin(3), 1);  zeros(fin(4), 1)]);

Yo = [Yt; Y];

end

