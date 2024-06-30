%A = BOutputL(q,par)
%Attached basis to the output link in the spherical 4R mechanism. The 
%vectors are given as columns of matrix A.
%q: generalized coordinates
%pars: parameters independent of time
function fr = BOutputL(q,par)
  [~,~,~,~,x4,~,T43,~] = sph4r_vars(q,par);
  e3o = vuni(x4);
  e1o = T43;
  e2o = cross(e3o,e1o);
  fr = cat(2,e1o,e2o,e3o);
end
