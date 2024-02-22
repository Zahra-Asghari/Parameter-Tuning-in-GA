function   fit=evaluateF(loc,F_num)
% [dim,mass_num]=size(loc);
[mass_num , dim]=size(loc);
for i=1:mass_num 
%     L=loc(:,i)';
    L=loc(i,:);
    fit(i)=test_functions(L,F_num,dim);
end