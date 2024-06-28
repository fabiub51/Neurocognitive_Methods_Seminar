function B05_results(data_dir, sub_no)

clear matlabbatch
file_dir = fullfile(strcat(data_dir,num2str(sub_no)),'\XYT_stats');

spm_file = spm_select('List',file_dir,'^SPM','.mat');
spm_file_str = cellstr(fullfile(file_dir, spm_file));

matlabbatch{1}.spm.stats.results.spmmat(1) = spm_file_str;
matlabbatch{1}.spm.stats.results.conspec.titlestr = '';
matlabbatch{1}.spm.stats.results.conspec.contrasts = Inf;
matlabbatch{1}.spm.stats.results.conspec.threshdesc = 'FWE';
matlabbatch{1}.spm.stats.results.conspec.thresh = 0.05;
matlabbatch{1}.spm.stats.results.conspec.extent = 0;
matlabbatch{1}.spm.stats.results.conspec.conjunction = 1;
matlabbatch{1}.spm.stats.results.conspec.mask.none = 1;
matlabbatch{1}.spm.stats.results.units = 2;
matlabbatch{1}.spm.stats.results.export{1}.ps = true;

spm('defaults', 'EEG');
spm_jobman('run', matlabbatch);