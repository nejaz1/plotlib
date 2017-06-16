function save(fname,save_style,varargin)
%% Description
%   Saving figure window to file
%   save(varargin) saves the figure window with handle H into the
%   specified file name
% Input
%   fname   : name of file that is saved
%   varargin: Format options. 
%       In general: 'formating_option', value,... 
%       'savestyle'            : style in which figure is saved.
%                                this depends on the journal and preset
%                                parameters in the code.
%       'dpi'                  : dpi for saved image (300 default)
%       'format'               : file format to save in (pdf is default)
%       'rendering'            : which renderer is used (painters/opengl)
% Example: 
%   (1) save a pdf file, in 1 column format (90cm by 90cm), 
%       h = plt.save(gcf,'stylefig.pdf','style','1col');
%   (2) save a pdf file, in 2 column format (185cm by 90cm), 
%       h = plt.save(gcf,'stylefig.pdf','style','1row');
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)


%% 0. Default figure parameters
vararginoptions(varargin,{'canvas_mode','dpi','format','rendering'}); 

%% 0. Get user options (canvas and save parameters)
sty             = style.get;
userOpt         = plt.helper.getUserOptions(varargin);

%   - get canvas parameters
if isfield(userOpt,'canvas_mode')
    canvasOpt   = plt.defaults.canvas(userOpt.canvas_mode);
else
    canvasOpt   = plt.defaults.canvas(sty.canvas.type);
end;
sty.canvas = addstruct(sty.canvas,canvasOpt);

%   - get save parameters
saveOpt     = plt.defaults.save(sty.save.journal,save_style);
sty.save    = plt.helper.updateUserOptions(sty.save,saveOpt);
sty.save    = plt.helper.updateUserOptions(sty.save,userOpt);

%% 1. Setup canvas properties
plt.helper.set_canvas(sty.canvas);

%% 1. Setting figure size required for pdf
H           = gcf;
set(H,'paperpositionmode','manual',...
      'paperunits',sty.save.units,...
      'paperposition',sty.save.paperposition,...
      'papersize',sty.save.paperposition(3:4));
  
%% 2. print figure to file
print(H,['-r',num2str(sty.save.dpi)],['-d',sty.save.format],['-',sty.save.rendering],['-',sty.save.ui],fname); 

%% 3. Resetting paper mode and units
set(H,'paperpositionmode','auto','paperunits',sty.canvas.units);