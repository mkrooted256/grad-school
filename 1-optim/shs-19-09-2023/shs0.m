# Input parameters:
# calcfg - name of the function for calculation of f and g
# x0 - starting point, x0(1:n)
# h0 - initial step for h_k = h_0/(k+1), k = 0,1,...,maxitn
# epsg, maxitn - stop parameters (norm(g),  max. iter.)
# intp - printing interval (after each intp iterations)
# Output parameters:
# xr - record for approximation of the minimum point, x(1:n)
# fr - record value of function f at the point x
# itr - number of record iteration 
# ist - exit code (4 = maxitn, 2 - epsg)
function [xr,fr,itr,ist] = shs0(calcfg,x0,h0,            #row01
                                epsg,maxitn,intp)        #.....
x = x0; fr = inf;                                        #row02
for itn = 0:maxitn                                       #row03
   [f, g] = calcfg(x); dg = norm(g);                     #row04
   if(f < fr) fr = f; xr = x; itr = itn; endif           #row05
   if(dg < epsg) ist = 2;  return; endif                 #row06
   if((mod(itn,intp)==0)&&(intp<=maxitn))                #row07
      printf(" itn %4d  f %21.13e  fr %21.13e\n",        #row07
                          itn,f,fr)                      #.....
#      printf(" itn %4d f %17.14f fr %17.14f\n",itn,f,fr);#row07
   endif                                                 #row07
   xi = (1.e0/dg)*g;                                     #row08
   hs = h0/(itn+1);                                      #row09  
   x -= hs * xi;                                         #row10
endfor                                                   #row11
ist = 4;                                                 #row12
endfunction                                              #row13
