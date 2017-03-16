function copy(hFrom,hTo,varargin)
%% Description
%   Copy all children in axes hFrom to grid in figure axis hTo 
% Input
%       'hFrom'                 : handle to axes from which figure needs to
%                                 be copied
%       'hTo'                   : handle to axes to which figure needs to
%                                 be copied
% Example: 
%   (1) copy figure from one to the next
%
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Get all children of handle hFrom
h = allchild(hFrom);

%   - set hTo as the current figure
set(0,'currentfigure',hTo)

%   - create subplot defined by grid
plt.subplot(varargin{:});

%   - copy children from original figure to new one
copyobj(h,gca);

%   - copy axes properties
prop    = get(hFrom);
set(gca,'XTick',prop.XTick,'YTick',prop.YTick,'XLim',prop.XLim,'YLim',prop.YLim,...
        'FontSize',prop.FontSize,'FontName',prop.FontName,'FontUnits',prop.FontUnits);
