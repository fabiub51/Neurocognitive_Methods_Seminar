function A08_artefacts(data_dir, sub_no)

clear matlabbatch

file_dir = fullfile(strcat(data_dir,num2str(sub_no)),'\preprocessing\');


matlabbatch{1}.spm.meeg.preproc.artefact.D(1) = {strcat(file_dir,'efdfMspmeeg_subject',num2str(sub_no),'.mat')};
matlabbatch{1}.spm.meeg.preproc.artefact.mode = 'reject';
matlabbatch{1}.spm.meeg.preproc.artefact.badchanthresh = 0.2;
matlabbatch{1}.spm.meeg.preproc.artefact.append = true;
matlabbatch{1}.spm.meeg.preproc.artefact.methods.channels{1}.all = 'all';
matlabbatch{1}.spm.meeg.preproc.artefact.methods.fun.threshchan.threshold = 80;
matlabbatch{1}.spm.meeg.preproc.artefact.methods.fun.threshchan.excwin = 1000;
matlabbatch{1}.spm.meeg.preproc.artefact.prefix = 'a';

spm('defaults', 'EEG');
spm_jobman('run', matlabbatch);