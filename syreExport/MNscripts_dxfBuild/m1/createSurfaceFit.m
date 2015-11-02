function [fitresult, gof] = createSurfaceFit(x, y, z)
%CREATESURFACEFIT(X,Y,Z)
%  Fit surface to data.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Input : y
%      Z output: z
%      Weights : (none)
%
%  Output:
%      fitresult : an sfit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, SFIT.

%  Auto-generated by MATLAB on 04-Dec-2009 20:46:29


%% Fit: 'untitled fit 1'.
ft = 'linearinterp';
opts = fitoptions( ft );
opts.Weights = zeros(1,0);
opts.Normalize = 'on';
[fitresult, gof] = fit( [x, y], z, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, [x, y], z );
grid on
% Label axes


