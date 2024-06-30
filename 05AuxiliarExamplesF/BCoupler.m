%Auxiliar functions
%Some quantities related to the spherical 4R mechanism are calculated by
%[x1,r2,r3,rg,x4,T23,T43,th4] = sph4r_vars(q,par);
%type 'help sph4r_vars' for more information.
%
%A = BCoupler(q,par)
%Attached basis to the coupler link in the spherical 4R mechanism. The 
%vectors are given as columns of matrix A.
%q: generalized coordinates
%pars: parameters independent of time
function fr = BCoupler(q,par)
  [~,r2,~,~,~,T23,~,~] = sph4r_vars(q,par);
  e3c = vuni(r2);
  e1c = T23;
  e2c = cross(e3c,e1c); %already a unit vector since e3c.e1c=0
  fr = cat(2,e1c,e2c,e3c);
end
