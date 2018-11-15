% Compute and plot atomic radial wavefunctions 
% This program calls atomic_eigenproblem_solver
% Evan Reed, March 4, 2013

clear;
npoints=1000;
deltar=0.08;
rcut=0;
Z=3;
ell=0;

[eigenvecs,eigenvals]=atomic_eigenproblem_solver(Z,rcut,ell,npoints,deltar);

figure;
plot(eigenvecs(:,1),'k');
hold on
plot(eigenvecs(:,2),'b');
plot(eigenvecs(:,3),'r');

for rcut_index=1:10
    rcut=(rcut_index-1)/5
    [eigenvecs,eigenvals]=atomic_eigenproblem_solver(Z,rcut,ell,npoints,deltar);
    eigenvals_rcut(1:5,rcut_index)=[eigenvals(1,1), eigenvals(2,2),eigenvals(3,3),eigenvals(4,4),eigenvals(5,5)];
end
figure;
plot(eigenvals_rcut')

figure;
plot(eigenvecs(:,1),'k');
hold on
plot(eigenvecs(:,2),'b');
plot(eigenvecs(:,3),'r');


