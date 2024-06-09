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

data_n = {};
for f = 1:no_runs
    fs = spm_select('expand', fullfile(file_dir{f},strcat('wrsub-001_task-BTP_run-0',num2str(f),'_bold.nii')));
    files = cellstr(fs);
    data_n = vertcat(data_n,files); % Here, compared to realignment, we need a cell array with the dimensions of all images x 1 (e.g. for ...
    % participant 4: 2520x1
end

%% Fill matlabbatch

smooth.matlabbatch{1}.spm.spatial.smooth.data = data_s;
smooth.matlabbatch{1}.spm.spatial.smooth.fwhm = [8 8 8];
smooth.matlabbatch{1}.spm.spatial.smooth.dtype = 0;
smooth.matlabbatch{1}.spm.spatial.smooth.im = 0;
smooth.matlabbatch{1}.spm.spatial.smooth.prefix = 's';
spm_jobman('run', smooth.matlabbatch);

clear matlabbatch
