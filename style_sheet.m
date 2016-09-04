function varargout=style_sheet(c,varargin)
%% Description
%   Plot figures that are consistent across a study by using predefined
%   styles.
%   style_sheet(style,varargin) returns the predefined style.
%       Specifics of the style can be altered using varargin.
% Output
%   OPTS:   options variable that holds figure styles and plotting params.
%           OPTS is a (N+1) structure array, where N is the number of items
%           in the style group. OPTS(1) contains formatting for the entire
%           group as a whole, while OPTS(2:N+1) hold formatting entires for
%           each individual group entry.
%           OPTS.CAT holds the line styles etc required for plotting
%           OPTS.PLOT holds the parameters used for additional plotting
%           parameters (e.g. legend)
% Input
%   c:      set of colours to be used for the style
%
%   varargin: Format options. 
%       In general: 'formating_option', value,... 
%       'linewidth'             : line width for plotted data
%       'markersize'            : size of marker for plotted data
%       'errorwidth'            : width of error bars
%       'markertype'            : style of marker used (e.g. 'o','^')
%       'linestyle'             : style of plotted line {'-','--'}
%       'leg'                   : set the legend, if 'auto', then
%                                 automatically set, otherwise provide
%                                 string labels
%       'leglocation'           : location of the legend, options are:
%                                 {'north','east','west','south'}
% Example: 
%   (1) get the stylex2grp style to plot data for two groups
%       OPTS = style_sheet('stylex2grp','leg',{'group1','group2'},'leglocation','north');
%       barplot(X,[Y1 Y2],'CAT',OPTS.CAT,OPTS.PLOT{:}););
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)


%% 0. Default plotting parameters
linewidth       = 1.5;
markersize      = 8;
errorwidth      = 1.5;
markertype      = 'o';
linestyle       = '-';
leglocation     = 'northwest';
leg             = 'auto';
vararginoptions(varargin,{'linewidth','markersize','errorwidth','markertype','linestyle',...
                          'leg','leglocation'});  

%% 1. Setting structures used for figure manipulation

CAT.facecolor   = [];
CAT.linecolor   = [];
CAT.patchcolor  = [];
CAT.linewidth   = [];
CAT.markersize  = [];
CAT.errorwidth  = [];
CAT.markertype  = [];
CAT.linestyle   = [];

c_vars  = {'facecolor','linecolor','patchcolor','markerfill','markercolor'};
vars    = {'linewidth','markersize','errorwidth','markertype','linestyle'};                  

what = {'set_group','set_children'};
for w=1:length(what)
    switch(what{w})
        case 'set_group'                % setting up style for the entire group
            OPTS(1).PLOT    = {'leg',leg,'leglocation',leglocation};                
            OPTS(1).CAT     = CAT;
            % setting colours
            for v=1:length(c_vars)
                OPTS(1).CAT.(c_vars{v}) = c; 
            end;

            % setting variables
            for v=1:length(vars)
                OPTS(1).CAT.(vars{v}) = eval(vars{v});
            end;
        case 'set_children'             % setting up style for individual elements in group
            for i=1:length(c)
                % set basic plotting options
                if isa(leg,'char')
                    OPTS(i+1).PLOT    = {'leg',leg,'leglocation',leglocation};
                else 
                    OPTS(i+1).PLOT    = {'leg',leg(i),'leglocation',leglocation};
                end;
                
                OPTS(i+1).CAT     = [];
                % setting colours
                for v=1:length(c_vars)
                    OPTS(i+1).CAT.(c_vars{v}) = c{i}; 
                end;
                
                % setting variables
                for v=1:length(vars)
                    x = eval(vars{v});
                    if isa(x,'cell')
                        OPTS(i+1).CAT.(vars{v}) = x{i};
                    else
                        OPTS(i+1).CAT.(vars{v}) = x;
                    end;
                end;
            end; 
    end;
end;        
varargout = {OPTS};