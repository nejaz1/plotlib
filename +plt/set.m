function set(H,varargin)
%% Description
%   Easy wrapper for applying graphics options for multiple plots. 
%   set_graphics(H,varargin) set the properties specified in varargin to
%   the figure or axes provided in H.
% Input
%   H:  handle to a figure, or multiple axes
%       If H is a handle to a figure, then options are applied to every subplot.
%       If H is a handle to an axes, then options are applied to the axes only
%   varargin: Format options. 
%       In general: 'formating_option', value,... 
%       'xtick'                 : tick markings on the x-axis
%       'ytick'                 : tick markings on the y-axis
%       'xticklabel'            : labels for the x-tick markings
%       'yticklabel'            : labels for the y-tick markings
%       'ax'                    : aspect ratio of axis, options are:
%                                   {'square','equal','normal'}
%       'match'                 : set all axes/subplots to the same scale,
%                                 options are: {'ylim','xlim','both'}
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
    varargin    = {H,varargin{:}};
    H           = gca;
end;
    
vararginoptions(varargin,{'xticklabel','yticklabel','xtick','ytick','xlim','ylim','axis'...
                          'ax','match','rotate_xtick'}); 

%% 0. Getting specified user options
OPTS        = style.get;
OPTS        = plt.helper.getUserOptions(varargin,OPTS.display);
OPTS.GCA    = [];

%% 1. Setting up which axis need to be processed
XLimMin     = [Inf Inf];
XLimMax     = [-Inf -Inf];
YLimMin     = [Inf Inf];
YLimMax     = [-Inf -Inf];

ax = plt.helper.get_axes(H);

%% 2. Loop over all axis types
for hL=1:length(ax)
    h = ax{hL};    % handle to current axis
    
    switch(class(h))
        case 'matlab.graphics.axis.Axes'
            % Set font size and axis size properties
            axes(h);
            eval(sprintf('axis %s',OPTS.ax));
            
            % Calculating axis min and max 
            xLimAct     = get(h,'xlim');
            yLimAct     = get(h,'ylim');
            XLimMin     = min([XLimMin; xLimAct],[],1);
            XLimMax     = max([XLimMax; xLimAct],[],1);
            YLimMin     = min([YLimMin; yLimAct],[],1);
            YLimMax     = max([YLimMax; yLimAct],[],1);

            % Setting ticks and tick labels
            x = {'xticklabel','yticklabel','xtick','ytick','xlim','ylim','axis'};
            for i=1:length(x)
                if exist(x{i},'var')
                    OPTS.GCA.(x{i}) = OPTS.(x{i});
                end;
            end;
            
            % Assigning options
            if ~isempty(OPTS.GCA)
                set(h,OPTS.GCA);       
            end;
            
            % Rotating labels if necessary
            if exist('rotate_xtick','var')
                rotateticklabel(h,rotate_xtick);
            end;            
    end;
end;

%% 4. Set scaling of all axis equal is required
axLim = [XLimMin(1) XLimMax(2) YLimMin(1) YLimMax(2)];
if exist('match','var')
    for hL=1:length(ax)
        h = ax{hL};    % handle to current axis
        if isa(h,'matlab.graphics.axis.Axes')
            switch(match)
                case 'ylim'
                    set(h,'ylim',axLim(3:4));
                case 'xlim'
                    set(h,'xlim',axLim(1:2));
                case 'both'
                    set(h,'ylim',axLim(3:4));
                    set(h,'xlim',axLim(1:2));
            end;
        end;
    end;
end;

