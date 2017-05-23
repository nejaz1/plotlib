function export(fname,save_style)
%% Description
%   Export figure on screen to file
%   This is a wrapper function that applies the presets in the plotlib
%   library to a user generated figure. The figure is then saved to disk
% Input
%   fname   : name of file that is saved
%   varargin: Format options. 
%       In general: 'formating_option', value,... 
%       'savestyle'            : style in which figure is saved.
%                                this depends on the journal and preset
%                                parameters in the code.
% Example: 
%   (1) save a pdf file, in 1 column format (90cm by 90cm), 
%       h = plt.export('stylefig.pdf','1x1');
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Get default plotting styles
sty = style.get;

%% 1. Run pipline of preparing figure
plt.set(gcf);
plt.legend({sty.legend.leglocation,sty.display.legorient});
plt.canvas_mode(sty.canvas.type);
plt.panel('A');
plt.save(fname,save_style);
