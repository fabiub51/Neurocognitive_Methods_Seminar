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

%Switch-case statements determine which jobs have to be executed 

%% Establishing directories where the data are
data_dir = '/Users/fabiusberner/Documents/MATLAB/auditory/MoAEpilot/fM00223'; %This is the directory of the fMRI .img files 
source_dir = '/Users/fabiusberner/Documents/MATLAB/auditory/MoAEpilot/sM00223'; %This is the directory of the source image for coregistration
tpm_path = '/Users/fabiusberner/Documents/MATLAB/SPM12/tpm'; %This is the directory for NIFTI files for segmentation
class_dir = '/Users/fabiusberner/Documents/MATLAB/auditory/classical'; %The directory classical
%% Realignment 
clear matlabbatch 
switch v(1)
    case 1
        realignment_pre(data_dir);
    otherwise
end

%% Coregistration
switch v(2)
    case 1
        coregister_pre(data_dir, source_dir);
    otherwise
end

%% Segmentation
switch v(3)
    case 1

        segment_pre(tpm_path, source_dir);

    otherwise
end

%% Normalize 
switch v(4)
    case 1
        normalise_pre(data_dir,source_dir);
    otherwise
end

%% Smoothing
switch v(5)
    case 1
        smoothing_pre(data_dir);

    otherwise
end

%% Specification - first level analysis 

specification(data_dir, class_dir);

%% Estimation

estimation(class_dir);

%% To add later:
   %Loop over multiple participants
   %Sub-001, Sub-002 and so forth 
