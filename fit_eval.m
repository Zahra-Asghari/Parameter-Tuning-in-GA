function [selection_probability,fit,ave_fit,max_fit,opt_sol,max_f,ave_f,min_f] = fit_eval(Population,N,m,f_num,max_f_pre,it)

fit_temp = evaluateF(Population,f_num);

max_f=max(fit_temp);

if(it~=1 && max_f<max_f_pre)
    max_f=max_f_pre;
end
fit=max_f-fit_temp;
selection_probability=fit / sum(fit);

ave_fit=mean(fit);
[max_fit,max_loc]=max(fit);
opt_sol=Population(max_loc,:);

ave_f=mean(fit_temp);
[min_f notUsed]=min(fit_temp);

end

