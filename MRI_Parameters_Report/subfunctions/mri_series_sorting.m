function mri_series_sorting(raw_dir)
% batch for resting data sorting

cd (raw_dir); 
subid=dir(raw_dir);
subid=subid(3:end);

for n=1:size(subid,1)
    cd (fullfile(raw_dir, subid(n).name));
    dcm_dir =dir ('1.3*');
    for m =1:size(dcm_dir,1)
        path = fullfile(raw_dir, subid(n).name, dcm_dir(m).name);

        data_list = spm_get('Files',path,'*.dcm');
        hdrs = spm_dicom_headers(data_list(1,:));
        dir_name = hdrs{1}.SeriesDescription;
        new_name = fullfile(raw_dir, subid(n).name, dir_name);
        movefile(path,new_name);
        data{n,1} = subid(n).name;
    end
    disp(['Sub',num2str(n),' ----- ',subid(n).name,' ----- Data Sorting Done ---------']);
end
