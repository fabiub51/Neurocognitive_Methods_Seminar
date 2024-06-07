function B01_realignment(data_dir,no_runs)

file_dir = {};
for r = 1:no_runs
    if no_runs < 10
        file_dir{r} = strcat(data_dir,num2str(0),num2str(r));
    else
        file_dir{r} = strcat(data_dir,num2str(r));
    end
end

for f = 1:no_runs
    fs = spm_select('List', file_dir{f}, '^M','.nii');
    files = cellstr([repmat([file_dir{f} filesep], size(fs,1), 1) fs, repmat(',1',size(fs,1),1)]);
    data{f} = files;

end 
%Eoptions
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.data = data;
%%
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.sep = 4;
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.interp = 2;
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.weight = '';
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.roptions.which = [2 1];
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.roptions.interp = 4;
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.roptions.mask = 1;
realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.roptions.prefix = 'r';

spm_jobman('run', realign_estimate_reslice.matlabbatch);
