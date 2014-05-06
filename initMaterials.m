function [FemmProblem] = initMaterials(FemmProblem, geo)
BH1=[0	0;
      0.050000000000000003	17.059828;
      0.10000000000000001	25.634971;
      0.14999999999999999	31.338353999999999;
      0.20000000000000001	35.778996999999997;
      0.25	39.602124000000003;
      0.29999999999999999	43.123142999999999;
      0.34999999999999998	46.520439000000003;
      0.40000000000000002	49.908177000000002;
      0.45000000000000001	53.368284000000003;
      0.5	56.966318000000001;
      0.55000000000000004	60.760271000000003;
      0.59999999999999998	64.806105000000002;
      0.65000000000000002	69.161803000000006;
      0.69999999999999996	73.890922000000003;
      0.75	79.066315000000003;
      0.80000000000000004	84.774675999999999;
      0.84999999999999998	91.122721999999996;
      0.90000000000000002	98.246298999999993;
      0.94999999999999996	106.324591;
      1	115.60341699999999;
      1.05	126.435124;
      1.1000000000000001	139.34975900000001;
      1.1499999999999999	155.187082;
      1.2	175.350538;
      1.25	202.312017;
      1.3	240.640455;
      1.3500000000000001	299.11802699999998;
      1.3999999999999999	394.99338599999999;
      1.45	561.72617700000001;
      1.5	859.32876299999998;
      1.55	1375.4668879999999;
      1.6000000000000001	2191.2469139999998;
      1.6499999999999999	3328.145908;
      1.7	4760.5061720000003;
      1.75	6535.3394490000001;
      1.8	8788.9706569999998;
      1.8500000000000001	11670.804346999999;
      1.8999999999999999	15385.186211;
      1.95	20246.553030999999;
      2	26995.131141000002;
      2.0499999999999998	38724.496369;
      2.1000000000000001	64917.284463000004;
      2.1499999999999999	101489.30933800001;
      2.2000000000000002	137202.82896099999;
      2.25	176835.706764;
      2.2999999999999998	216374.28360900001];
BH2=[0	0;
      0.10000000000000001	35;
      0.20000000000000001	46.299999999999997;
      0.29999999999999999	53.799999999999997;
      0.40000000000000002	61.299999999999997;
      0.5	68.799999999999997;
      0.59999999999999998	76.299999999999997;
      0.69999999999999996	83.799999999999997;
      0.80000000000000004	92.5;
      0.90000000000000002	103;
      1	115;
      1.1000000000000001	135;
      1.2	166;
      1.3	231;
      1.3999999999999999	431;
      1.5	1330;
      1.6000000000000001	3120;
      1.7	5790;
      1.8	12400;
      1.8500000000000001	17200;
      1.9099999999999999	23200;
      1.98	33200;
      2.0499999999999998	48700;
      2.1200000000000001	68700;
      2.1899999999999999	103700;
      2.2599999999999998	153700;
      2.3900000000000001	253700];
BH3=[0	0;
      0.20000000000000001	21.522575929999999;
      0.40000000000000002	44.711908919999999;
      0.59999999999999998	72.475883120000006;
      0.80000000000000004	109.3673675;
      1	166.16724769999999;
      1.2	276.87752599999999;
      1.3999999999999999	624.97564209999996;
      1.51	1388.875241;
      1.55	2096.3999410000001;
      1.5900000000000001	3194.4272209999999;
      1.6299999999999999	4665.6878649999999;
      1.6699999999999999	6402.937938;
      1.71	8356.0562150000005;
      1.75	10542.94765;
      1.79	12986.16259;
      1.8300000000000001	15780.726769999999;
      1.8700000000000001	19014.71773;
      1.9099999999999999	22844.574949999998;
      1.95	27508.583279999999;
      1.99	33290.177620000002;
      2.0299999999999998	40600.928720000004;
      2.0699999999999998	49960.857839999997;
      2.1099999999999999	61934.971960000003;
      2.1499999999999999	79984.428880000007;
      2.1899999999999999	104820.1562;
      2.2250000000000001	135667.11489999999;
      2.2650000000000001	167371.28640000001;
      2.2999999999999998	195112.43700000001;
      2.3530000000000002	237120.4645;
      2.4060000000000001	279128.4927];
BH4=[0	0;
      0.046199999999999998	17.059828;
      0.092499999999999999	25.634971;
      0.13880000000000001	31.338353999999999;
      0.185	35.778996999999997;
      0.23130000000000001	39.602124000000003;
      0.27750000000000002	43.123142999999999;
      0.32369999999999999	46.520439000000003;
      0.37	49.908177000000002;
      0.4163	53.368284000000003;
      0.46250000000000002	56.966318000000001;
      0.50870000000000004	60.760271000000003;
      0.55500000000000005	64.806105000000002;
      0.60119999999999996	69.161803000000006;
      0.64749999999999996	73.890922000000003;
      0.69379999999999997	79.066315000000003;
      0.73999999999999999	84.774675999999999;
      0.7863	91.122721999999996;
      0.83250000000000002	98.246298999999993;
      0.87880000000000003	106.324591;
      0.92500000000000004	115.60341699999999;
      0.97119999999999995	126.435124;
      1.0175000000000001	139.34975900000001;
      1.0638000000000001	155.187082;
      1.1100000000000001	175.350538;
      1.1563000000000001	202.312017;
      1.2024999999999999	240.640455;
      1.2487999999999999	299.11802699999998;
      1.2949999999999999	394.99338599999999;
      1.3412999999999999	561.72617700000001;
      1.3875	859.32876299999998;
      1.4338	1375.4668879999999;
      1.48	2191.2469139999998;
      1.5263	3328.145908;
      1.5725	4760.5061720000003;
      1.6188	6535.3394490000001;
      1.665	8788.9706569999998;
      1.7113	11670.804346999999;
      1.7575000000000001	15385.186211;
      1.8037000000000001	20246.553030999999;
      1.8500000000000001	26995.131141000002;
      1.8963000000000001	38724.496369;
      1.9424999999999999	64917.284463000004;
      1.9887999999999999	101489.30933800001;
      2.0350000000000001	137202.82896099999;
      2.0813000000000001	176835.706764;
      2.1274999999999999	216374.28360900001];
