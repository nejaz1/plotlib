function set_font(h,style)
%% Description
%   Set default font and sizes for the current graphics object

%% 0. Get handle to all children graphics items of the current figure/subplot
x = findobj(h,'type','axes');

% 1. set font sizes for axes
for i=1:length(x)
    switch(class(x(i)))
        case 'matlab.graphics.axis.Axes'
            set(x(i),'fontsize',style.font.fontsize,...
                     'fontname',style.font.fontname,...
                     'fontunits',style.font.fontunits);
    end;
end;

% 2. set font size for legend
x = getappdata(h,'LegendPeerHandle');
set(x,'fontsize',style.font.leg_fontsize,...
      'fontname',style.font.fontname,...
      'fontunits',style.font.fontunits);
