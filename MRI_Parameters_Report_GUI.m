function varargout = MRI_Parameters_Report_GUI(varargin)
% MRI_PARAMETERS_REPORT_GUI MATLAB code for MRI_Parameters_Report_GUI.fig
%      MRI_PARAMETERS_REPORT_GUI, by itself, creates a new MRI_PARAMETERS_REPORT_GUI or raises the existing
%      singleton*.
%
%      H = MRI_PARAMETERS_REPORT_GUI returns the handle to a new MRI_PARAMETERS_REPORT_GUI or the handle to
%      the existing singleton*.
%
%      MRI_PARAMETERS_REPORT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MRI_PARAMETERS_REPORT_GUI.M with the given input arguments.
%
%      MRI_PARAMETERS_REPORT_GUI('Property','Value',...) creates a new MRI_PARAMETERS_REPORT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MRI_Parameters_Report_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MRI_Parameters_Report_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MRI_Parameters_Report_GUI

% Last Modified by GUIDE v2.5 27-Oct-2019 12:49:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MRI_Parameters_Report_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MRI_Parameters_Report_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MRI_Parameters_Rewport_GUI is made visible.
function MRI_Parameters_Report_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MRI_Parameters_Report_GUI (see VARARGIN)

% Choose default command line output for MRI_Parameters_Report_GUI

disp('----------------------------------------------------------------------------------------------------------');
disp('   Programer: Hou Xin.');
disp('   Mail to Initiator: houxin195776@mail.bnu.edu.cn');
disp('   State Key Laboratory of Cognitive Neuroscience and Learning, Beijing Normal University, Beijing, China');
disp('----------------------------------------------------------------------------------------------------------');

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MRI_Parameters_Report_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MRI_Parameters_Report_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function DcmPath_Callback(hObject, eventdata, handles)
% hObject    handle to DcmPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DcmPath as text
%        str2double(get(hObject,'String')) returns contents of DcmPath as a double


% --- Executes during object creation, after setting all properties.
function DcmPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DcmPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AddPath.
function AddPath_Callback(hObject, eventdata, handles)
% hObject    handle to AddPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dcm_path=uigetdir(pwd);
if ischar(dcm_path)
    set(handles.DcmPath,'string',dcm_path);
    
    if ~isempty(get(handles.MRISystem,'string'))
        set(handles.MRISystem,'string',[]);
        set(handles.SequenceName,'string',[]);
        
        set(handles.TE,'string',[]);
        set(handles.TR,'string',[]);
        set(handles.FA,'string',[]);
        set(handles.text1_TI,'visible','on');
        set(handles.text2_TI,'visible','on');
        set(handles.TI,'visible','on');
        set(handles.TI,'string',[]);
        
        set(handles.FOV1,'string',[]);
        set(handles.FOV2,'string',[]);
        set(handles.Matrix1,'string',[]);
        set(handles.Matrix2,'string',[]);
        
        set(handles.Volume_Number,'string',[]);
        set(handles.Slice_Number,'string',[]);
        
        set(handles.Thickness,'string',[]);
        set(handles.text1_SliceGap,'visible','on');
        set(handles.text2_SliceGap,'visible','on');
        set(handles.SliceGap,'visible','on');
        set(handles.SliceGap,'string',[]);
        
        
        set(handles.VoxelSize1,'string',[]);
        set(handles.VoxelSize2,'string',[]);
        set(handles.VoxelSize2,'string',[]);
        
        set(handles.text_SliceOrder,'visible','on');
        set(handles.SliceOrder,'visible','on');
        set(handles.SliceOrder,'string',[]);
    end    
end

