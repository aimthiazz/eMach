function [motion] = mn_d_makeMotionComponent(mn, problemID, surfacesVolume)
%MN_D_MAKEMOTIONCOMPONENT Creates a motion component.
%   mn_d_setMotionComponent(mn, problemID, surfacesVolume)
%       
%   problemID - integer problem ID. 
%   surfacesVolume - Single string or a cell array of strings of the
%       geometry to be moved. 
%
%   Return value: a path to the motion component.
%   This is a wrapper for Document::makeMotionComponent
validateattributes(problemID, {'numeric'}, {'positive','integer'});
if iscell(surfacesVolume) 
    invoke(mn, 'processcommand', ...
        sprintf('REDIM nmArray(%i)', length(surfacesVolume)-1));
    for i = 1:length(surfacesVolume)
        invoke(mn, 'processcommand', ...
            sprintf('nmArray(%i)= "%s"', i-1, surfacesVolume{i}));
    end
else
    invoke(mn, 'processcommand', 'REDIM nmArray(0)');
    invoke(mn, 'processcommand', ...
            sprintf('nmArray(0)= "%s"', surfacesVolume));    
end

invoke(mn, 'processcommand', 'ret = getDocument.makeMotionComponent(nmArray)');

invoke(mn, 'processcommand', 'call setvariant(0, ret)');
motion = invoke(mn, 'getvariant', 0);