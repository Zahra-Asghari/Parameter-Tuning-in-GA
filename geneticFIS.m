function [pm pc] = geneticFIS(pm_pre,pc_pre,f_best,f_k_best,it,ITER)
comp =f_k_best/ (f_best+eps);
t=it/ITER;
fismat = readfis('myFIS2');
out = evalfis([pm_pre,pc_pre,comp,t],fismat);
pm = out(1);
pc = out(2);
end