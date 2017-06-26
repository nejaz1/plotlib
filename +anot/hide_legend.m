function hide_legend
%% Description
%   Turns off visibility of legend in the current axes object
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Hide selected axis
l = getappdata(gca);

if isfield(l,'LegendPeerHandle')
    set(l.LegendPeerHandle,'visible','off');
end;
