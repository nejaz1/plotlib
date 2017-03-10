function recipe_plotlib
%% Usage examples for the plotlib toolbox
% Requires dataframe toolbox (https://github.com/jdiedrichsen/dataframe)
% Naveed Ejaz (ejaz.naveed@gmail.com)


%% 0. Generate random data for two groups
T.x     = [1:20,1:20]';
r1      = 1 + 2.*randn(20,1);
r2      = 2 + 3.*randn(20,1);
T.y     = [r1; r2];
T.split = [ones(20,1); ones(20,1)+1];


%% 1. Look at list of plots available
plt.defaults.plots;


%% 2. Make a line plot
%   - split by the two groups
plt.line(T.x,T.y,'split',T.split);
plt.labels('xlabel','ylabel','figure title');


%% 3. Make a line plot using a default style
%   - use predefined grayscale style defined in plt.defaults.style
style.use('graysc');
plt.line(T.x,T.y,'split',T.split);

%   - look at all available colours and create a custom style
%   - set first group in blue, second group in red
plt.defaults.colours('list');
sty = style.custom({'blue','red'},'markersize',10,'linewidth',2);
plt.line(T.x,T.y,'split',T.split,'style',sty);


%% 4. Save figure
%       - what default save sizes are available
plt.defaults.save;

%       - save using no additional paper size formatting
%       - save using Brain guidelines for a one-column figure (90mm width)
plt.save(gcf,'1-col-format.pdf','style','1col');
plt.save(gcf,'2-col-format.pdf','style','2col');





