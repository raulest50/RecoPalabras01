

fin = input('digite el vector de numero de grabaciones y luego ENTER (entrenamiento)');
DT = 1; % tiempo de grabacion
Fs = 44100;

[Rt, Yt] = AddTrainData(DT, Fs, fin, Rt, Yt);


% crecion de red para DL ( deep learning )
numFeatures = 12;
numHiddenUnits = 100;
numClasses = 4;

layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];


miniBatchSize = 27;

options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'MaxEpochs',500, ...
    'MiniBatchSize',miniBatchSize, ...
    'GradientThreshold',2, ...
    'Shuffle','every-epoch', ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(Rt, Yt, layers, options);


