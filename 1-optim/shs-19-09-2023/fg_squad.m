function [f,g] = fg_squad(x)
global a b;
global f_itn;
f = ((a.*a)'.*(x - b'))'*(x - b');
g = 2*((a'.*a').*(x - b')); 
f_itn = [f_itn f]; 
endfunction