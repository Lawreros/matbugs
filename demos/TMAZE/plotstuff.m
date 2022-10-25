
data =[];pdata =[]; pdum =[];
c=0;
no_trials = size(I,2);
J         = size(I,1);


figure

%get the median and 90%cls from the samples files
for i = 1:J
    for t = 1:no_trials
        allpsamples = [samples.finalpn(1,:,i,t) samples.finalpn(2,:,i,t) samples.finalpn(3,:,i,t)];
        sort_samples = sort(allpsamples);
        total        = length(sort_samples);
        ll           = sort_samples(fix(0.05*total));
        ml           = sort_samples(fix(0.5*total));
        ul           = sort_samples(fix(0.95*total));
        pdata = [pdata; t ll ml ul];
        pdum = [pdum; t ll ml ul];
    end
    
    t = pdum(:,1)';
    subplot(J+1,1,i); %plot(pdum(:,1), pdum(:,2),'r'); 
    xx1   = [ t fliplr(t)];
    yy1   = [pdum(1:end,2)' fliplr(pdum(1:end,4)')];
    h     = fill(xx1, yy1, [0.7 0.8 0.8]);
    hold on;
    set(h, 'EdgeColor',[ 0.6 0.7 0.7]);
    line([1 no_trials],[0.5 0.5]); hold on;
    subplot(J+1,1,i); plot(pdum(:,1), pdum(:,3),'r'); 
    line([1 no_trials],[0.5 0.5]); hold on;
    subplot(J+1,1,i); % plot(pdum(:,1), pdum(:,4),'r'); 
    line([1 no_trials],[0.5 0.5]); hold on;
    subplot(J+1,1,i); plot(stats.mean.p(i,:),'g');
    pdum =[];
    
end

subplot(J+1,1,3); 
 title('Bias estimate (negative means late response)');

pdatax =[]; hold on; line([1 no_trials],[0.0 0.0]); 
for t = 1:no_trials
        allpsamples = [samples.xb(1,:,t) samples.xb(2,:,t) samples.xb(3,:,t)];
        sort_samples = sort(allpsamples);
        total        = length(sort_samples);
        ll           = sort_samples(fix(0.05*total));
        ml           = sort_samples(fix(0.5*total));
        ul           = sort_samples(fix(0.95*total));
        pdatax = [pdatax; t ll ml ul];
end
plot(pdatax(:,1), pdatax(:,2),'k'); hold on;
plot(pdatax(:,1), pdatax(:,3),'k'); hold on;
plot(pdatax(:,1), pdatax(:,4),'k'); hold on;
axis tight; box on;


plotI(I,J+1,1,1,0.03)

plotIle(le,J+1,1,1,0.10)


TOOBIGp  = find(stats.Rhat.p > 1.2);
TOOBIGx  = find(stats.Rhat.x > 1.2);
TOOBIGxb  = find(stats.Rhat.xb > 1.2);


fprintf('Checking for MC convergence using Rhat. \n Rhats above 1.2 are shown below...  \n')


if(~isempty(TOOBIGx)) 
     fprintf('WARNING: Monte Carlo convergence for x is not great.\n')
     fprintf('Largest value of x is %f \n', max(stats.Rhat.x(TOOBIGx)) )
end

if(~isempty(TOOBIGp)) 
     fprintf('WARNING: Monte Carlo convergence for p is poor.\n')
     fprintf('Largest value of p is %f \n', max(stats.Rhat.p(TOOBIGp) ) )
end

if(~isempty(TOOBIGxb) )
     fprintf('WARNING: Monte Carlo convergence for x is not great.\n')
     fprintf('Largest value of xb is %f \n', max(stats.Rhat.xb(TOOBIGxb)) )
end

if(isempty(TOOBIGxb) && isempty(TOOBIGp) && isempty(TOOBIGx))
     fprintf('Convergence seems OK. \n')
end






