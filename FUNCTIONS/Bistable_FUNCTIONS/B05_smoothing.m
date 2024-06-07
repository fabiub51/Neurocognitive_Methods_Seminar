function B05_smoothing(data_dir,no_runs)
%% Functional images

file_dir = {};
for r = 1:no_runs
    if no_runs < 10
        file_dir{r} = strcat(data_dir,num2str(0),num2str(r));
    else
        file_dir{r} = strcat(data_dir,num2str(r));
    end
end

data_s = {};
for f = 1:no_runs
    fs = spm_select('List', file_dir{f}, '^wrM','.nii');
    files = cellstr([repmat([file_dir{f} filesep], size(fs,1), 1) fs, repmat(',1',size(fs,1),1)]);
    data_s = vertcat(data_s,files);
end

%% Fill matlabbatch

smooth.matlabbatch{1}.spm.spatial.smooth.data = data_s;
smooth.matlabbatch{1}.spm.spatial.smooth.fwhm = [8 8 8];
smooth.matlabbatch{1}.spm.spatial.smooth.dtype = 0;
smooth.matlabbatch{1}.spm.spatial.smooth.im = 0;
smooth.matlabbatch{1}.spm.spatial.smooth.prefix = 's';
spm_jobman('run', smooth.matlabbatch);

clear matlabbatch
