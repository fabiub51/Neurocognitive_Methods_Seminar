function normalise_pre(source_dir)

normalise = struct; 
files_n = spm_select('List',source_dir,'^ms','.nii');
fs_n = cellstr([repmat([source_dir filesep], size(files_n,1), 1) files_n, repmat(',1',size(files_n,1),1)]);
def_file = spm_select('List',source_dir,'^y','.nii');
def_n = cellstr([repmat([source_dir filesep], size(def_file,1), 1) def_file]);
        
normalise.matlabbatch{1}.spm.spatial.normalise.write.subj.def = def_n;
normalise.matlabbatch{1}.spm.spatial.normalise.write.subj.resample = fs_n;
normalise.matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                                  78 76 85];
normalise.matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [1 1 3];
normalise.matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
normalise.matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';

spm_jobman('run', normalise.matlabbatch);