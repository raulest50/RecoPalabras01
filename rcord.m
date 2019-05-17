function [y] = rcord(DT, Fs)


recorder = audiorecorder(Fs,16,1);
recordblocking(recorder, DT);
y = getaudiodata(recorder);


end

