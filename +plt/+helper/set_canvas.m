function set_canvas(canvas)
%% Description
%   Change colours of the figure canvas
% Input
%   canvas: specifies the colors for the following values
%       'xcolor'                : x-axes color 
%       'ycolor'                : y-axes color 
%       'bgcolor'               : background color
%       'textcolor'             : text color
%       'legtextcolor'          : legend text color 
%       'axescolor'             : axes background color 
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 1. find all axes and text objects
ax  = findall(gcf,'type','axes');
txt = findall(gcf,'type','text');
leg = findall(gcf,'type','legend');

%% 2. set colors in figure
set(gcf,'color',canvas.bgcolor);
set(ax,'xcolor',canvas.xcolor,'ycolor',canvas.ycolor,'color',canvas.axescolor);
set(txt,'color',canvas.textcolor);
set(leg,'textcolor',canvas.legtextcolor);
