function save(fname,varargin)
%% Description
%   Saving figure window to file
%   save(varargin) saves the figure window with handle H into the
%   specified file name
% Input
%   H       : handle to figure window
%   fname   : name of file that is saved
%   varargin: Format options. 
%       In general: 'formating_option', value,... 
%       'style'                : style in which figure is saved.
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
style       = '1row';
vararginoptions(varargin,{'style'}); 

%% 0. Get user options
H   = gcf;
opt = plt.defaults.save(style);
opt = plt.helper.getUserOptions(varargin,opt);

%% 1. Setting up figure mode and saving figure
%       - set up colours of x- and y-axis lines
set(H,'paperpositionmode',opt.save.papermode,'paperposition',opt.save.paperposition,...
      'papersize',opt.save.paperposition(3:4));
h = findobj(H,'type','axes');
set(h,'xcolor',opt.save.xcolor{1},'ycolor',opt.save.ycolor{1},'zcolor',opt.save.zcolor{1});

%% 2. print figure to file
print(H,['-r',num2str(opt.save.dpi)],['-d',opt.save.format],['-',opt.save.rendering],['-',opt.save.ui],fname); 