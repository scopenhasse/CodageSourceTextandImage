% takes an image as input
% returns the original image shape and the cropped image shape and the cropped image
% check if image is a square
% if yes return the original image
% otherwise crop the image to a square in the middle and return it 

% example
% image(:,:,1) =
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
% image(:,:,2) =
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
% image(:,:,3) =
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
%    0   0   0   0   0   0   0   0   0   0
% croppedImage(:,:,1) =
%    0   0   0   0   0
%    0   0   0   0   0
%    0   0   0   0   0
%    0   0   0   0   0
%    0   0   0   0   0
% croppedImage(:,:,2) =
%    0   0   0   0   0
%    0   0   0   0   0
%    0   0   0   0   0
%    0   0   0   0   0
%    0   0   0   0   0
% croppedImage(:,:,3) =
%    0   0   0   0   0
%    0   0   0   0   0
%    0   0   0   0   0
%    0   0   0   0   0
%    0   0   0   0   0


function [originalShape, croppedShape, croppedImage]  = prepareImage(image)
    grayScaleImage = rgb2gray(image);
    originalShape = size(grayScaleImage);
    min_dimension = min(originalShape(1), originalShape(2));
    if originalShape(1) == originalShape(2)
        croppedShape = originalShape;
        croppedImage = image;
    else
        croppedShape = [min_dimension, min_dimension];
        croppedImage = imcrop(grayScaleImage, [(originalShape(2) - min_dimension)/2, (originalShape(1) - min_dimension)/2, min_dimension, min_dimension]);
    end
end