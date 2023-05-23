% a function that takes and image (2d matrix) and return a 1d vector using zigzag reading
function [vector] = zigzagRead(image)
    N = size(image, 1);
    vector = [];
    should_flip = 0;
    for i = (N-1):-1:(1-N)
        diagonal_vector = fliplr(diag(fliplr(image), i)');
        if (should_flip)
            diagonal_vector = fliplr(diagonal_vector);
        end
        vector = [vector diagonal_vector];
        should_flip = ~should_flip;
    end
end
