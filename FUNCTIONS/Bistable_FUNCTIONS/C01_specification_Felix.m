function C01_specification_Felix(func_dir,data_dir, runs, sub_no)

%% output directory
cd(func_dir);
mkdir('1st_level');
output_dir = fullfile(func_dir, '1st_level');
%% Create data 
file_dir = {}; %creating the directory of the files for every run
for r = 1:length(runs)
    if runs < 10
        file_dir{r} = strcat(data_dir,num2str(0),num2str(runs(r)));
    else
        file_dir{r} = strcat(data_dir,num2str(runs(r)));
    end
end

data = {};
for f = 1:length(runs)
    fs = spm_select('expand', fullfile(file_dir{f},strcat('swrsub-00',num2str(sub_no),'_task-BTP_run-0',num2str(runs(f)),'_bold.nii')));
    files = cellstr(fs);
    data{f} = files; % Building the cell array with all the filenames (7x360)

end 
%% Load onsets
condition_1 = 'left';
condition_2 = 'right';

onsets = {};
conditions = {};
onsets_condition_1 = {};
onsets_condition_2 = {};
for l = 1:length(runs)
    log_file = load(fullfile(file_dir{l}, strcat('log_run_0',num2str(runs(l)))));
    onsets{l} = log_file.log.onset;
    conditions{l} = log_file.log.conditions;

    onsets_condition_1{l} = onsets{l}(find(conditions{l} == 1));
    onsets_condition_2{l} = onsets{l}(find(conditions{l} == 2));

end 



%% Load batch structure 
matlabbatch{1}.spm.stats.fmri_spec.dir = {output_dir};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 1;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).scans = data{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).onset = onsets_condition_1{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).onset = onsets_condition_2{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).scans = data{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).onset = onsets_condition_1{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).onset = onsets_condition_2{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';

%% Executing the job 
spm_jobman('run', matlabbatch);