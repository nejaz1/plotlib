function hide_data(grp)
%% Description
%   Turns off visibility of data specified by the grp tag
% Input
%   varargin: Format options. 
%       In general: 'formating_option', value,
%       Use help barplot to get plotting options for parent function in
%       dataframe toolbox
%       'grp'               : vector of group ids to toggle on off
%       'vis'               : visibility (set to 'on' or 'off')
% Example: 
%   (1) plot x against y, splitting by group, hide data for 1 group
%       plt.bar(x,y,'split',group);
%       anot.hide_data(1);
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Get access to current axes
h   = gca;
vis = 'off';
L   = length(grp);

for g=1:L
    x   = findobj(h,'tag',num2str(grp(g)));
    set(x,'visible',vis);
end;


