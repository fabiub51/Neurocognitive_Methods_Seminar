function A09_averaging(data_dir, sub_no)

clear matlabbatch

file_dir = fullfile(strcat(data_dir,num2str(sub_no)),'\preprocessing\');


matlabbatch{1}.spm.meeg.averaging.average.D(1) = {strcat(file_dir,'aefdfMspmeeg_subject',num2str(sub_no),'.mat')};
matlabbatch{1}.spm.meeg.averaging.average.userobust.robust.ks = 3;
matlabbatch{1}.spm.meeg.averaging.average.userobust.robust.bycondition = true;
matlabbatch{1}.spm.meeg.averaging.average.userobust.robust.savew = false;
matlabbatch{1}.spm.meeg.averaging.average.userobust.robust.removebad = false;
matlabbatch{1}.spm.meeg.averaging.average.plv = false;
matlabbatch{1}.spm.meeg.averaging.average.prefix = 'm';

spm('defaults', 'EEG');
spm_jobman('run', matlabbatch);
