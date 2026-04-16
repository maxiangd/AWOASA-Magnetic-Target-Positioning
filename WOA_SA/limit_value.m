function val = limit_value(val, low, high)
    if val > high, val = high; elseif val < low, val = low;
    end
end