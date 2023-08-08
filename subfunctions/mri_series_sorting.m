function mri_series_sorting(raw_dir)
% batch for resting data sorting

cd (raw_dir); 
subid = dir(raw_dir);
subid = subid(3:end);

for n = 1:size(subid,1)
    cd (fullfile(raw_dir, subid(n).name));

    
    dcm_dir = dir ('1.3*'); % Siemens
    if isempty(dcm_dir)
       dcm_dir = dir ('1.2*'); % GE
    end
    

    for m = 1:size(dcm_dir,1)
        path = fullfile(raw_dir, subid(n).name, dcm_dir(m).name);

        data_list = spm_get('Files',path,'*.dcm');
        hdrs = spm_dicom_headers(data_list(1,:));

        if strcmp(subid(n).name(1:3),'1.3') || strcmp(subid(n).name(1:3),'1.2')
            subname =  [hdrs{1}.PatientID,'_',hdrs{1}.PatientName];
            subname = strtrim(subname); 
        else
            subname = subid(n).name;
        end

        dir_name = hdrs{1}.SeriesDescription;          
        dir_name = erase(dir_name,'*'); % Delete extra "*", if exist
        dir_name = erase(dir_name,':'); % Delete extra ":", if exist
        dir_name = strtrim(dir_name); % Delete extra spaces, if exist


        while exist(fullfile(raw_dir, subid(n).name, dir_name),'dir')
            disp(['!!! There are more than one sequence folder with the file name "',dir_name,'" for subject "',subname,'"']);
            dir_name =  [dir_name,'_Repeat'];
        end

        new_name = fullfile(raw_dir, subid(n).name, dir_name);
               
        movefile(path,new_name);

        

    end

    % rename the sub folder if its name starts with '1.3****' or '1.2****'
    if strcmp(subid(n).name(1:3),'1.3') || strcmp(subid(n).name(1:3),'1.2')
            
            cd ..
            subname =  [hdrs{1}.PatientID,'_',hdrs{1}.PatientName];
            subname = strtrim(subname);    
                         
            while exist(fullfile(raw_dir,subname),'dir')
                disp(['!!! There are more than one subject folder with the file name "',subname,'"']);
                subname =  [subname,'_Repeat'];
            end

            raw_subnm = fullfile(raw_dir, subid(n).name);
            new_subnm = fullfile(raw_dir, subname);

            movefile(raw_subnm,new_subnm);

    end


    disp(['Sub',num2str(n),' ----- ',subid(n).name,' ----- Data Sorting Done ---------']);
end
