%A = Coupler3p(q,par)
%Position vectors of three non-collinear points corresponding to the 
%coupler link. These vectors represent rigid extensions of the link and 
%are arranged as columns in matrix A.
%q: generalized coordinates
%pars: parameters independent of time
function fr = Coupler3p(q,par)
  [~,r2,~,~,~,T23,~,~] = sph4r_vars(q,par);
  e3c = vuni(r2);
  e1c = T23;
  e2c = cross(e3c,e1c);
  
  p1 = r2 + e1c;
  p2 = r2 + e2c;
  p3 = r2 + e3c;

  fr = cat(2,p1,p2,p3);
end
