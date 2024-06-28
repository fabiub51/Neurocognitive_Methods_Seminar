function A05_downsample(data_dir, sub_no)

clear matlabbatch

file_dir = fullfile(strcat(data_dir,num2str(sub_no)),'\preprocessing\');


matlabbatch{1}.spm.meeg.preproc.downsample.D(1) = {strcat(file_dir,'fMspmeeg_subject',num2str(sub_no),'.mat')};
matlabbatch{1}.spm.meeg.preproc.downsample.fsample_new = 200;
matlabbatch{1}.spm.meeg.preproc.downsample.method = 'resample';
matlabbatch{1}.spm.meeg.preproc.downsample.prefix = 'd';

spm('defaults', 'EEG');
spm_jobman('run', matlabbatch);
