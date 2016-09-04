function recipe_pubfigure
%% Usage examples for the pubfigure toolbox
% Requires dataframe toolbox (https://github.com/jdiedrichsen/dataframe)
% Naveed Ejaz (ejaz.naveed@gmail.com)


%% 1. Create a set of base colours for the current project
%       - define groups of colours together as a set of styles
colours     = {[1,1,1],[0.6 1 0.6],[0 1 0],[1 0.6 1],[1 0 1]};
sty_2grp    = colours([3,5]);   % e.g. group 1 vs group 2

%% 2. Generate random data for two groups
T.x     = [1:20,1:20]';
r1      = 1 + 2.*randn(20,1);
r2      = 2 + 3.*randn(20,1);
T.y     = [r1; r2];
T.split = [ones(20,1); ones(20,1)+1];

%% 3. Plot figure using the two group style-sheet
%       - set y-label and title
%       - use fontsize_all to set all text in figure to font size 12
s   = style_sheet(sty_2grp,'leg',{'grp1','grp2'},'leglocation','northoutside');
h   = make_figure;
lineplot(T.x,T.y,'split',T.split,'CAT',s(1).CAT,s(1).PLOT{:});

set_graphics(h,'ylabel','random','title','group 1 vs group 2',...
               'fontsize_all',12,'xtick',0:2:20);
           
%% 4. Save figure
%       - save using no additional paper size formatting
%       - save using Brain guidelines for a one-column figure (90mm width)
save_figure(h,'unformatted.pdf');
save_figure(h,'brain-one-col.pdf','style','brain_1col');