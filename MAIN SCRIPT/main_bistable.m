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
subs = 4;
runs = [1,2,3,4,5,6,7];

%% Establishing directories where the data are
tpm_path = '/Users/fabiusberner/Documents/MATLAB/SPM12/tpm';
%% Realignment 
clear matlabbatch 

for i = 1:length(subs)
    for r = 1:length(runs)
        data_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/func/run_0',num2str(r));
        switch v(1)
            case 1
                B01_realignment(data_dir);
            otherwise
        end
    end
end
%% Coregistration

for i = 1:length(subs)
    for r = 1:length(runs)
        data_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/func/run_0',num2str(r));
        source_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/anat');
        switch v(2)
            case 1
                B02_coregister(data_dir, source_dir);
            otherwise
        end
    end
end
%% Segmentation
for i = 1:length(subs)
        source_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/anat');
        switch v(3)
            case 1
                B03_segment(tpm_path, source_dir);
            otherwise
        end
end

%% Normalize 

for i = 1:length(subs)
    for r = 1:length(runs)
        data_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/func/run_0',num2str(r));
        source_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/anat');
        switch v(4)
            case 1
                B04_normalise(data_dir,source_dir);
            otherwise
        end
    end
end
%% Smoothing

for i = 1:length(subs)
    for r = 1:length(runs)
        data_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/func/run_0',num2str(r));
        switch v(5)
            case 1
                B05_smoothing(data_dir);
            otherwise
        end
    end
end
%% Specification - first level analysis 

C01_specification(data_dir, class_dir);

%% Estimation

C02_estimation(class_dir);
