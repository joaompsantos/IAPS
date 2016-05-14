function [ sequence ] = findDTone( Table, Fa, Fb)
%findDTone Return Sequence given codification table and Tone

    
    for k=1:length(Fa)
        F1(k) = findNearFreq(Table, Fa(k), 1);
        F2(k) = findNearFreq(Table, Fb(k), 2);
    end
   
    for k=1:length(F1)
        for i=1:length(Table)
            if(Table(i).F1==F1(k) &Table(i).F2==F2(k))
                sequence(k)=Table(i).S;
            end    
        end
    end
    
end

