%% 2013/07/05 MG Importa i file dxf di statore e di rotore e assegna
%% materiali e condizioni al contorno
% Input: viene caricato il file dxf di cui di vuole ricavare il
% corrispondente file.femm, importante � che il file dxf es motXX.dxf sia
% accompagnato da un file motXX_ParMachine.mat altrimenti il file femm dar�
% errore.
% Output: dialogBox richiedente dove scaricare il file femm generato, tale
% file femm sar� accompagnato dal file ParMachine del dxf.

clear all
close all

current_path=cd;
[pathstr, name, ext] = fileparts(current_path);

% addpath C:\Programmi\femm42\mfiles\;
% addpath('C:\Program Files (x86)\femm42\mfiles');
addpath('d:\femm42_beta\mfiles\');
addpath([pathstr,'\dxf_conv_fun\']);
addpath([pathstr,'\mfiles\']);

error_code = 0;

[filemot, pathname] = uigetfile([cd '\*m*.dxf'], 'Pick a motor');
load([pathname,filemot(1:end-4),'_ParMachine.mat']);

%% Definizione dei gruppi:
groupStat=1;
groupRot=2;
groupTraf=20;
fem=Mac.fem;
%% Definisco la fase meccanica per il momento manualmente e pari a 0 secondo la convenzione di disegno adottata da MOGA:
th_m0=0;

filename = 'mot0.fem';
% opendocument('empty_case.fem',h_temp);
openfemm;
opendocument([pathstr,'\empty_case.fem']);
mi_saveas(filename);
mi_probdef(0,'millimeters','planar',1e-8,Mac.l,25);

%% Scelta periodicit� per i boundary:
if (rem(Mac.ps,2)==0)
    Period=5;
else
    Period=4;
end
%% boundary
% A = 0 sulle superfici interna ed esterna
mi_addboundprop('A=0', 0, 0, 0, 0, 0, 0, 0, 0, 0);

% anti-periodicit� (2 x rotore + 2 x statore + 3 x airgap + AP move)
mi_addboundprop('APr1', 0, 0, 0, 0, 0, 0, 0, 0, Period);
mi_addboundprop('APr2', 0, 0, 0, 0, 0, 0, 0, 0, Period);

mi_addboundprop('APg1', 0, 0, 0, 0, 0, 0, 0, 0, Period);
mi_addboundprop('APg2', 0, 0, 0, 0, 0, 0, 0, 0, Period);
mi_addboundprop('APg3', 0, 0, 0, 0, 0, 0, 0, 0, Period);
mi_addboundprop('APmove', 0, 0, 0, 0, 0, 0, 0, 0,Period);

mi_addboundprop('APs1', 0, 0, 0, 0, 0, 0, 0, 0, Period);
mi_addboundprop('APs2', 0, 0, 0, 0, 0, 0, 0, 0, Period);

%% DXF file import;
mi_readdxf([pathname,filemot]);

%% Assign rotor block property 
assign_block_prop_rot(BLKLABELS,fem,2);
% boundary conditions
BLKLABELSrot=BLKLABELS.rotore;
for ii=1:2
    mi_selectsegment(BLKLABELSrot.boundary(ii,1),BLKLABELSrot.boundary(ii,2));
    if (BLKLABELSrot.boundary(ii,3)==10)
        mi_setsegmentprop('APr1', 0, 1, 0, 2);
        mi_clearselected;
    elseif(BLKLABELSrot.boundary(ii,3)==0)
        mi_selectarcsegment(BLKLABELSrot.boundary(ii,1),BLKLABELSrot.boundary(ii,2))
        mi_setarcsegmentprop(fem.res, 'A=0', 0, 2);
        mi_clearselected;
    end
end
% Condizioni al contorno di rotore ferro lamierino
for ii=3:4
    
    mi_selectsegment(BLKLABELSrot.boundary(ii,1),BLKLABELSrot.boundary(ii,2));
    if (BLKLABELSrot.boundary(ii,3)==10)
        mi_setsegmentprop('APr2', 0, 1, 0, 2);
        mi_clearselected;
    elseif(BLKLABELSrot.boundary(ii,3)==0)
        mi_selectarcsegment(BLKLABELSrot.boundary(ii,1),BLKLABELSrot.boundary(ii,2))
        mi_setarcsegmentprop(fem.res, 'A=0', 0, 2);
        mi_clearselected;
    end
end

%% Assign stator block property
assign_block_prop_stat(BLKLABELS,Mac,fem,1) % assegna materiali;
% boundary conditions
BLKLABELSstat=BLKLABELS.statore;
for ii=1:size(BLKLABELSstat.boundary,1)
    
    mi_selectsegment(BLKLABELSstat.boundary(ii,1),BLKLABELSstat.boundary(ii,2));
    if (BLKLABELSstat.boundary(ii,3)==10)
        mi_setsegmentprop('APs1', 0, 1, 0, 1);
        mi_clearselected;
    elseif(BLKLABELSstat.boundary(ii,3)==0)
        mi_selectarcsegment(BLKLABELSstat.boundary(ii,1),BLKLABELSstat.boundary(ii,2));
        mi_setarcsegmentprop(fem.res, 'A=0', 0, 1);
        mi_clearselected;
    end
end

%% Airgap
pc=360/(Mac.Q)/2;        % half stator slot
Mac.xr=Mac.RtS-Mac.g;    % rotor airgap radius
AirGapBuild(Mac.Qs,Mac.ps,Mac.p,Mac.g,pc,Mac.xr,fem.res_traf,1,2);
Mac.ns=Mac.Q/Mac.p;
draw_airgap_arc_with_mesh(Mac,th_m0,fem);

%% Save file...
[FileName,PathName,FilterIndex] = uiputfile('*.fem','Save motor in',[pathname,filemot(1:end-4)]);
mi_saveas([PathName,FileName(1:end-4),'.fem']);
closefemm;

copyfile([pathname,filemot(1:end-4),'_ParMachine.mat'],[PathName,FileName(1:end-4),'_ParMachine.mat']);
copyfile([pathname,filemot(1:end-4),'.mat'],[PathName,FileName(1:end-4),'.mat']);
