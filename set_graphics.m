function set_graphics(H,varargin)
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
%       'fontsize'              : size for text in the axis/figure
%       'fontname'              : name of font for text in the axis/figure
%       'fontunits'             : units in which fonts are specified
%                                   {'points','centimeters'}
%       'title_fontsize'        : font size for axis title
%       'leg_fontsize'          : font size for legend entries
%       'xtick'                 : tick markings on the x-axis
%       'ytick'                 : tick markings on the y-axis
%       'xticklabel'            : labels for the x-tick markings
%       'yticklabel'            : labels for the y-tick markings
%       'xlabel'                : label for x-axis
%       'ylabel'                : label for y-axis
%       'title'                 : title for axis
%       'ax'                    : aspect ratio of axis, options are:
%                                   {'square','equal','normal'}
%       'match'                 : set all axes/subplots to the same scale,
%                                 options are: {'ylim','xlim','both'}
% Example: 
%   (1) make a plot and set figure properties
%       x = [1:20];     
%       plot(x,x.^2);
%       set_graphics(gca,'ax','square','ylabel','squared','title','x-squared');
%
%   (2) make two plots and set them both to the same scale
%       x = [1:20];
%       h = figure;
%       subplot(121);   plot(x,x);
%       subplot(122);   plot(x,x.^2);
%       set_graphics(h,'ax','square','match','ylim');
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)



%% 0. Default plotting parameters
fontsize        = 12;
title_fontsize  = 14;
leg_fontsize    = 12;
fontname        = 'myriadpro';
ax              = 'square';
fontunits       = 'points';
vararginoptions(varargin,{'fontsize','fontname','title_fontsize','leg_fontsize','fontsize_all',...
                          'xticklabel','yticklabel','xtick','ytick','xlim','ylim','axis'...
                          'xlabel','ylabel','title','ax','match','rotate_xtick'});  

%% 1. Setting up which axis need to be processed
OPTS        = struct;
OPTS.GCA    = [];
XLimMin     = [Inf Inf];
XLimMax     = [-Inf -Inf];
YLimMin     = [Inf Inf];
YLimMax     = [-Inf -Inf];


axisList        = {};   % list of axis
if (length(H)==1 && isa(H,'matlab.ui.Figure')) % user gave figure handle
    % find all children and put them into axisList
    h = get(H,'children');
    for i=1:length(h)
        axisList = {h(i),axisList{:}};
    end;
elseif iscell(H)                                % user gave a cell array of axis handles
    axisList = H;
else
    axisList = {H};                             % user gave a single axis
end;

%% 2. over-ride font sizes if allfont is specified
if exist('fontsize_all','var')
    fontsize        = fontsize_all;
    title_fontsize  = fontsize_all;
    leg_fontsize    = fontsize_all;
end;

%% 3. Loop over all axis types
for hL=1:length(axisList)
    h = axisList{hL};    % handle to current axis
    
    switch(class(h))
        case 'matlab.graphics.illustration.Legend'      
            set(h,'fontsize',leg_fontsize,'fontname',fontname,'fontunits',fontunits);
        case 'matlab.graphics.axis.Axes'
            % Set font size and axis size properties
            axes(h);
            set(h,'fontsize',fontsize,'fontname',fontname,'fontunits',fontunits);
            eval(sprintf('axis %s',ax));
            
            % Calculating axis min and max 
            XLimMin     = min([XLimMin; get(h,'xlim')],[],1);
            XLimMax     = max([XLimMax; get(h,'xlim')],[],1);
            YLimMin     = min([YLimMin; get(h,'ylim')],[],1);
            YLimMax     = max([YLimMax; get(h,'ylim')],[],1);

            % Setting ticks and tick labels
            x = {'xticklabel','yticklabel','xtick','ytick','xlim','ylim','axis'};
            for i=1:length(x)
                if exist(x{i},'var')
                    OPTS.GCA.(x{i}) = eval(x{i}); 
                end;
            end;
            
            % Rotating labels if necessary
            if exist('rotate_xtick','var')
                rotateticklabel(h,rotate_xtick);
            end;

            % Setting up titles and labels
            x   = {'ylabel','xlabel','title'};
            for i=1:length(x)
                y = get(h,x{i});
                set(y,'fontsize',title_fontsize,'fontweight','normal','fontunits',fontunits);
                if exist(x{i},'var')
                    set(y,'string',eval(x{i}));
                end;
            end;

            % Assigning options
            if ~isempty(OPTS.GCA)
                set(h,OPTS.GCA);       
            end;
    end;
end;

%% 4. Set scaling of all axis equal is required
axLim = [XLimMin(1) XLimMax(2) YLimMin(1) YLimMax(2)];
if exist('match','var')
    for hL=1:length(axisList)
        h = axisList{hL};    % handle to current axis
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
