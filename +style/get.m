function varargout = get
%% Description
%   Gets the current style selected for plotting
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Get active selected style
%       - either select default style if not is selected
%       - select user-selected style
[styID,fName]   = style.use;
if strcmp(fName,'$DEFAULT$')
    if strcmp(styID,'$DEFAULT$')
        [colours,opt]   = plt.defaults.style('default');
    else
        [colours,opt]   = plt.defaults.style(styID);
    end;
else
    [~,fname]       = fileparts(fName);
    fcn             = str2func(fname);
    [colours,opt]   = feval(fcn,styID);
end;

%% 1. Parse input from style and generate parameters used for plotting
%       - figure out calling function
%       - select user-selected style
%       - get general 
c       = plt.defaults.colours(colours);
defOpt  = plt.defaults.general(c);
opt     = plt.helper.updateUserOptions(defOpt,opt);

%       - for speed, look over the calling function stack and only get
%       plotting parameters for the calling function (otherwise return all)
p   = plt.defaults.plots;
for i=1:length(p)
    opt = addstruct(opt,plt.defaults.(p{i}));
end;
varargout = {opt};
