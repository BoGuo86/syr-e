function [cost] = FEMMfitness(RQ)

RQ=RQ';

geo.pathname=cd;
data0;                            

global eval_type options_global
% tipo_cost 

options_global.iteration=0;
options_global.currentgen=1;
options_global.PopulationSize=1;

if strcmp(eval_type,'MO_OA')
    options_global.iteration=options_global.iteration+1;
    iteration=options_global.iteration;
    pop=options_global.PopulationSize;
    generation=floor(iteration/pop)+1;
    options_global.currentgen=generation;
end

p = geo.p;                      % paia poli
nlay = geo.nlay;                % numero delle barriere

% transform the 
% note: the vector of the inputs RQ contains
% RQ(1) = dalpha(1) [mec deg]
% RQ(2) = dalpha(2) [p.u.]
% ...
% RQ(nlay) = dalpha(nlay); [p.u.]


% RQ(end) = gamma

first_index = 2;
last_index = first_index + nlay - 1;

dalpha_pu = RQ(first_index:last_index);

% if the sum of the pu angles is too large, it is scaled down     
if sum(dalpha_pu) > 1
    dalpha_pu = dalpha_pu/sum(dalpha_pu);
end

% dalpha(2) to dalpha(nlay) in degrees 
dalpha_temp = dalpha_pu * (90/p - RQ(1));
% all dalpha in mec degrees
geo.dalpha = [RQ(1) dalpha_temp(1:end-1)];

% SPESSORE DELLE BARRIERE: 'hc_pu'
first_index = last_index + 1;
last_index = first_index + nlay - 1;

geo.hc_pu = RQ(first_index:last_index);
% convert dalpha and hc_pu to alpha and hc
geo = calc_alpha_hc_delta_x0_2(geo);

if (strcmp(geo.RotType,'3U'))
    first_index = last_index + 1;
    last_index=first_index;
    geo.Delta_X=RQ(first_index:last_index);
elseif (strcmp(geo.RotType,'Fluid'))
    first_index = last_index + 1;
    last_index = first_index + nlay - 1;
    geo.Dfe=RQ(first_index:last_index);
end
% current phase angle
gamma = RQ(end);

openfemm
draw_motor_in_FEMM
save geo_mot_temp      
% current amplitude used for the simulations
io = per.overload*calc_io(geo,per);
geo.io=io;
% current value use for FEMM simulation, only 1 turns is set in femm
io_femm=io*geo.Nbob;
% evaluates the candidate machine (T, DT, fd, fq)
[out] = eval_motor_in_FEMM(geo,io_femm,gamma);

% Tn = out.Tn;
numsim = size(out.SOL,1);
% ripple_pu = out.ripple_pu;

% Cost functions to be minimized
cost1 = -out.Tn;
cost2 = out.ripple_pu*100;
cost  = [cost1 cost2];

delta = atan2(out.fq,out.fd) * 180/pi;
geo.power_factor = mean(cosd(delta-gamma));

% penalize the solutions which are out of the expected range of interest
% max_exp_ripple, min_exp_torque
if strcmp(eval_type,'MO_OA')
    if (cost(2)>per.max_exp_ripple | cost(1)>-per.min_exp_torque)
        cost(1)=cost(1)*0.1;
        cost(2)=cost(2)*10;
    end
end

save geo_mot_temp geo fem cost out RQ BLKLABELS per rotore2 statore

closefemm