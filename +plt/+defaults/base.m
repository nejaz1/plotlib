function varargout = base
%% Description
%   Base defaults for plotlib
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

base.canvas_type        = 'blackonwhite';   % black text on white      
base.plot_color         = 'black';          % plot in black
base.save_journal       = 'brain';          % for journal Brain
base.save_style         = '1x1';            % default saved figure 1row 2col
base.font_name          = 'myriadpro';      % default text used for all figures
base.figure_position    = [49 1];           % location of plotted figure on screen
base.alpha              = 0.3;              % shading alpha used across plots

varargout   = {base};
