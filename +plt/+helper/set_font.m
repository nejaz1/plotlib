function set_font(h,style)
%% Description
%   Set default font and sizes for the current graphics object

%% 0. Get handle to all children graphics items of the current figure/subplot
x = findobj(h,'type','axes','-or','type','legend');

for i=1:length(x)
    switch(class(x(i)))
        case 'matlab.graphics.axis.Axes'
            set(x(i),'fontsize',style.font.fontsize,...
                     'fontname',style.font.fontname,...
                     'fontunits',style.font.fontunits);
        case 'matlab.graphics.illustration.Legend'
            set(x(i),'fontsize',style.font.leg_fontsize,...
                     'fontname',style.font.fontname,...
                     'fontunits',style.font.fontunits);
    end;
end;