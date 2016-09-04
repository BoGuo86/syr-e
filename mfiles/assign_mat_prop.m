function [mat] = assign_mat_prop(dataSet)

mat.MatList=[];

%% stator iron
tmp = material_properties_iron(dataSet.StatorMaterial);
if ~isfield(tmp,'kgm3')
    error('Select a correct stator iron material')
end
mat.Stator.kgm3 = tmp.kgm3;
mat.Stator.alpha = tmp.alpha;
mat.Stator.beta = tmp.beta;
mat.Stator.kh = tmp.kh;
mat.Stator.ke = tmp.ke;
mat.Stator.BH = tmp.BH;
mat.Stator.MatName = tmp.MatName;
% mat.mu = tmp.mu;
mat.MatList.iron = tmp.MatList;

%% rotor iron
tmp = material_properties_iron(dataSet.RotorMaterial);
if ~isfield(tmp,'kgm3')
    error('Select a correct rotor iron material')
end
mat.Rotor.sigma_max = tmp.sigma_max;
mat.Rotor.kgm3 = tmp.kgm3;
mat.Rotor.alpha = tmp.alpha;
mat.Rotor.beta = tmp.beta;
mat.Rotor.kh = tmp.kh;
mat.Rotor.ke = tmp.ke;
mat.Rotor.BH = tmp.BH;
mat.Rotor.MatName = tmp.MatName;
% mat.mu = tmp.mu;

%% slot conductor
tmp = material_properties_conductor(dataSet.SlotMaterial);
if ~isfield(tmp,'kgm3')
    error('Select a correct statot conductor material')
end
mat.SlotCond.sigma = tmp.sigma;
mat.SlotCond.kgm3 = tmp.kgm3;
mat.SlotCond.MatName = tmp.MatName;
mat.MatList.conductor = tmp.MatList;

%% slot air

mat.SlotAir.kgm3 = 3;
mat.SlotAir.sigma = 0;
mat.SlotAir.MatName = 'Air';

%% rotor PM
tmp = material_properties_layer(dataSet.FluxBarrierMaterial);
if ~isfield(tmp,'kgm3')
    error('Select a correct barrier material')
end
mat.LayerMag.kgm3 = tmp.kgm3;
mat.LayerMag.Br = tmp.Br;
mat.LayerMag.Hc = tmp.Hc;
mat.LayerMag.mu = tmp.mu;
mat.LayerMag.MatName = tmp.MatName;
mat.MatList.barrier = tmp.MatList;

%% rotor air
tmp = material_properties_layer('Air');
mat.LayerAir.kgm3 = tmp.kgm3;
mat.LayerAir.Br = tmp.Br;
mat.LayerAir.Hc = tmp.Hc;
mat.LayerAir.mu = tmp.mu;
mat.LayerAir.MatName = 'Air';
%% shaft
tmp = material_properties_iron(dataSet.ShaftMaterial);
if ~isfield(tmp,'kgm3')
    error('Select a correct shaft material')
end
mat.Shaft.kgm3 = tmp.kgm3;
mat.Shaft.alpha = tmp.alpha;
mat.Shaft.beta = tmp.beta;
mat.Shaft.kh = tmp.kh;
mat.Shaft.ke = tmp.ke;
mat.Shaft.BH = tmp.BH;
mat.Shaft.MatName = tmp.MatName;
