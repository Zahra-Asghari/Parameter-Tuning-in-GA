function [] = MyGenetic_FIS
clc;
clear;
N = 50;
Pc = 0.45;
Pm = .0075;
scale = 0.2;
ITER = 100;
K = 10;

f_num= input('Enter Function Number(1:23)');
[Lo,Hi,dim]=test_functions_boundary(f_num);
m = dim;

if f_num ~= 17
    Lo = Lo*ones(1,m);
    Hi = Hi*ones(1,m);
end


%%
total_average = [];
total_best_so_far = [];

total_average_f = [];
total_best_so_far_f = [];

for episode = 1 : 1
    episode

    best_so_far = [];
    Average_fitness = [];

    [Population] = fir_gen(N,m,Lo,Hi);
    max_f = 0;

    Average_fitness=[];
    best_f=[];
    Average_f=[];
    
    q = rand;
    
    for it = 1:ITER
        [selection_probability,fit,ave_fit,max_fit,opt_sol,max_f,ave_f,min_f] = fit_eval(Population,N,m,f_num,max_f,it);
        if it == 1
            best_f(it) = min_f;
            best_so_far(it) = max_fit;
            final_sol = opt_sol;
        elseif max_fit > best_so_far(it-1)
            best_f(it) = min_f;
            best_so_far(it) = max_fit;
            final_sol = opt_sol;
        else
            best_f(it) = best_f(it-1);
            best_so_far(it) = best_so_far(it-1);
        end

        
        Average_fitness(it) = ave_fit;
        Average_f(it) = ave_f;
        
        if(mod(it,K) == 0)
            fit_k_best = max(best_f(end-K+1:end));
            [Pm Pc] = geneticFIS(Pm,Pc,best_so_far(it),fit_k_best,it,ITER);
        end
        
        [mating_pool] = g_roulette_wheel(Population,N,selection_probability);
        [new_pop] = g_crossover(mating_pool,Pc,N,m,Hi,Lo);
        [Population] = g_mutation(new_pop,Pm,N,m,scale,Hi,Lo);
    end
    if(episode == 1)
        total_average = Average_fitness;
        total_best_so_far = best_so_far;

        total_average_f = Average_f;
        total_best_so_far_f = best_f;
    else
        total_average = total_average + Average_fitness;
        total_best_so_far = total_best_so_far + best_so_far;

        total_average_f = Average_f + total_average_f;
        total_best_so_far_f = best_f+total_best_so_far_f;
    end
end
%
total_average = total_average ./ episode;
total_best_so_far = total_best_so_far ./ episode;

Average_f = Average_f ./ episode;
best_f = best_f./episode;
%%
final_sol
best_so_far(ITER)

x =1:ITER;
figure,plot(x,best_f,'b',x,Average_f,'-r');
xlabel('Generation');
ylabel('Value Function')
legend('Best-so-far','Average value');

end
