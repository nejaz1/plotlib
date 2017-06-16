function varargout = general(canvas_type,plot_color)
%% Description
%   Defaults used for all plots
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Parse input
opt.base            = plt.defaults.base;
if nargin==0
    canvas_type     = opt.base.canvas_type;
    plot_color      = opt.base.plot_color;
elseif nargin==1
    plot_color      = opt.base.plot_color;
end;

%% 1. General plotting styles
plot_color                  = plt.defaults.colours(plot_color);
opt.general.facecolor       = plot_color;
opt.general.linecolor       = plot_color;
opt.general.patchcolor      = plot_color;
opt.general.errorcolor      = plot_color;
opt.general.markerfill      = plt.helper.get_colours_alpha(plot_color,opt.base.alpha);
opt.general.markercolor     = plot_color;
opt.general.shadecolor      = plot_color;
opt.general.fillcolor       = plot_color;
opt.general.linewidth       = 1.5;
opt.general.markersize      = 8;
opt.general.errorwidth      = 1.5;
opt.general.markertype      = 'o';
opt.general.linestyle       = '-';        

%% 2. Legend
opt.legend.leg              = 'auto';
opt.legend.leglocation      = 'northeast';

%% 3. Display properties for labels and text
opt.display.xlabel          = '';
opt.display.ylabel          = '';
opt.display.title           = '';
opt.display.panel_title     = '';
opt.display.legvisible      = 'on';
opt.display.legorient       = 'vertical';
opt.display.tickdir         = 'in';
opt.display.ratio           = 'normal';
opt.display.xprecision      = '%g';
opt.display.yprecision      = '%g';

%% 5. Font sizes
opt.font.fontname           = opt.base.font_name;
opt.font.fontunits          = 'points';
opt.font.fontsize           = 12;
opt.font.title_fontsize     = 14;
opt.font.leg_fontsize       = 12;
opt.font.panel_fontsize     = 16;
opt.font.panel_fontweight   = 'bold';
opt.font.panel_horzalign    = 'right';
opt.font.panel_vertalign    = 'baseline';

%% 6. Canvas properties
opt.canvas.type             = canvas_type;
opt.canvas.position         = opt.base.figure_position;
opt.canvas.papertype        = 'a4';
opt.canvas.units            = 'normalized';
opt.canvas.papermode        = 'auto';
opt.canvas.menubar          = 'none';
opt.canvas.resize           = 'on';
opt.canvas.inverthardcopy   = 'off';
opt.canvas.linewidth        = 1;

%% 7. Save properties
opt.save.journal            = opt.base.save_journal;
opt.save.style              = opt.base.save_style;
opt.save.dpi                = 300;
opt.save.units              = 'centimeters';
opt.save.format             = 'pdf';
opt.save.rendering          = 'painters';
opt.save.ui                 = 'noui';
opt.save.convertformat      = 'jpeg';
opt.save.convertquality     = 'best';

varargout   = {opt};
