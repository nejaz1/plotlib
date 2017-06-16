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
set(h,'paperunits',canvas.units,'papertype',canvas.papertype,...
      'inverthardcopy',canvas.inverthardcopy,...
      'menubar',canvas.menubar,...
      'paperpositionmode',canvas.papermode,...
      'position',[canvas.position ppos(3:4)],'paperposition',[canvas.position ppos(3:4)]);
drawnow;
      
%% 3. set colours for canvas
set(h,'color',canvas.bgcolor);
set(txt,'color',canvas.textcolor);
set(leg,'textcolor',canvas.legtextcolor);
if ~isempty(ax)
    for a=1:length(ax)
        set(ax(a),'xcolor',canvas.xcolor,'ycolor',canvas.ycolor,'color',canvas.axescolor);
        set(ax(a).XAxis,'linewidth',canvas.linewidth);
        set(ax(a).YAxis,'linewidth',canvas.linewidth);
    end;
end;


