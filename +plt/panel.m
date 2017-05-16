function panel(panelID,subplotID)
%% Description
%   Set panel label on current axes
% Input
%       'panelID'               : id/name given to the subplot panel
%       'subplotID'             : subplot to set labels to
% Example: 
%   (1) make a plot and set figure properties
%       plt.panel('A');
%   (2) make a plot and set figure properties in subplot(122)
%       plt.panel('A',122);
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 1. Set labels
sty = style.get;
if nargin==1
    subplotID   = [];
end;

if isempty(subplotID)
    h   = gca;
else
    h   = subplot(subplotID);
end;

ypos = get(get(h,'ylabel'),'Position');
tpos = get(get(h,'title'),'Position');
text(ypos(1),tpos(2),panelID,'fontsize',sty.font.panel_fontsize,...
                             'fontweight',sty.font.panel_fontweight,...
                             'horizontalalignment',sty.font.panel_horzalign,...
                             'verticalalignment',sty.font.panel_vertalign);
