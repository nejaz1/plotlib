function [outlier,handle]=mydotutil(x,lb,F)
%MYBOXUTIL Produces a single box plot.
%   MYBOXUTIL(X) is a utility function for BOXPLOT, which calls
%   MYBOXUTIL once for each column of its first argument. 
%   notch: 1 with a notch
%   lb: x-position
%   F.w: boxwidth
%   F.lf: barwidth
%   F.outliersymbol: symbol for outliers/datapoints
%   F.flip: vertical
%   F.whiskerlength: whisker length
%   F.whissw: 
%   F.plotall: 0: none 1: plots all ouliers 2:plots all 
%   F.linecolor
%   F.mediancolor
%   F.fillcolor
%   Copyright 1993-2002 The MathWorks, Inc. 
% $Revision: 2.17 $  $Date: 2002/01/17 21:30:05 $

versionNum = plt.helper.matlab_version;

% Make sure X is a vector.
if min(size(x)) ~= 1, 
    error('First argument has to be a vector.'); 
end


% define the median and the quantiles if more data than 4 
pctiles     = prctile(x,[25;50;75]);
q1          = pctiles(1,:);
med         = pctiles(2,:);
q3          = pctiles(3,:);
xmean       = nanmean(x);

% find the extreme values (to determine where whiskers appear)
vhi = q3+F.whiskerlength*(q3-q1);
upadj = max(x(x<=vhi));
if (isempty(upadj)), upadj = q3; end

vlo = q1-F.whiskerlength*(q3-q1);
loadj = min(x(x>=vlo));
if (isempty(loadj)), loadj = q1; end

x1 = lb*ones(1,2);
x2 = x1+[-0.25*F.w,0.25*F.w];

% determine which symbols to plot 
outlier = x<loadj | x > upadj;
yy      = x;

xx = lb*ones(1,length(yy));
    lbp = lb + 0.5*F.w;
    lbm = lb - 0.5*F.w;

if F.whissw == 0
   upadj = max(upadj,q3);
   loadj = min(loadj,q1);
end

% Set up (X,Y) data for notches if desired.
if ~F.notch
    xx2 = [lbm lbp lbp lbm lbm];
    yy2 = [q3 q3 q1 q1 q3];
    xx3 = [lbm lbp];
else
    n1 = med + 1.57*(q3-q1)/sqrt(length(x));
    n2 = med - 1.57*(q3-q1)/sqrt(length(x));
    if n1>q3, n1 = q3; end
    if n2<q1, n2 = q1; end
    lnm = lb-0.25*F.w;
    lnp = lb+0.25*F.w;
    xx2 = [lnm lbm lbm lbp lbp lnp lbp lbp lbm lbm lnm];
    yy2 = [med n1 q3 q3 n1 med n2 q1 q1 n2 med];
    xx3 = [lnm lnp];
end
% Set line to be plotted in median or mean of data.
switch F.plotfcn
    case 'mean'
        yyy = [med med];
    case 'median'
        yyy = [xmean xmean];
end

% Determine if the boxes are vertical or horizontal.
% The difference is the choice of x and y in the plot command.
if ~F.flip
    s       = abs(diff(xx3))/3;
    jitter  = xx + normrnd(0,s,1,length(xx));
    jitter(jitter>max(xx3)) = max(xx3);
    jitter(jitter<min(xx3)) = min(xx3);
    
    handle = scatter(jitter,yy,'ko');
    if versionNum<8.4
        set(handle,'Marker',F.markertype,'MarkerSize',F.markersize,'MarkerEdgeColor','k','MarkerFaceColor','k','tag',F.tag);                                    % symbols        
    else
        set(handle,'Marker',F.markertype,'SizeData',F.sizedata,'MarkerEdgeColor',F.markercolor,'MarkerFaceColor',F.markercolor,...
                   'MarkerFaceAlpha',F.facealpha,'MarkerEdgeAlpha',F.edgealpha,'tag',F.tag);                                    % symbols        
    end;
    set(plot(xx3,yyy,'k-'),'Color','k','LineWidth',F.meanwidth,'tag',F.tag);                                          % mean line
else
    s       = abs(diff(xx3))/3;
    jitter  = xx + normrnd(0,s,1,length(xx));
    jitter(jitter>max(xx3)) = max(xx3);
    jitter(jitter<min(xx3)) = min(xx3);
    
    handle = scatter(yy,jitter,'ko');
    if versionNum<8.4
        set(handle,'Marker',F.markertype,'MarkerSize',F.markersize,'MarkerEdgeColor','k','MarkerFaceColor','k','tag',F.tag);                                    % symbols            
    else
        set(handle,'Marker',F.markertype,'SizeData',F.sizedata,'MarkerEdgeColor',F.markercolor,'MarkerFaceColor',F.markercolor,...
                   'MarkerFaceAlpha',F.facealpha,'MarkerEdgeAlpha',F.edgealpha,'tag',F.tag);                                    % symbols        
    end;
    set(plot(yyy,xx3,'k-'),'Color','k','LineWidth',F.meanwidth,'tag',F.tag);                                          % mean line
end;

