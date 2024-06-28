function A07_epoch(data_dir, sub_no)

clear matlabbatch

file_dir = fullfile(strcat(data_dir,num2str(sub_no)),'\preprocessing\');


matlabbatch{1}.spm.meeg.preproc.epoch.D(1) = {strcat(file_dir,'fdfMspmeeg_subject',num2str(sub_no),'.mat')};
matlabbatch{1}.spm.meeg.preproc.epoch.trialchoice.trlfile = {strcat(file_dir,'trialdef.mat')};
matlabbatch{1}.spm.meeg.preproc.epoch.bc = 1;
matlabbatch{1}.spm.meeg.preproc.epoch.eventpadding = 0;
matlabbatch{1}.spm.meeg.preproc.epoch.prefix = 'e';

spm('defaults', 'EEG');
spm_jobman('run', matlabbatch);
