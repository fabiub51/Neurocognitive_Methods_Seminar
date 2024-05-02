%%% 
%Batch Script 
%%% 

dir = '/Users/fabiusberner/Documents/MATLAB/'; %Insert your directory where SPM12, jobs and data are located
% Order: realign, coregister, segment, normalise, smooth 

v = [1,1,1,1,1]; % vector consisting of 1s and 0s determining which analyses are to be done 



%% Realign 

switch v(1)
    case 1
        realign_spm(dir)

    otherwise 
end

%% Cogeristration 

switch v(2)
    case 1 
        coregister_spm(dir)
    otherwise
end

%% Segment 

switch v(3)
    case 1 
        segment_spm(dir)
    otherwise
end

%% Normalise 

switch v(4)
    case 1 
        normalise_spm(dir)
    otherwise
end

%% Smooth 
switch v(5) 
    case 1 
        smooth_spm(dir)
    otherwise
end