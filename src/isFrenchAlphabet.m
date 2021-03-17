function out_bool = isFrenchAlphabet(in_str)
% IS FRENCH ALPHABET? Returns true / false whether the first letter is from the regular letters ascii codes 
%   Used to differentiate braille stimuli from french ones. The latter need
%   the boxed presentation, the former don't

char_array = char(split(in_str,''));
char_array = char_array(2:length(char_array)-1); %removes first and last empty chars

% The least accurate possible, but works. All unicodes for Braille are
% 10000+
if double(char_array(1)) < 9000
    out_bool = true;
else
    out_bool = false;

end

