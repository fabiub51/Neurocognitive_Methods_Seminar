function B01_convert(data_dir,sub_no)

file_dir = fullfile(strcat(data_dir, num2str(sub_no)),'\preprocessing\');
data = spm_select('List',file_dir,'^aefdf','.mat');
data_full = fullfile(file_dir, data);
matlabbatch{1}.spm.meeg.images.convert2images.D = {data_full};
matlabbatch{1}.spm.meeg.images.convert2images.mode = 'scalp x time';
matlabbatch{1}.spm.meeg.images.convert2images.channels{1}.type = 'EEG';
matlabbatch{1}.spm.meeg.images.convert2images.timewin = [-Inf Inf];
matlabbatch{1}.spm.meeg.images.convert2images.freqwin = [-Inf Inf];
matlabbatch{1}.spm.meeg.images.convert2images.prefix = '';

spm_jobman('run', matlabbatch);

clear matlabbatch