function A04_high_pass(data_dir, sub_no)

clear matlabbatch

file_dir = fullfile(strcat(data_dir,num2str(sub_no)),'\preprocessing\');


matlabbatch{1}.spm.meeg.preproc.filter.D(1) = {strcat(file_dir,'Mspmeeg_subject',num2str(sub_no),'.mat')};
matlabbatch{1}.spm.meeg.preproc.filter.type = 'butterworth';
matlabbatch{1}.spm.meeg.preproc.filter.band = 'high';
matlabbatch{1}.spm.meeg.preproc.filter.freq = 0.1;
matlabbatch{1}.spm.meeg.preproc.filter.dir = 'twopass';
matlabbatch{1}.spm.meeg.preproc.filter.order = 5;
matlabbatch{1}.spm.meeg.preproc.filter.prefix = 'f';

spm('defaults', 'EEG');
spm_jobman('run', matlabbatch);