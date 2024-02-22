function [Population]=g_mutation(new_pop,Pm,N,m,scale,Hi,Lo)
DR = Hi - Lo;
sigma = DR * scale;
Delta = zeros(N,m);
for j =1: m
    Delta(:,j) = sigma(j)*randn(N,1);
end
mask = rand(N,m) <= Pm;
Population = new_pop + (mask.* Delta);
for i = 1:N
    for j = 1: m 
        if Population(i,j) > Hi(j)| Population(i,j) < Lo(j)
            Population(i,j) = Lo(j) + (Hi(j) - Lo(j))* rand;
        end
    end
end
return;