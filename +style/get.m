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
if strcmp(fName,'default')
    [canvas,colours,opt]   = plt.defaults.style(styID);
else
    [fDir,fname]    = fileparts(fName);
    fcn             = str2func(fname);
    
    oldDir = pwd;
    cd(fDir);
    [canvas,colours,opt]   = feval(fcn,styID);
    cd(oldDir);    
end;

%% 1. Parse input from style and generate parameters used for plotting
%       - get canvas style & plotting colours
%       - add plotting parameters for individual plots
defOpt      = plt.defaults.general(canvas,colours);
opt         = plt.helper.updateUserOptions(defOpt,opt);
opt         = addstruct(opt,plt.defaults.plots);

varargout = {opt};
