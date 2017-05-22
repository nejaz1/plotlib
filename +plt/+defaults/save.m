function varargout = save(preset)
%% Description
%   Presets defined for saving image to disk
%   Preset is named as MxN, with M rows and N columns
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Get current defaults
sty = style.get;
journalfile = sprintf('plt.defaults.journalstyles.%s',sty.save.journal);


preset_name = {'1x1',...                                % one column styles
               '0.5x2','0.75x2','1x2','2x2','3x2'};     % two column styles 

%% Check input
if nargin==0
    fprintf('\nSave presets:\n-------------\n');
    
    for i=1:length(preset_name)
        preset_val = fcneval(journalfile,preset_name{i});
        fprintf('%d.\t%s, \t%1.2fcm x %1.2fcm\n',i,preset_name{i},...
                                                         preset_val(4),preset_val(3));
    end;
    opt = [];
else
    opt = sty;
    opt.save.preset = preset;
    opt.save.paperposition = fcneval(journalfile,preset);
end;

if nargout>0
    varargout   = {opt};
end;
