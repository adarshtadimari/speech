% 2D Gaussian Mixture Model Expectation Maximisation
% No of components as argument
function em_gmm( num_components )
    %Load data
    fid = fopen('geyser.csv');
    out = textscan(fid,'%s%f%f','delimiter',',');
    waiting = out{2};
    eruptions = out{3};

    %Visualising the dataset
    figure(1)
    plot(waiting,eruptions, 'r.');
    title('Old Faithful Dataset');
    xlabel('Waiting Time');
    ylabel('Eruptions');

    %Expectation maximization
    X=[waiting eruptions];
    options = statset('Display','final');
    gm = gmdistribution.fit(X,num_components,'Options',options);
    
       
    %Plotting the gaussian mixtures
    hold on
    ezcontour(@(x,y)pdf(gm,[x y]),[min(waiting) max(waiting)],[min(eruptions) max(eruptions)]);

    pause
    hold off










end
