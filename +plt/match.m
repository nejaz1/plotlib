function match(H,match)
%% Description
%   Easy wrapper for matching axis across multiple subplot or whole figure
%   set_graphics(H,varargin) set the properties specified in varargin to
%   the figure or axes provided in H.
% Input
%   H:          handle to a figure, or multiple axes
%               If H is a handle to a figure, then options are applied to every subplot.
%               If H is a handle to an axes, then options are applied to the axes only
%
%   match:      'y' or 'x' or 'both'            
% Example: 
%   (1) make a plot and set figure properties
%       x = [1:20];     
%       plot(x,x.^2);
%       set(gca,'ax','square');
%
%   (2) make two plots and set them both to the same scale
%       x = [1:20];
%       h = figure;
%       subplot(121);   plot(x,x);
%       subplot(122);   plot(x,x.^2);
%       set(h,'ax','square','match','ylim');
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)


%% 0. Default plotting parameters
if ischar(H)
    match       = H;
    H           = gcf;
end;
ax = plt.helper.get_axes(H);

%% 1. Setting up which axis need to be processed
XLimMin     = [Inf Inf];
XLimMax     = [-Inf -Inf];
YLimMin     = [Inf Inf];
YLimMax     = [-Inf -Inf];


%% 2. Loop over all axis types and estimate limits
for hL=1:length(ax)
    h = ax{hL};    % handle to current axis
    
    switch(class(h))
        case 'matlab.graphics.axis.Axes'
            % Calculating axis min and max 
            xLimAct     = get(h,'xlim');
            yLimAct     = get(h,'ylim');
            XLimMin     = min([XLimMin; xLimAct],[],1);
            XLimMax     = max([XLimMax; xLimAct],[],1);
            YLimMin     = min([YLimMin; yLimAct],[],1);
            YLimMax     = max([YLimMax; yLimAct],[],1);
    end;
end;

%% 4. Set scaling of all axis equal is required
axLim = [XLimMin(1) XLimMax(2) YLimMin(1) YLimMax(2)];
for hL=1:length(ax)
    h = ax{hL};    % handle to current axis
    if isa(h,'matlab.graphics.axis.Axes')
        switch(match)
            case 'y'
                set(h,'ylim',axLim(3:4));
            case 'x'
                set(h,'xlim',axLim(1:2));
            case 'both'
                set(h,'ylim',axLim(3:4));
                set(h,'xlim',axLim(1:2));
        end;
    end;
end;

