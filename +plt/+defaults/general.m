function varargout = general(colour_rgb)
%% Description
%   Defaults used for all plots
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

if nargin==0
    colour_rgb = plt.defaults.colours('black');
end;

opt.general.facecolor       = colour_rgb;
opt.general.linecolor       = colour_rgb;
opt.general.patchcolor      = colour_rgb;
opt.general.errorcolor      = colour_rgb;
opt.general.markerfill      = colour_rgb;
opt.general.markercolor     = colour_rgb;
opt.general.shadecolor      = colour_rgb;
opt.general.fillcolor       = colour_rgb;
opt.general.linewidth       = 1.5;
opt.general.markersize      = 8;
opt.general.errorwidth      = 1.5;
opt.general.markertype      = 'o';
opt.general.linestyle       = '-';

opt.legend.leg              = 'auto';
opt.legend.leglocation      = 'northeast';

opt.display.xlabel          = '';
opt.display.ylabel          = '';
opt.display.title           = '';
opt.display.panel_title     = '';
opt.display.ax              = 'normal';

opt.font.fontname           = 'myriadpro';
opt.font.fontunits          = 'points';
opt.font.fontsize           = 12;
opt.font.title_fontsize     = 14;
opt.font.leg_fontsize       = 12;
opt.font.panel_fontsize     = 16;
opt.font.panel_fontweight   = 'bold';
opt.font.panel_horzalign    = 'right';
opt.font.panel_vertalign    = 'baseline';

varargout   = {opt};
