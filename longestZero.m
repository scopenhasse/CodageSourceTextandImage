% function that finds the longest zero sequence length in a 1D array
% and returns the length of the sequence
% input: 1D array
% output: length of the longest zero sequence and the index of the first
% element in the sequence
function [seq_length] = longestZero(array)
    h = waitbar(0,'Searching for longest sequence of zeros...');
    seq_length = 0;
    previous_reported_progress = 0;
    one_percent = length(array)/100;
    for i = 1:length(array)
        if (i - previous_reported_progress) > one_percent
            waitbar(i / length(array))
            previous_reported_progress = i;
        end
        if array(i) == 0
            temp_length = 1;
            for j = i+1:length(array)
                if array(j) == 0
                    temp_length = temp_length + 1;
                else
                    break;
                end
            end
            if temp_length > seq_length
                seq_length = temp_length;
            end
        end
    end
    close(h)
end