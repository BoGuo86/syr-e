
% Valutazione posizione pallini come da ECCE MOGA per calc Pfe

for i=1:nlay
    if (i==nlay)
        rfe(i)=(Ar+B1k(i))/2;
    else
        rfe(i)=(B1k(i)+B2k(i+1))/2;
    end
end

Cfe=(((rfe./rshaft).^(2*p)-1)./(rfe./rshaft).^p);

for k=1:nlay
tetaFeTraf(k)=180/p-(1/p)*asin((Cfe(k)*((xr-2*geo.pont0)/rshaft)^p)/(((xr-2*geo.pont0)/rshaft)^(2*p)-1))*180/pi; 

[xFe(k),yFe(k)]=rot_point((xr-2*geo.pont0)*cos(tetaFeTraf(k)*pi/180),(xr-2*geo.pont0)*sin(tetaFeTraf(k)*pi/180),-pi/2/p); 

end

[xFe,yFe]=rot_point((xr-2*geo.pont0)*cos(tetaFeTraf*pi/180),(xr-2*geo.pont0)*sin(tetaFeTraf*pi/180),-pi/2/p); 

% figure(200);
% plot(xo,yo,'--r','LineWidth',2); axis([0 rlim 0 rlim]); axis square
% hold on; 
% xx=(0:0.1:rlim);
% plot(xx,sqrt(rlim^2-xx.^2),'k','LineWidth',2);
% plot([0:0.1:rshaft],sqrt(rshaft^2-[0:0.1:rshaft].^2),'k','LineWidth',2);
% plot(xxB1k',yyB1k','b','LineWidth',2);plot(xxB2k',yyB2k','b','LineWidth',2);
% plot(xFe,yFe,'rs');
% plot(rfe,0,'rs');
% hold off; grid on;