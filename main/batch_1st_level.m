%% First level analysis
data_dir = 'C:\Users\berne\Documents\Master FU\2. Semester\NMDA practical\EEG\auditory\sub-00';
subjects = 1; 
clear matlabbatch

%% Converting images

for i = 1:length(subjects)
    B01_convert(data_dir, subjects(i))
end

%% t-Test

for i = 1:length(subjects)
    B02_specify_2_level(data_dir,subjects(i))
end

%% Estimation 

for i = 1:length(subjects)
    B03_estimation(data_dir, subjects(i))
end
%% Contrast
for i = 1:length(subjects)
    B04_contrast(data_dir, subjects(i))
end
%% Results

for i = length(subjects)
    B05_results(data_dir, subjects(i))
end
