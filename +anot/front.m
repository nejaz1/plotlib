function front(grp)
%% Description
%   Bring plotted data group in a plot to the front
% Input
%   varargin: Format options. 
%       In general: 'formating_option', value,
%       Use help barplot to get plotting options for parent function in
%       dataframe toolbox
%       'grp'               : group id to bring to front
%       'vis'               : visibility (set to 'on' or 'off')
% Example: 
%   (1) plot x against y, splitting by group, bring data for group 2 forward
%       plt.bar(x,y,'split',group);
%       anot.front(1);
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Get access to current axes
h = gca;
L = length(grp);

x   = findobj(h,'tag',num2str(grp));
uistack(x,'top');


