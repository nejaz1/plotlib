function varargout = save(journal,preset)
%% Description
%   Presets defined for saving image to disk
%   Preset is named as MxN, with M rows and N columns
%   WARNING: changing values here will change default behaviour for plots
%   where no style is provided
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Get current defaults
journalfile = sprintf('plt.defaults.journalstyles.%s',journal);
preset_name = {'1x1',...                                % one column styles
               '0.5x2','0.75x2','1x2','2x2','3x2'};     % two column styles 
           
%% Check input
if nargin==1
    fprintf('\nPresets for %s journal\n-------------------------\n',journal);    
%     fprintf('\n%s presets:\n-------------\n',journal);    
    for i=1:length(preset_name)
        preset_val = fcneval(journalfile,preset_name{i});
        fprintf('%d\t%s\t\t%1.2fcm x %1.2fcm\n',i,preset_name{i},...
                                                         preset_val(4),preset_val(3));
    end;
elseif nargin==2
    opt.journal         = journal;    
    opt.style           = preset;
    opt.paperposition   = fcneval(journalfile,preset);
    varargout           = {opt};
else 
    varargout = {[]};
end;