% --- Executes on button press in Report.
function Report_Callback(hObject, eventdata, handles)
% hObject    handle to Report (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[pm_name,pm_path]=uiputfile('parameter.mat','Save the parameter infor');

if ischar(get(handles.DcmPath,'string'))
    h=waitbar(0,'Please wait ... ...');
    
    pm.dcm_path=get(handles.DcmPath,'string');
    
    pm.dcm_files=spm_get('Files',pm.dcm_path,'*.dcm');
    if isempty(pm.dcm_files)
        pm.dcm_files=spm_get('Files',pm.dcm_path,'*.IMA');
    end
    if isempty(pm.dcm_files)
        pm.dcm_files=spm_get('Files',pm.dcm_path,'*.ima');
    end
    if isempty(pm.dcm_files)
        pm.dcm_files=spm_get('Files',pm.dcm_path,'*.img');
    end
    
    waitbar(1/10,h);
    
    pm.hdr=spm_dicom_headers(pm.dcm_files(1,:));
    if isfield(pm.hdr{1},'ManufacturerModelName')
        pm.MRI_System=[pm.hdr{1}.Manufacturer,pm.hdr{1}.ManufacturerModelName,pm.hdr{1}.SoftwareVersions];
    else
        pm.MRI_System=[pm.hdr{1}.Manufacturer];
    end
    
    if isfield(pm.hdr{1},'SequenceName')
        pm.series_name=pm.hdr{1}.SequenceName;
    else
        pm.series_name=pm.hdr{1}.SeriesDescription;
    end

    pm.TR=pm.hdr{1}.RepetitionTime;
    pm.TE=pm.hdr{1}.EchoTime;
    pm.FA=pm.hdr{1}.FlipAngle;

    pm.slice_thickness=pm.hdr{1}.SliceThickness;
    
    waitbar(2/10,h);
    
    pm.PixelSpacing=pm.hdr{1}.PixelSpacing';
    if isfield(pm.hdr{1},'SpacingBetweenSlices')
       pm.SpacingBetweenSlices=pm.hdr{1}.SpacingBetweenSlices;
    end
   
    
    % dcm2nii using dcm2niix ----------------------------------------------
    [ProgramPath, ~, ~] = fileparts(which('dcm2niix.exe'));
    
    if isempty(ProgramPath)
        warndlg({'There is no dcm2nii.exe. in your Matlab search path'; []; 'Please add the Dpabi or other toolbox containing dcm2nii.exe to Matlab search path!!!'},'Warning');
    end
    
    cd(ProgramPath);
    InputDir = pm.dcm_path;
    OutputDir = fullfile(pm_path,'tmp1');
    mkdir(OutputDir);

    Option='-b y -x y -z n'; 
    
    if ispc
        eval(['!dcm2niix.exe ',Option,' -o ',OutputDir,' ',InputDir]); 
    elseif ismac
        eval(['!./dcm2niix_mac ',Option,' -o ',OutputDir,' ',InputDir]);
    else
        eval(['!chmod +x dcm2niix_linux']);
        eval(['!./dcm2niix_linux ',Option,' -o ',OutputDir,' ',InputDir]);  
    end
    
    cd(OutputDir);
    nii_pn = dir(fullfile(OutputDir,'*.nii'));
    jsn_pn = dir(fullfile(OutputDir,'*.json'));
    % dcm2nii using dcm2niix ----------------------------------------------
    
    
    waitbar(4/10,h);
    v = spm_vol(nii_pn(1).name);   
    pm.dim = v(1,1).dim;
    pm.private_size = size(v(1,1).private.dat);
    if length(pm.private_size) > 3
        
        if strcmp(get(handles.SliceGap,'visible'),'off')
            set(handles.text1_SliceGap,'visible','on');
            set(handles.text2_SliceGap,'visible','on');
            set(handles.SliceGap,'visible','on','string','');
        end
        
        if strcmp(get(handles.SliceOrder,'visible'),'off')
           set(handles.text_SliceOrder,'Visible','on');
           set(handles.SliceOrder,'Visible','on','string','');
        end
        
        jsn_fnm = jsn_pn(1).name;
        pm.slice_times = jsonVal(jsn_fnm, '"SliceTiming":');
        [~,pm.slice_order] = sort(pm.slice_times');
        set(handles.SliceOrder,'string',num2str(pm.slice_order));
        
        if all(diff(pm.slice_order)>0) || all(diff(pm.slice_order)<0)
            pm.inter_gap=pm.SpacingBetweenSlices;
            set(handles.SliceGap,'string',num2str(pm.inter_gap));
        else
            pm.inter_gap=pm.SpacingBetweenSlices-pm.slice_thickness;
            set(handles.SliceGap,'string',num2str(pm.inter_gap));
        end
        pm.slice_num=pm.dim(3);
        pm.Matrix_nii=[pm.dim([1:2])];
    else
        set(handles.text1_SliceGap,'visible','off');
        set(handles.text2_SliceGap,'visible','off');
        set(handles.SliceGap,'visible','off');
        pm.inter_gap=0; 
        
        set(handles.text_SliceOrder,'visible','off');
        set(handles.SliceOrder,'visible','off');
        pm.slice_num=size(pm.dcm_files,1);
        pm.Matrix_nii=[pm.dim([2:3])];
    end
    cd(pm_path);
    rmdir(OutputDir,'s');

    if size(v,1) > 1
        pm.volume_number = size(v,1);
    else
        pm.volume_number = 1;   
    end
        
    
    pm.FOV=[pm.PixelSpacing.*pm.Matrix_nii];
    pm.Voxel_Size=[pm.PixelSpacing,pm.slice_thickness];

    waitbar(6/10,h);
    
    set(handles.MRISystem,'string',pm.MRI_System);
    set(handles.SequenceName,'string',pm.series_name);
    
    set(handles.TR,'string',num2str(pm.TR));
    set(handles.TE,'string',num2str(pm.TE));
    set(handles.FA,'string',num2str(pm.FA));
    
    if isfield(pm.hdr{1},'InversionTime')
        pm.TI=pm.hdr{1}.InversionTime;
        set(handles.TI,'string',num2str(pm.TI));
    else
        set(handles.text1_TI,'visible','off');
        set(handles.text2_TI,'visible','off');
        set(handles.TI,'visible','off');
    end
    
    waitbar(8/10,h);
    
    set(handles.FOV1,'string',num2str(pm.FOV(1)));
    set(handles.FOV2,'string',num2str(pm.FOV(2)));
    set(handles.Matrix1,'string',num2str(pm.Matrix_nii(1)));
    set(handles.Matrix2,'string',num2str(pm.Matrix_nii(2)));
    
    set(handles.Volume_Number,'string',num2str(pm.volume_number));    
    set(handles.Slice_Number,'string',num2str(pm.slice_num));
    
    set(handles.Thickness,'string',num2str(pm.slice_thickness));
   
    set(handles.VoxelSize1,'string',num2str(pm.PixelSpacing(1)));
    set(handles.VoxelSize2,'string',num2str(pm.PixelSpacing(2)));
    set(handles.VoxelSize3,'string',num2str(pm.slice_thickness));
    
    waitbar(10/10,h);
    delete(h);
    % pm=rmfield(pm,{'dcm_path','dcm_files','hdrs','nii_v'});
    save(fullfile(pm_path,pm_name),'pm');
    
    msgbox('Operation Completed!','Success','help');
else
    msgbox('Please select a T1/Fun Dicom folder!','Warning','warn');
end



function MRISystem_Callback(hObject, eventdata, handles)
% hObject    handle to MRISystem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MRISystem as text
%        str2double(get(hObject,'String')) returns contents of MRISystem as a double


% --- Executes during object creation, after setting all properties.
function MRISystem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MRISystem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SequenceName_Callback(hObject, eventdata, handles)
% hObject    handle to SequenceName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SequenceName as text
%        str2double(get(hObject,'String')) returns contents of SequenceName as a double


% --- Executes during object creation, after setting all properties.
function SequenceName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SequenceName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TR_Callback(hObject, eventdata, handles)
% hObject    handle to TR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TR as text
%        str2double(get(hObject,'String')) returns contents of TR as a double


% --- Executes during object creation, after setting all properties.
function TR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TE_Callback(hObject, eventdata, handles)
% hObject    handle to TE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TE as text
%        str2double(get(hObject,'String')) returns contents of TE as a double


% --- Executes during object creation, after setting all properties.
function TE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TI_Callback(hObject, eventdata, handles)
% hObject    handle to TI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TI as text
%        str2double(get(hObject,'String')) returns contents of TI as a double


% --- Executes during object creation, after setting all properties.
function TI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FA_Callback(hObject, eventdata, handles)
% hObject    handle to FA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FA as text
%        str2double(get(hObject,'String')) returns contents of FA as a double


% --- Executes during object creation, after setting all properties.
function FA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FOV1_Callback(hObject, eventdata, handles)
% hObject    handle to FOV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FOV1 as text
%        str2double(get(hObject,'String')) returns contents of FOV1 as a double


% --- Executes during object creation, after setting all properties.
function FOV1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FOV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FOV2_Callback(hObject, eventdata, handles)
% hObject    handle to FOV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FOV2 as text
%        str2double(get(hObject,'String')) returns contents of FOV2 as a double


% --- Executes during object creation, after setting all properties.
function FOV2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FOV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Matrix1_Callback(hObject, eventdata, handles)
% hObject    handle to Matrix1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Matrix1 as text
%        str2double(get(hObject,'String')) returns contents of Matrix1 as a double


% --- Executes during object creation, after setting all properties.
function Matrix1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Matrix1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Matrix2_Callback(hObject, eventdata, handles)
% hObject    handle to Matrix2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Matrix2 as text
%        str2double(get(hObject,'String')) returns contents of Matrix2 as a double


% --- Executes during object creation, after setting all properties.
function Matrix2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Matrix2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Volume_Number_Callback(hObject, eventdata, handles)
% hObject    handle to Volume_Number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Volume_Number as text
%        str2double(get(hObject,'String')) returns contents of Volume_Number as a double


% --- Executes during object creation, after setting all properties.
function Volume_Number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Volume_Number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Slice_Number_Callback(hObject, eventdata, handles)
% hObject    handle to Slice_Number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Slice_Number as text
%        str2double(get(hObject,'String')) returns contents of Slice_Number as a double


% --- Executes during object creation, after setting all properties.
function Slice_Number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slice_Number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Thickness_Callback(hObject, eventdata, handles)
% hObject    handle to Thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Thickness as text
%        str2double(get(hObject,'String')) returns contents of Thickness as a double


% --- Executes during object creation, after setting all properties.
function Thickness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SliceGap_Callback(hObject, eventdata, handles)
% hObject    handle to SliceGap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SliceGap as text
%        str2double(get(hObject,'String')) returns contents of SliceGap as a double


% --- Executes during object creation, after setting all properties.
function SliceGap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliceGap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function VoxelSize2_Callback(hObject, eventdata, handles)
% hObject    handle to VoxelSize2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of VoxelSize2 as text
%        str2double(get(hObject,'String')) returns contents of VoxelSize2 as a double


% --- Executes during object creation, after setting all properties.
function VoxelSize2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VoxelSize2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function VoxelSize1_Callback(hObject, eventdata, handles)
% hObject    handle to VoxelSize1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of VoxelSize1 as text
%        str2double(get(hObject,'String')) returns contents of VoxelSize1 as a double


% --- Executes during object creation, after setting all properties.
function VoxelSize1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VoxelSize1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function VoxelSize3_Callback(hObject, eventdata, handles)
% hObject    handle to VoxelSize3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of VoxelSize3 as text
%        str2double(get(hObject,'String')) returns contents of VoxelSize3 as a double


% --- Executes during object creation, after setting all properties.
function VoxelSize3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VoxelSize3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SliceOrder_Callback(hObject, eventdata, handles)
% hObject    handle to SliceOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SliceOrder as text
%        str2double(get(hObject,'String')) returns contents of SliceOrder as a double


% --- Executes during object creation, after setting all properties.
function SliceOrder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliceOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function SortPath_Callback(hObject, eventdata, handles)
% hObject    handle to SortPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SortPath as text
%        str2double(get(hObject,'String')) returns contents of SortPath as a double


% --- Executes during object creation, after setting all properties.
function SortPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SortPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AddSort.
function AddSort_Callback(hObject, eventdata, handles)
% hObject    handle to AddSort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sort_path = uigetdir(pwd);
if ischar(sort_path)
    set(handles.SortPath,'string',sort_path);
end


% --- Executes on button press in run_rm.
function run_rm_Callback(hObject, eventdata, handles)
% hObject    handle to run_rm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sort_path = get(handles.SortPath,'string');
if ischar(sort_path)
   mri_series_sorting(sort_path);
   msgbox('MRI Data Sorting Done!', 'Success','warn');
end
