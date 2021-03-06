function [ output ] = copyshift( input, shift_vals )
% Avoiding circshift in the refocusing algorithm
%  

output = circshift(input, shift_vals);

shift_val = shift_vals(1);
if shift_val < 0
    shift_val = -shift_val;
    output(size(output,1)-shift_val+1:end,:) = repmat(output(size(output,1)-shift_val,:),[shift_val,1]);
else
    shift_val = shift_val + 1;
    output(1:shift_val,:) = repmat(output(shift_val,:),[shift_val,1]);
end

shift_val = shift_vals(2);
if shift_val < 0
    shift_val = -shift_val;
    output(:,size(output,2)-shift_val+1:end) = repmat(output(:,size(output,2)-shift_val),[1,shift_val]);
else
    shift_val = shift_val + 1;
    output(:,1:shift_val) = repmat(output(:,shift_val),[1,shift_val]);
end

end

