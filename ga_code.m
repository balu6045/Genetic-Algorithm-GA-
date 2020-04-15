
%% Jogendra Karthika Sri Sai Balaji Dulipala
% Last updated:- 15/4/2020
% contact details:- balajijogendra@gmail.com
% phone number:- 7893397808
%% Unconstrained GA with bounds

function [Xmin,Fmin]=ga_code(fun,nvars,npop,LB,UB,max_iter)
%% 
% fun       function to be optimized
% nvars     number of variables to be optimized
% npop      number of populations
% LB        Lower bounds of the problem
% UB        Upper bounds of the problem
% max_it    Maximum iterations
%%
for i=1:npop
    pop(i).chrom=LB+(UB-LB).*rand(1,nvars); %% creation of the initial population  
    pop(i).fitness=fun(pop(i).chrom);  %% creation of the initial fitness
end
%%
%%------------------start of the generations loop-------------%%
for iter=1:max_iter
c=[pop.fitness];
[~,n]=sort(c);
pop1=pop(n);
pop2=pop1;
%%
%%------------------Roulette wheel condition-----------------%%
cum_sum=cumsum((1./[pop2.fitness])/sum((1./[pop2.fitness])));
%%
%%------------------Start of the crossover and mutation loops------%%
if rand<0.8
    for i=1:npop/2  %crossover loop
        d=rand(1,2);
        [~,c1]=find(d(1)<cum_sum,1);
        [~,c2]=find(d(2)<cum_sum,1);
        d1=randi([1,nvars],1,nearest(nvars/2));
        for i1=1:length(d1)
            aa=pop2(c1).chrom(d1(i1));
            bb=pop2(c2).chrom(d1(i1));
            pop2(c1).chrom(d1(i1))=bb;
            pop2(c2).chrom(d1(i1))=aa;    
        end    
    end   
else
    for i=npop/2:npop %mutation loop
       pop2(i).chrom=LB+(UB-LB).*rand(1,nvars);
    end   
end

for i=1:npop
   pop2(i).fitness=fun(pop2(i).chrom);
end
%%
%%------------Sorting the best chromosomes from previous and current genertaions %%
c3=[pop1.fitness pop2.fitness];
[~,n1]=sort(c3);
pop3=[pop1 pop2];
pop4=pop3(n1(1:npop));
%%
pop=pop4;
best_fitness(iter)=pop(1).fitness;
disp(['Iteration: ',num2str(iter),'   Fmin= ',num2str(pop(1).fitness),]);
end
Xmin=pop(1).chrom;
Fmin=pop(1).fitness;
plot(best_fitness)
xlabel('Generations')
ylabel('Best fitness value of each generation')
title('Unconstrained GA')



