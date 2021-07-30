function L_binarized = binarizeImage(L)
%BINARIZEIMAGE Binarize an image.
%   This function performs binarisation of an image by requesting a
%   threshold value from the user.

% Request valid threshold value from user.
T = input('Enter threshold value for binarization: ');

% While input is not valid, keep asking user.
while (T < 0) || (T > 255) % Limits.
    T = input('Enter number between 1 and 255: ');
end % End if correct value for threshold is entered.

% Create binarized version of the image.
L_binarized = L>=T; % Use thresholding value to convert to binary.
% Same result as imbinarize();

end

