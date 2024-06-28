function A02_montage(data_dir, sub_no)

clear matlabbatch

file_dir = fullfile(strcat(data_dir,num2str(sub_no)),'\preprocessing\');


matlabbatch{1}.spm.meeg.preproc.montage.D(1) = {strcat(file_dir,'spmeeg_subject',num2str(sub_no),'.mat')};
matlabbatch{1}.spm.meeg.preproc.montage.mode.write.montspec.montage.montagefile = {strcat(file_dir,'avref_eog.mat')};
matlabbatch{1}.spm.meeg.preproc.montage.mode.write.montspec.montage.keepothers = 0;
matlabbatch{1}.spm.meeg.preproc.montage.mode.write.blocksize = 655360;
matlabbatch{1}.spm.meeg.preproc.montage.mode.write.prefix = 'M';

spm('defaults', 'EEG');
spm_jobman('run', matlabbatch);
