function B02_specify_2_level(data_dir, sub_no)


file_dir = fullfile(strcat(data_dir, num2str(sub_no)),'\preprocessing\aefdfMspmeeg_subject1');

full_data_st = {};
full_data_ra = {};
data_st = spm_select('expand',fullfile(file_dir,'condition_standard.nii'));
data_ra = spm_select('expand',fullfile(file_dir,'condition_rare.nii'));
full_data_st = cellstr(data_st);
full_data_ra = cellstr(data_ra);


output_dir = fullfile(strcat(data_dir,num2str(sub_no)),'\XYT_stats');

specify.matlabbatch{1}.spm.stats.factorial_design.dir = {output_dir};
specify.matlabbatch{1}.spm.stats.factorial_design.des.t2.scans1 = full_data_st;
specify.matlabbatch{1}.spm.stats.factorial_design.des.t2.scans2 = full_data_ra;
specify.matlabbatch{1}.spm.stats.factorial_design.des.t2.dept = 0;
specify.matlabbatch{1}.spm.stats.factorial_design.des.t2.variance = 1;
specify.matlabbatch{1}.spm.stats.factorial_design.des.t2.gmsca = 0;
specify.matlabbatch{1}.spm.stats.factorial_design.des.t2.ancova = 0;
specify.matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
specify.matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
specify.matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
specify.matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
specify.matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
specify.matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
specify.matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
specify.matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;

spm('defaults', 'EEG');
spm_jobman('run', specify.matlabbatch);

clear matlabbatch