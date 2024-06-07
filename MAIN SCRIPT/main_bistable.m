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
pre_data_dir = '/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00';
%% Realignment 
clear matlabbatch 

for i = 1:length(subs)
        data_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-');
        switch v(1)
            case 1
                B01_realignment(data_dir,length(runs));
            otherwise
        end
end
%% Coregistration

for i = 1:length(subs)
        ref_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/func/run-01');
        source_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/anat');
        switch v(2)
            case 1
                B02_coregister(ref_dir, source_dir);
            otherwise
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
        data_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/func/run_');
        source_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/anat');
        switch v(4)
            case 1
                B04_normalise(data_dir,source_dir,length(runs));
            otherwise
        end
end
%% Smoothing

for i = 1:length(subs)
        data_dir = strcat('/Users/fabiusberner/Documents/UNI/2. Semester/NMDA practical /Bistable_perception/Derivatives/sub-00',num2str(subs(i)),'/func/Preprocessing/run_');
        switch v(5)
            case 1
                B05_smoothing(data_dir,length(runs));
            otherwise
        end
end
%% Specification - first level analysis 

C01_specification(data_dir, class_dir);

%% Estimation

C02_estimation(class_dir);
