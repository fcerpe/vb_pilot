function out = getLettersCoord(in_str)
%GET LETTERS COORD From a given word, return coordinates for letters
%   Function needed fro box presentation of words and non-words (only
%   french) 

load('input\stimuli_post_selection.mat','stimuli');
o = struct;

o.maxL = stimuli.boxPresentation.max_absolute;

if any(matches(stimuli.boxPresentation.words.string(:),in_str)) % string is present in words
    word = stimuli.boxPresentation.words(stimuli.boxPresentation.words.string == in_str,:);
else
    word = stimuli.boxPresentation.nonwords(stimuli.boxPresentation.nonwords.string == in_str,:); % Given our stimuli, if it's not word, is non-word
end

chArr = char(split(in_str,''));
o.chArr = chArr(2:length(chArr)-1); %removes first and last empty chars

% Save single letters, to simplify code later
o.l1 = stimuli.boxPresentation.letters(stimuli.boxPresentation.letters.char == o.chArr(1),:);
o.l1.char = char(o.l1.char);
o.l2 = stimuli.boxPresentation.letters(stimuli.boxPresentation.letters.char == o.chArr(2),:);
o.l2.char = char(o.l2.char);
o.l3 = stimuli.boxPresentation.letters(stimuli.boxPresentation.letters.char == o.chArr(3),:);
o.l3.char = char(o.l3.char);
o.l4 = stimuli.boxPresentation.letters(stimuli.boxPresentation.letters.char == o.chArr(4),:);
o.l4.char = char(o.l4.char);
o.l5 = stimuli.boxPresentation.letters(stimuli.boxPresentation.letters.char == o.chArr(5),:);
o.l5.char = char(o.l5.char);
o.l6 = stimuli.boxPresentation.letters(stimuli.boxPresentation.letters.char == o.chArr(6),:);
o.l6.char = char(o.l6.char);

% Screen corrdinates
o.wX = 1920; % cfg.screen;
o.wY = 1080; % cfg.screen;

% X and Y positions for every letter
o.x1 = o.wX/2 - (o.maxL/2) - o.l1.coord{1}(1);  o.y1 = o.wY/2 - o.l1.coord{1}(2) +13; % 26 is height of a letter without 'extensions'
o.x2 = o.x1 + o.l1.length + word.spaceLength;   o.y2 = o.wY/2 - o.l2.coord{1}(2) +13;
o.x3 = o.x2 + o.l2.length + word.spaceLength;   o.y3 = o.wY/2 - o.l3.coord{1}(2) +13;
o.x4 = o.x3 + o.l3.length + word.spaceLength;   o.y4 = o.wY/2 - o.l4.coord{1}(2) +13;
o.x5 = o.x4 + o.l4.length + word.spaceLength;   o.y5 = o.wY/2 - o.l5.coord{1}(2) +13;
o.x6 = o.x5 + o.l5.length + word.spaceLength;   o.y6 = o.wY/2 - o.l6.coord{1}(2) +13;

% Total length in px, just to check that max is 212 (+-1)
o.pixelL = (o.x6 + o.l6.length) - o.x1;

o.word = word;
o.alphabet = 'f';

out = o;

end

