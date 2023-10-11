function [f,g] = fg_sabs(x)
global a b;
global f_itn;
f = a*abs(x - b');
g = a'.*sign(x - b');
f_itn = [f_itn f]; 
endfunction