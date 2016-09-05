function save_figure(H,fname,varargin)
%% Description
%   Wrapper for saving a styled figure window to file
%   save_figure(varargin) saves the figure window with handle H into the
%   specified file name
% Input
%   H       : handle to figure window
%   fname   : name of file that is saved
%   varargin: Format options. 
%       In general: 'formating_option', value,... 
%       'dpi'                  : dpi for saved image (300 default)
%       'format'               : file format to save in (pdf is default)
%       'rendering'            : which renderer is used (painters/opengl)
%       'aa'                   : perform anti-aliasing (0/1)
%       'style'                : style in which figure is saved.
%                                this depends on the journal and preset
%                                parameters in the code.
% Example: 
%   (1) make a figure in a4 with a white background
%       h = make_figure('papertype','a4','color',[1 1 1]);
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)



%% 0. Default figure parameters
dpi         = 300;
papermode   = 'manual';
format      = 'pdf';
rendering   = 'painters';
ui          = 'noui';
style       = 'none';
aa          = 0;
vararginoptions(varargin,{'dpi','format','rendering','style','aa'});  

%% 1. Setting up figure mode and saving figure
set(H,'paperpositionmode',papermode);

switch(style)
    case 'brain_1col'               % single column, 90cm by 90cm
        paperposition = [0 0 9 9];   
        set(H,'paperposition',paperposition);
    case 'brain_2col'               % two-column, 185cm by 90cm
        paperposition = [0 0 18.5 9];   
        set(H,'paperposition',paperposition);
    case 'brain_2row'               % two row, two-column, 185cm by 185cm
        paperposition = [0 0 18.5 18.5];   
        set(H,'paperposition',paperposition);
end;

%% 2. print figure to file
print(H,['-r',num2str(dpi)],['-d',format],['-',rendering],['-',ui],fname); 