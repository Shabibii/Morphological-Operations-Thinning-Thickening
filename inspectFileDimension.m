function L = inspectFileDimension(L)
%INSPECTFILEDIMENSION Check if image is RGB, if yes, convert to greyscale.
%   This function takes an image as the input argument and assigns values
%   to rows, colums and number of dimensions in the image to decide if it's
%   an RGB type image. If so, converts the image to greyscale with
%   im2gray(). If not, do nothing and return.

% Get the dimensions of the image.
% numberOfColorChannels should be = 1 for grey.
[~, ~, numberOfColorChannels] = size(L);
if numberOfColorChannels > 1
    % It's not greyscale like we expected, it's color (RGB).
    % Convert it to greyscale by using im2gray().
    L = im2gray(L);
end % end after checking color channels


return % Return to main, if change is made or not.

end

