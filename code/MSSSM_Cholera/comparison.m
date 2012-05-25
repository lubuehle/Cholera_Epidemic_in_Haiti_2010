% Loading the PHIp values
phip0 = fopen('phip_semikolon.csv','r');
phip1 = fopen('Phip_data.csv','w');
fwrite(phip1,strrep(char(fread(phip0))',';',','));
fclose(phip0);
fclose(phip1);

phip = csvread('Phip_data.csv');

t=92;


lambdamatrice=ones(10,92);

phipmatrice=ones(10,92);



kappa = 7.5279e-12;


gamma =3.8816;


betax =3.9114;








for p=2:t
    
    
    lambda = betax .* x(:,p-1) + (kappa*phip)*x(:,p-1);
    
    lambdamatrice(:,p-1)=lambda;
    
    phipmatrice(:,p-1)=(kappa*phip)*x(:,p-1);
   
    [s(:,p),x(:,p), r(:,p)]=euler(s(:,p-1),x(:,p-1),r(:,p-1), lambda, gamma);
    
    
    
    
    
   
end




%Preparing the colors for the plots with all ten districts displayed
mod_cols=[  1   0   0
            0   1   0
            0   0   1
            1   1   0
            0   1   1
            1   0   1
            0.5 0   0
            0   0.5 0
            0   0   0.5
            0   0   0
                        ];




%Plotting all ten districts of the infectious data
figure(1)
for o=1:10
    plot(lambdamatrice(o,1:91),'Color',mod_cols(o,:),'LineStyle','-')
    hold on
end
xlabel('Time')
ylabel('Lambda')
legend('Artibonite', 'Centre', 'Grand Anse', 'Nippes','Nord', 'Nord Ouest','Nord Est','Ouest','Sud','Sud Est')
title('Lambda by districts')




%Plotting all ten districts of the infectious data
figure(2)
for o=1:10
    plot(phipmatrice(o,1:91),'Color',mod_cols(o,:),'LineStyle','-')
    hold on
end
xlabel('Time')
ylabel('Phip')
legend('Artibonite', 'Centre', 'Grand Anse', 'Nippes','Nord', 'Nord Ouest','Nord Est','Ouest','Sud','Sud Est')
title('Transmission coefficient between districts')











