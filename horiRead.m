% a function that takes and image (2d matrix) and return a 1d vector using horizontal reading
function [vector] = horiRead(image)
    vector = zeros(1, size(image, 2)*size(image, 1));
    for i = 1:size(image, 1)
        for j = 1:size(image, 2)
            vector((i-1)*size(image, 2)+j) = image(i, j);
        end
    end
end
