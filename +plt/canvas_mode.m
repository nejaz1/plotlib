function canvas_mode(type)
%% Description
%   Select the desired canvas mode from the two options given below
% Input
%   type:      style of canvas to be used for plot
%               'blackonwhite'
%                   in paper mode, background is in white and axes and text
%                   are in black
%               'whiteonblack'
%                   in presentation mode, background is in black and axes
%                   and text are in white
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

sty             = style.get;
canvasOpt       = plt.defaults.canvas(type);
sty.canvas      = addstruct(sty.canvas,canvasOpt);

plt.helper.set_canvas(sty.canvas);
