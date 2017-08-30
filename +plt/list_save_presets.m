function varargout = list_save_presets(journal)
%% Description
%   List predefined presets for saving images.
%   Presets are different for each journal.
%   
% VARARGIN:
%   'journal': 'string specifying name of journal to list presets for
%              If journal input is not provided, function lists presets for
%              the default journal
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

if nargin<1
    sty     = style.get;
    journal = sty.save.journal;
end;
    
plt.defaults.save(journal);
