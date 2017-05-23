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
h = gcf;

ax  = findall(h,'type','axes');
txt = findall(h,'type','text');
leg = findall(h,'type','legend');

%% 2. set paper properties for canvas
ppos    = get(h,'position');
set(h,'position',[canvas.position ppos(3:4)],'papertype',canvas.papertype,'paperunits',canvas.units,...
      'menubar',canvas.menubar,'resize',canvas.resize);
  
%% 3. set colours for canvas
set(h,'color',canvas.bgcolor);
set(ax,'xcolor',canvas.xcolor,'ycolor',canvas.ycolor,'color',canvas.axescolor);
set(txt,'color',canvas.textcolor);
set(leg,'textcolor',canvas.legtextcolor);


