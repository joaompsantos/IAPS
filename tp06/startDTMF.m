function [DTMF] = startDTMF()
%startDTMF Summary of this function goes here
%   Detailed explanation goes here
    % Idx  % Symbol %
% 1    %   1    % 
% 2    %   2    %
% 3    %   3    %
% 4    %   4    %
% 5    %   5    %
% 6    %   6    %
% 7    %   7    %
% 8    %   8    %
% 9    %   9    % 
% 10   %   0    %
% 11   %   A    %
% 12   %   B    %
% 13   %   C    %
% 14   %   D    %
% 15   %   *    %
% 16   %   #    %

DTMF(1).S='1';
DTMF(1).F1=697;
DTMF(1).F2=1209;

DTMF(2).S='2';
DTMF(2).F1=697;
DTMF(2).F2=1336;

DTMF(3).S='3';
DTMF(3).F1=697;
DTMF(3).F2=1477;

DTMF(4).S='4';
DTMF(4).F1=770;
DTMF(4).F2=1209;

DTMF(5).S='5';
DTMF(5).F1=770;
DTMF(5).F2=1336;

DTMF(6).S='6';
DTMF(6).F1=770;
DTMF(6).F2=1477;

DTMF(7).S='7';
DTMF(7).F1=852;
DTMF(7).F2=1209;

DTMF(8).S='8';
DTMF(8).F1=852;
DTMF(8).F2=1336;

DTMF(9).S='9';
DTMF(9).F1=852;
DTMF(9).F2=1477;

DTMF(10).S='0';
DTMF(10).F1=941;
DTMF(10).F2=1336;

DTMF(11).S='A';
DTMF(11).F1=697;
DTMF(11).F2=1633;

DTMF(12).S= 'B';
DTMF(12).F1=770;
DTMF(12).F2=1663;

DTMF(13).S='C';
DTMF(13).F1=852;
DTMF(13).F2=1633;

DTMF(14).S='D';
DTMF(14).F1=941;
DTMF(14).F2=1633;

DTMF(15).S='*';
DTMF(15).F1=941;
DTMF(15).F2=1209;

DTMF(16).S='#';
DTMF(16).F1=941;
DTMF(16).F2=1477;

end

