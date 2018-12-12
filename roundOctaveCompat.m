function [rounded] = roundOctaveCompat(number)
%Octave and Matlab have differing syntax relating to "round".
%Matlab expects a second parameter indicating the number of digits to round to.
%Octave does not.
%Thus, this function exists to enable compatibility between the versions.
    if exist('OCTAVE_VERSION', 'builtin') > 0
        rounded = round(number);
    else
        rounded = round(number, 0);
    end
end
