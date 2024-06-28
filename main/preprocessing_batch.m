%% Preprocessing Batch
data_dir = 'C:\Users\berne\Documents\Master FU\2. Semester\NMDA practical\EEG\auditory\sub-00';
subjects = 1; 
clear matlabbatch

% make sure to convert the subject1.bdf using the GUI first
% create the channelselection.mat file 
% create the avref.mat and avref_eog.mat files
% create the trialdef.mat file 

%% simple conversion

for i = 1:length(subjects)
    A01_simple_conversion(data_dir, subjects(i))
end

%% Montage
 
for i = 1:length(subjects)
    A02_montage(data_dir, subjects(i))
end

%% Prepare

for i = 1:length(subjects)
    A03_prepare(data_dir, subjects(i))
end 

%% High pass filter

for i = 1:length(subjects)
    A04_high_pass(data_dir, subjects(i))
end 

%% Downsampling

for i = 1:length(subjects)
    A05_downsample(data_dir, subjects(i))
end 

%% Low pass filter

for i = 1:length(subjects)
    A06_low_pass(data_dir, subjects(i))
end 

%% Epoching

for i = 1:length(subjects)
    A07_epoch(data_dir, subjects(i))
end 

%% Artefacts

for i = 1:length(subjects)
    A08_artefacts(data_dir, subjects(i))
end

%% Averaging

for i = 1:length(subjects)
    A09_averaging(data_dir, subjects(i))
end

