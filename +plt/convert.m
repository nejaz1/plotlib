function convert(in,out,varargin)
%% Description
%   Batch converts file(s) to the desired format and resolution 
% Input
%   in   : name(s) of input files to be converted 
%               for more than one file, provide a string array
%   out  : name(s) to give output files
%               needs as many names as input files
%   varargin: Format options. 
%       In general: 'formating_option', value,... 
%       'convertformat'        : jpeg/bmp/tiff
%       'convertquality'       : 0-100
%       'dpi'                  : dpi for saved image (300 default)
% Example: 
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Get user options
sty             = style.get;
sty.save        = plt.helper.getUserOptions(varargin,sty.save);

%% 1. Check number of files to convert
if ~iscell(in)
    in = {in};
    out = {out};
end;

%% 2. Loop over all files
for i=1:length(in)
    inFile  = in{i};
    outFile = out{i};
    
    str     = convertHelper(inFile,outFile,sty.save);
    fprintf('%s\n',str);
end;


function [str] = convertHelper(in,out,opt)

% run a temp conversion to see what the size of the pdf image is (always
% jpg)
tmpFile = 'temp.jpg';
commandStr      = sprintf('sips -s formatOptions %s -s format jpeg %s --out %s',...
                            opt.convertquality,in,tmpFile);
system(commandStr);

% get pdf image size
l               = imfinfo(tmpFile);
h               = l.Height;
w               = l.Width;
imgDpi          = l.XResolution;

% what resolution to sample image at
mult            = opt.dpi/imgDpi;
reqH            = h*mult;
reqW            = w*mult;

% convert file to required format
commandStr      = sprintf('sips -s formatOptions %s -z %d %d -s dpiWidth %d -s dpiHeight %d -s format %s %s --out %s',...
                            opt.convertquality,reqH,reqW,opt.dpi,opt.dpi,opt.convertformat,in,out);                        
[~,str]         = system(commandStr);

% clean up temporary file
delete(l.Filename);