function B04_contrast(data_dir, sub_no)

clear matlabbatch
file_dir = fullfile(strcat(data_dir,num2str(sub_no)),'\XYT_stats');

spm_file = spm_select('List',file_dir,'^SPM','.mat');
spm_file_str = cellstr(fullfile(file_dir, spm_file));

matlabbatch{1}.spm.stats.con.spmmat(1) = spm_file_str;
matlabbatch{1}.spm.stats.con.consess{1}.fcon.name = 'standard vs. rare';
matlabbatch{1}.spm.stats.con.consess{1}.fcon.weights = [1 -1];
matlabbatch{1}.spm.stats.con.consess{1}.fcon.sessrep = 'none';
matlabbatch{1}.spm.stats.con.delete = 0;


spm('defaults', 'EEG');
spm_jobman('run', matlabbatch);