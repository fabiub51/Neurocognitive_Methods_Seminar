function coregister_spm(x)
% List of open inputs
nrun = 1; % enter the number of runs here
y = 'auditory/jobs/coregister_job.m';
jobfile = {append(x,y)};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});

end