function B03_estimation(data_dir, sub_no)

clear matlabbatch
file_dir = fullfile(strcat(data_dir,num2str(sub_no)),'\XYT_stats');

spm_file = spm_select('List',file_dir,'^SPM','.mat');
spm_file_str = cellstr(fullfile(file_dir, spm_file));

matlabbatch{1}.spm.stats.fmri_est.spmmat = spm_file_str;
matlabbatch{1}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{1}.spm.stats.fmri_est.method.Classical = 1;

spm('defaults', 'EEG');
spm_jobman('run', matlabbatch);

