%QM with PBC
%Evan Reed
%February 21, 2013
%MatSci 331 HW #5

%use atomic units: electron mass = 1, h_bar = 1, e (electron charge) = 1
%atomic units of energy are Hatrees = 27.2 eV
%atomic units of distance are Bohr = 0.529177e-10 m = 0.529177 Angstroms

clear;

ecut=1; %plane wave cutoff energy (Hartrees)
fcc_conventional_cell_lattice_constant=13.0; % (Bohr)
num_kvecs=10; %number of points to compute bands


%Define lattice vectors
a1=[0.5 0.5 0]'*fcc_conventional_cell_lattice_constant;
a2=[0 0.5 0.5]'*fcc_conventional_cell_lattice_constant;
a3=[0.5 0 0.5]'*fcc_conventional_cell_lattice_constant;

%Define reciprocal lattice vectors
vol=dot(a1,cross(a2,a3));
b1=2*pi*cross(a2,a3)/vol;
b2=2*pi*cross(a3,a1)/vol;
b3=2*pi*cross(a1,a2)/vol;

[plane_waves,num_plane_waves]=get_plane_waves(b1,b2,b3,ecut);
num_plane_waves

%define k-points where bands will be computed
%from gamma to L for fcc crystal
for i=0:(num_kvecs-1)
    k_vecs(:,i+1)=i/(num_kvecs-1)/2*b1+i/(num_kvecs-1)/2*b2+i/(num_kvecs-1)/2*b3;
end

%form the potential part of the Hamiltonian
H_pot=zeros(num_plane_waves,num_plane_waves); %free electron case
%H_pot=hydrogen_atom_pot(plane_waves,num_plane_waves,b1,b2,b3,vol); %hydrogen atom case

%loop over k vecs along gamma to L
for k=1:num_kvecs

    %form the kinetic part of the Hamiltonian here
    
    %compute eigenvalues
    eigenvalues(k,:)=sort(eig(H));
  %  eigenvalues(k,:)=sort(eigs(H-eye(size(H))*10000))+10000; %this may run faster for large matricies
    
end
figure;
plot(eigenvalues);





