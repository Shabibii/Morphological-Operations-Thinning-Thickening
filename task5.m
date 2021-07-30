%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:        Thinning and thickening
% Author:       Samir Habibi
% Rev. Date:    24/11/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; % Delete all variables.
close all; % Close all windows.
clc; % Clear command window.

% Ask user for file by presenting options with menu() command.
fileChoice = menu('File', 'Letter J', 'Rice', 'Choose own');

% Use switch() to read file based on user's choice (fileChoice).
switch (fileChoice)
    case 1
        filename = ('j.png');
        L = imread(filename);
    case 2
        filename = ('rice.jpg');
        L = imread(filename);
    case 3
        filename = uigetfile('');
        L = imread(filename);
end % End the switch-statement after obtaining image.

% Call function to inspect image for multiple colour bands, if so, convert
% to grey. The image L is used for the input argument.
L = inspectFileDimension(L);

% Call function to binarize an image before performing morphological
% operations, even if image is already binary because it would not change.
% The image L is used again for the input argument.
L_binarized = binarizeImage(L);

% Use function bwmorph() to perform morphological operations (thinning and
% thicken) on binarized version of image L.
% 'n' is specified to 5 for thickening, and to Inf for thinning.
L_thick = bwmorph(L_binarized, 'thicken', 5);
L_thin = bwmorph(L_binarized, 'thin', Inf);

% Display three images in one figure: original/binary version,
% and version after thinning and thickening.
figure;
subplot(1, 3, 1);
imshow(L_binarized);
title('Original image');

subplot(1, 3, 2);
imshow(L_thin);
title('After thinning');

subplot(1, 3, 3);
imshow(L_thick)
title('After thickening');
