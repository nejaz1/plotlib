function canvas_mode(mode)
%% Description
%   Select the desired canvas mode from the two options given below
% Input
%   mode:      style of canvas to be used for plot
%               'paper'
%                   in paper mode, background is in white and axes and text
%                   are in black
%               'presentation'
%                   in presentation mode, background is in black and axes
%                   and text are in white
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

opt = plt.defaults.canvas(mode);
plt.helper.set_canvas(opt.canvas);
