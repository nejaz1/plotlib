function varargout = canvas(type)
%% Description
%   Select the desired canvas type from the two options given below
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

%% 1. Define modes
canvas = [];
c   = plt.defaults.colours({'black','white'});
switch(type)
    case 'blackonwhite'
        canvas.bgcolor          = c{2};
        canvas.axescolor        = c{2};
        canvas.textcolor        = c{1};
        canvas.legtextcolor     = c{1};        
        canvas.xcolor           = c{1};
        canvas.ycolor           = c{1};
    case 'whiteonblack'
        canvas.bgcolor          = c{1};
        canvas.axescolor        = c{1};
        canvas.legtextcolor     = c{2};                
        canvas.textcolor        = c{2};
        canvas.xcolor           = c{2};
        canvas.ycolor           = c{2};
end;

varargout = {canvas};
