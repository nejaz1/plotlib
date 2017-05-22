function legend(location,cat,subplotID)
%% Description
%   Set legend for the figure
% Input
%       'location'              : location for the legend
%                                       'north','south','east','west'
%       'cat'                   : categories for the legend (cell of strings)
%       'subplotID'             : subplot to set labels to
% Example: 
%   (1) make a plot and set legend properties
%       plt.legend('northeast',{'control','patients'});
%   (2) make a plot and set legend properties in a specific subplot
%       plt.legend('northeast',{'control','patients'},131);
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Check number of inputs
if nargin==1
    cat         = [];
    subplotID   = [];
elseif nargin==2
    subplotID   = [];
end;

%% 1. Get existing legend (will always exist)
if isempty(subplotID)
    h   = gca;
else
    h   = subplot(subplotID);
end;
leg = getappdata(h,'LegendPeerHandle');

%% 2. Set legend parameters
if ~iscell(location)
    set(leg,'location',location,'string',cat,'visible','on');
else
    set(leg,'location',location{1},'string',cat,'orientation',location{2},'visible','on');
end;