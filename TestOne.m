function [P] = TestOne(DT, Fs, net)

R={};
recorder = audiorecorder(Fs,16,1);
input('digite ENTER para empezar a grabar');
recordblocking(recorder, DT);
y = getaudiodata(recorder);
R = [R; mfcc(y, Fs, 'NumCoeffs', 11)'];


P = classify(net, R);

end

