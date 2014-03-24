function draw_lines_arches(Mat,gruppo,res)
% Importa_Mat(Mat,gruppo)
[nrig,ncol] = size(Mat);

for ii=1:nrig;
    if Mat(ii,ncol)==0
        mi_drawline(Mat(ii,3),Mat(ii,4),Mat(ii,1),Mat(ii,2));
        mi_selectsegment(mean([Mat(ii,1) Mat(ii,3)]),mean([Mat(ii,2) Mat(ii,4)]));
        % 21-06-2010 BB
        % La dimensione degli elementi della mesh non e' piu' impostata in
        % automatico dal programma, ma fissata in base al valore di input
        % res
        % mi_setsegmentprop('None', 0, 1, 0, gruppo);
        mi_setsegmentprop('None', res, 0, 0, gruppo);
        mi_clearselected
        mi_selectnode(Mat(ii,1),Mat(ii,2));
        mi_selectnode(Mat(ii,3),Mat(ii,4));
        mi_setnodeprop('None',gruppo);
        mi_clearselected
%         keyboard
    else
        
        [maxsegdeg,raggio,ang1,ang]=Disegna_Arco(Mat(ii,:),res);
        [x_temp,y_temp]=pol2cart((ang1+0.5*ang)*pi/180,raggio);
        x=x_temp+Mat(ii,1);
        y=y_temp+Mat(ii,2);
        % mi_selectarcsegment( Mat(ii,5)*0.01+Mat(ii,3)*0.99 , Mat(ii,6)*0.01+Mat(ii,4)*0.99 );
        % mi_setarcsegmentprop(res, 'None', 0, gruppo);
        mi_selectarcsegment(x,y);
        mi_setarcsegmentprop(maxsegdeg, 'None', 0, gruppo);
        mi_clearselected
        mi_selectnode(Mat(ii,5),Mat(ii,6));
        mi_selectnode(Mat(ii,3),Mat(ii,4));
        mi_setnodeprop('None',gruppo);
        mi_clearselected
%        keyboard
    end
end


