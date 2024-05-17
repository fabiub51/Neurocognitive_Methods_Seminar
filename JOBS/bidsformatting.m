% Define the BIDS directory and subject ID
bidsDir = '/Users/emily/Desktop/FU_courses/NMDA/MoAEpilotbids';
subjectId = '01';

% Define the path to the functional data using BIDS naming conventions
funcFile = fullfile(bidsDir, ['sub-' subjectId], 'func', ['sub-' subjectId '_task-rest_bold.nii.gz']);

% Load the functional MRI data
%img = niftiread(funcFile);
%data = img;