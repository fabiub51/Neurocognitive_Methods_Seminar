%% Preprocessing %% 

%add SPM12
addpath(genpath([pwd,'/SPM12'])) %This ensures your SPM12 is loaded and running

%Vector indicating which steps should be performed
% v(1) = Realignment
% v(2) = Coregistration
% v(3) = Segmentation 
% v(4) = Normalization 
% v(5) = Smoothing 
v = [1,1,1,1,1]; 

%all participants
subs = ; 
runs = [1,2,3,4,5,6,7]; % These are the 6 functional runs + the localizer

%% Establishing directories where the data are
tpm_path = '/Users/fabiusberner/Documents/MATLAB/SPM12/tpm';
pre_data_dir = '/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00';

% This is the folder structure how I understood BIDS: 
% Bistable perception (Project) 
    % Raw Data - how the data come out of the scanner (dcm files)
        % sub-00x - folder for every participant
    % Derivatives - any manipulation that was done to the data
        % sub-00x - folder for every participant
            % anat - any type of anatomical image
            % func - functional data
                % run-0x - all of the runs (from one to 7) 
%% Realignment 
clear matlabbatch 

for i = 1:length(subs)
        data_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-');
        switch v(1)
            case 1
                B01_realignment(data_dir,length(runs),subs(i));
            otherwise
        end
end
%% Coregistration

for i = 1:length(subs)
        ref_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-01');
        source_dir = strcat(pre_data_dir,num2str(subs(i)),'/anat');
        switch v(2)
            case 1
                B02_coregister(ref_dir, source_dir);
            otherwise
        end
end
%% Segmentation

for i = 1:length(subs)
        source_dir = strcat(pre_data_dir,num2str(subs(i)),'/anat');
        switch v(3)
            case 1
                B03_segment(tpm_path, source_dir);
            otherwise
        end
end

%% Normalize 

for i = 1:length(subs)
        data_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-');
        source_dir = strcat(pre_data_dir,num2str(subs(i)),'/anat');
        switch v(4)
            case 1
                B04_normalise(data_dir,source_dir,length(runs),subs(i));
            otherwise
        end
end
%% Smoothing

for i = 1:length(subs)
    data_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-');    
    switch v(5)
        case 1
            B05_smoothing(data_dir,length(runs),subs(i));
        otherwise
    end
end

%% Specification - first level analysis - localizer

for i = length(subs)
    if subs(i) == 1
        runs = [7 8];
        data_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-'); 
        func_dir = strcat(pre_data_dir,num2str(subs(i),'/func/'));
        C01_specification_Felix(func_dir, data_dir, runs, subs(i));
    else 
        runs = 7;
        data_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-'); 
        func_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/');
        C01_specification(func_dir, data_dir, runs, subs(i));
    end
end 

%% Estimation
for i = length(subs)
    output_dir = strcat(func_dir,'1st_level');
    C02_estimation(output_dir);
end 
