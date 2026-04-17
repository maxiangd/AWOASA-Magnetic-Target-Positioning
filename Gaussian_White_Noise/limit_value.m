function P=limit_value(P,low,upper)
% if P<low
%     P=low;
% end
% if P>upper
%     P=upper;
% end
% if P<=upper && P>=low
%     P=P;
% end
if P<low
    P=low;
elseif P>upper
    P=upper;
elseif P<=upper && P>=low
    P=P;
end