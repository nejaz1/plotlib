function labels(xlab,ylab,fig_title)
%% Description
%   Set labels on the figure
% Input
%       'xlab'                  : label for the x-axis of current axes
%       'ylab'                  : label for the y-axis of current axes
%       'fig_title'             : title of the main plot in current axes
% Example: 
%   (1) make a plot and set figure properties
%       plt.labels('force',{'activation','(arbitrary units)'},'title');
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Check number inputs
sty = style.get;
if nargin==1
    ylab        = sty.display.ylabel;
    fig_title   = sty.display.title;
elseif nargin==2
    fig_title   = sty.display.title;
end;

%% 1. Set labels
h   = gca;

set(get(h,'xlabel'),'string',xlab);
set(get(h,'ylabel'),'string',ylab);
set(get(h,'title'),'string',fig_title,'fontsize',sty.font.title_fontsize);
