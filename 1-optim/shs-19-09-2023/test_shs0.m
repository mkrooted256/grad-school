# задача Sabs $x^* = argmin f_1(x) = \sum_{i=1,..n}a_i|x - b_i|$, 
# задача Squad $x^* = argmin f_2(x) = \sum_{i=1,..n}a_i^2(x - b_i)^2$, 

global a b; 
n = 2; 
a = [1 2] ; b = [1 1]; 
a, b, 

#n = 100; 
#a = 1.0*ones(1,n) + 10.9*rand(1,n);  
#b = round(5*rand(1,n));  

n, amax = max(a), amin = min(a),
fmin = 0.d0, 

# масив для значень функції по ітераціях (для графіків)   
global f_itn; 
f_itn = [];  

# знайти мінімум функції f_1(x) узагальненим градієнтним спуском 
# з регулюванням кроку  h_k = h_0/(k+1), k = 0,1,...,maxitn 
f_itn = [];  
x0 = zeros(n,1); h0 = 5.0*norm(x0-b'), epsg = 1.d-5; maxitn = 500, intp = 50,   
[xr,fr,itr,ist] = shs0(@fg_sabs,x0,h0,epsg,maxitn,intp);
#xr_t = xr',fr,itr,ist

# підготувати інформацію для двох графіків (функція, рекорд)/ітерації
ncols1 = columns(f_itn), 
f1a_itn = f_itn; f2a_itn = []; f_rec = inf; 
for i = 1:ncols1 
   if f_itn(1,i) < f_rec 
      f_rec = f_itn(1,i); 
   endif
   f2a_itn = [f2a_itn f_rec];  
endfor 
f_rec, 
f1a_itn = f1a_itn - fmin*ones(1,ncols1); 
f2a_itn = f2a_itn - fmin*ones(1,ncols1); 

# знайти мінімум функції f_2(x) узагальненим градієнтним спуском 
# з регулюванням кроку  h_k = h_0/(k+1), k = 0,1,...,maxitn 
f_itn = [];  
x0 = zeros(n,1); h0 = 5.0*norm(x0-b'), epsg = 1.d-5; maxitn = 500, intp = 50,   
[xr,fr,itr,ist] = shs0(@fg_squad,x0,h0,epsg,maxitn,intp);
#xr_t = xr',fr,itr,ist

# підготувати інформацію для двох графіків (функція, рекорд)/ітерації
ncols2 = columns(f_itn), 
f1b_itn = f_itn; f2b_itn = []; f_rec = inf; 
for i = 1:ncols2 
   if f_itn(1,i) < f_rec 
      f_rec = f_itn(1,i); 
   endif
   f2b_itn = [f2b_itn f_rec];  
endfor 
f_rec, 
f1b_itn = f1b_itn - fmin*ones(1,ncols2); 
f2b_itn = f2b_itn - fmin*ones(1,ncols2); 

# нарисувати два графіки в логарифмічній шкалі
clf; #hold on; 
#hfig2 = figure; figure(hfig2);   

subplot(2,1,1); 
hold on;
plot (0:ncols1-1, log10(f1a_itn),'b'); 
plot (0:ncols1-1, log10(f2a_itn),'g'); 
title(' Субградієнтний метод з класичним регулюванням кроку (sabs)');
grid('on'); 

subplot(2,1,2); 
hold on; 
plot (0:ncols2-1, log10(f1b_itn),'b'); 
plot (0:ncols2-1, log10(f2b_itn),'g'); 
title(' Субградієнтний метод з класичним регулюванням кроку (squad)');
grid('on'); 
 
#hold off; 

print -dpng shs0.png
pause 