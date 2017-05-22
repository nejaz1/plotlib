function varargout = canvas(type)
%% Description
%   Select the desired canvas type from the two options given below
% Input
%   type:      style of canvas to be used for plot
%               'paper'
%                   in paper mode, background is in white and axes and text
%                   are in black
%               'presentation'
%                   in presentation mode, background is in black and axes
%                   and text are in white
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 1. Define modes
opt = [];
c   = plt.defaults.colours({'black','white'});
switch(type)
    case 'paper'
        opt.canvas.bgcolor          = c{2};
        opt.canvas.axescolor        = c{2};
        opt.canvas.textcolor        = c{1};
        opt.canvas.legtextcolor     = c{1};        
        opt.canvas.xcolor           = c{1};
        opt.canvas.ycolor           = c{1};
    case 'presentation'
        opt.canvas.bgcolor          = c{1};
        opt.canvas.axescolor        = c{1};
        opt.canvas.legtextcolor     = c{2};                
        opt.canvas.textcolor        = c{2};
        opt.canvas.xcolor           = c{2};
        opt.canvas.ycolor           = c{2};
end;

varargout = {opt};
