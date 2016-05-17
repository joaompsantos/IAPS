function [ Fo ] = findNearFreq( Table, Fi, flag)
%findNearFreq Find closest match with the given frequency
min = 10000000000;

if (flag==1)
    for i = 1:length(Table)
        d = abs(Fi-Table(i).F1);
        if (d<min)
            min = d;
            Fo = Table(i).F1;
        end    
    end
else
    for i = 1:length(Table)
        d = abs(Fi-Table(i).F2);
        if (d<min)
            min = d;
            Fo = Table(i).F2;
        end    
    end
    
end

end

