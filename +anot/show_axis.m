function show_axis(ax)
%% Description
%   Turns on visibility of axis in the current axes object
% Input
%       'ax'                : 'y' or 'x' or 'both'
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Hide selected axis
h = gca;

switch(ax)
    case 'y'
        set(h.YAxis,'visible','on');
    case 'x'
        set(h.XAxis,'visible','on');
    case 'both'
        set(h.XAxis,'visible','on');        
        set(h.YAxis,'visible','on');
end;