index=1;
M{index}=newmaterial_mfemm('Copper','Mu_x',1,...
                            'Mu_y',1,...
                            'H_c',0,...
                            'H_cAngle',0,...
                            'J_re',0,...
                            'J_im',0,...
                            'Sigma',58,...
                            'd_lam',0,...
                            'Phi_h',0,...
                            'Phi_hx',0,...
                            'Phi_hy',0,...
                            'LamType',0,...
                            'LamFill',1,...
                            'NStrands',0,...
                            'WireD',0,...
                            'BHPoints',[]);
index=index+1;
M{index}=newmaterial_mfemm('M-27 Steel','Mu_x',12138,...
                            'Mu_y',12138,...
                            'H_c',0,...
                            'H_cAngle',0,...
                            'J_re',0,...
                            'J_im',0,...
                            'Sigma',2,...
                            'd_lam',0.63500000000000001,...
                            'Phi_h',0,...
                            'Phi_hx',0,...
                            'Phi_hy',0,...
                            'LamType',0,...
                            'LamFill',0.97999999999999998,...
                            'NStrands',0,...
                            'WireD',0,...
                            'BHPoints',BH1);
index=index+1;
M{index}=newmaterial_mfemm('NdFeB 37 MGOe','Mu_x',1.048,...
                            'Mu_y',1.048,...
                            'H_c',950000,...
                            'H_cAngle',0,...
                            'J_re',0,...
                            'J_im',0,...
                            'Sigma',0.66700000000000004,...
                            'd_lam',0,...
                            'Phi_h',0,...
                            'Phi_hx',0,...
                            'Phi_hy',0,...
                            'LamType',0,...
                            'LamFill',1,...
                            'NStrands',0,...
                            'WireD',0,...
                            'BHPoints',[]);
index=index+1;
M{index}=newmaterial_mfemm('Bonded-Magnet','Mu_x',1,...
                            'Mu_y',1,...
                            'H_c',geo.Hc,...
                            'H_cAngle',0,...
                            'J_re',0,...
                            'J_im',0,...
                            'Sigma',0,...
                            'd_lam',0,...
                            'Phi_h',0,...
                            'Phi_hx',0,...
                            'Phi_hy',0,...
                            'LamType',0,...
                            'LamFill',1,...
                            'NStrands',0,...
                            'WireD',0,...
                            'BHPoints',[]);
index=index+1;
M{index}=newmaterial_mfemm('S18-Corea','Mu_x',1,...
                            'Mu_y',1,...
                            'H_c',0,...
                            'H_cAngle',0,...
                            'J_re',0,...
                            'J_im',0,...
                            'Sigma',0,...
                            'd_lam',0.47999999999999998,...
                            'Phi_h',0,...
                            'Phi_hx',0,...
                            'Phi_hy',0,...
                            'LamType',0,...
                            'LamFill',0.97999999999999998,...
                            'NStrands',0,...
                            'WireD',0,...
                            'BHPoints',BH2);
index=index+1;
M{index}=newmaterial_mfemm('Transil270-35','Mu_x',1,...
                            'Mu_y',1,...
                            'H_c',0,...
                            'H_cAngle',0,...
                            'J_re',0,...
                            'J_im',0,...
                            'Sigma',0,...
                            'd_lam',0.47999999999999998,...
                            'Phi_h',0,...
                            'Phi_hx',0,...
                            'Phi_hy',0,...
                            'LamType',0,...
                            'LamFill',0.97999999999999998,...
                            'NStrands',0,...
                            'WireD',0,...
                            'BHPoints',BH3);
index=index+1;
M{index}=newmaterial_mfemm('M-27 Mod-7p5','Mu_x',1,...
                            'Mu_y',1,...
                            'H_c',0,...
                            'H_cAngle',0,...
                            'J_re',0,...
                            'J_im',0,...
                            'Sigma',0,...
                            'd_lam',0.63500000000000001,...
                            'Phi_h',0,...
                            'Phi_hx',0,...
                            'Phi_hy',0,...
                            'LamType',0,...
                            'LamFill',0.97999999999999998,...
                            'NStrands',0,...
                            'WireD',0,...
                            'BHPoints',BH4);
for i=1:numel(M)
    FemmProblem=addmaterials_mfemm(FemmProblem,M{i});
end
