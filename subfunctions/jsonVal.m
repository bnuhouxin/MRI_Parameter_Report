function val = jsonVal(fnm, key)
%read numeric values saved in JSON format
% e.g. use 
%    bidsVal1(fnm, '"RepetitionTime":') 
%for file with 
%   "RepetitionTime": 3,
val = [];
if ~exist(fnm, 'file'), return; end;
txt = fileread(fnm);
pos = strfind(txt,key);
if isempty(pos), return; end;
txt = txt(pos(1)+numel(key): end);
pos = strfind(txt,'[');
posComma = strfind(txt,',');
if isempty(posComma), return; end; %nothing to do
if isempty(pos) || (posComma(1) < pos(1)) %single value, not array
    txt = txt(1: posComma(1)-1);
    val = str2double(txt); %BIDS=sec, SPM=msec
    return; 
end;
txt = txt(pos(1)+1: end);
pos = strfind(txt,']');
if isempty(pos), return; end;
txt = txt(1: pos(1)-1);
val = str2num(txt); %#ok<ST2NM> %BIDS=sec, SPM=msec
%end jsonVal() 