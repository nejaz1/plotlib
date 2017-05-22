function varargout = brain(preset)
%% Description
%   Presets defined for Brain 
%
% Author
%   Naveed Ejaz (ejaz.naveed@gmail.com)

%% 0. Define presets
switch(preset)
    case '1x1'
        preset_val  = [0 0 9 9];
    case '0.5x2'
        preset_val  = [0 0 18.5 4.5];    
    case '0.75x2'
        preset_val  = [0 0 18.5 6.75];    
    case '1x2'
        preset_val  = [0 0 18.5 9];    
    case '2x2'
        preset_val  = [0 0 18.5 18];                    
    case '3x2'
        preset_val  = [0 0 18.5 27];    
end;
varargout = {preset_val};
