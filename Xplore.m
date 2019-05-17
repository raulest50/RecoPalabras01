


i = 2.319e5;
win = [i, i + 44100 ];

R={mfcc(a(win(1):win(2)), Fs, 'NumCoeffs', 11)';};


P = classify(net, R)


