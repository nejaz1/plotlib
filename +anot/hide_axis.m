function hide_axis(ax)
%% Description
%   Turns off visibility of axis in the current axes object
% Input
%       'ax'                : 'y' or 'x' or 'both'
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Hide selected axis
h = gca;

switch(ax)
    case 'y'
        set(h.YAxis,'visible','off');
    case 'x'
        set(h.XAxis,'visible','off');
    case 'both'
        set(h.XAxis,'visible','off');        
        set(h.YAxis,'visible','off');
end;
