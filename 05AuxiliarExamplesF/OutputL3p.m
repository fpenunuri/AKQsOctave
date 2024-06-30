%A = OutputL3p(q,par)
%Position vectors of three non-collinear points corresponding to the 
%output link. These vectors represent rigid extensions of the link and 
%are arranged as columns in matrix A.
%q: generalized coordinates
%pars: parameters independent of time
function fr = OutputL3p(q,par)
  [~,~,~,~,x4,~,T43,~] = sph4r_vars(q,par);
  e3o = vuni(x4);
  e1o = T43;
  e2o = cross(e3o,e1o);
  
  p1 = x4 + e1o;
  p2 = x4 + e2o;
  p3 = x4 + e3o;

  fr = cat(2,p1,p2,p3);
end
