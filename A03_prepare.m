function A03_prepare(data_dir, sub_no)

clear matlabbatch

file_dir = fullfile(strcat(data_dir,num2str(sub_no)),'\preprocessing\');


matlabbatch{1}.spm.meeg.preproc.prepare.D(1) = {strcat(file_dir,'Mspmeeg_subject',num2str(sub_no),'.mat')};
matlabbatch{1}.spm.meeg.preproc.prepare.task{1}.loadeegsens.eegsens = {strcat(file_dir,'sensors.pol')};
matlabbatch{1}.spm.meeg.preproc.prepare.task{1}.loadeegsens.megmatch.nomatch = 1;

spm('defaults', 'EEG');
spm_jobman('run', matlabbatch);