%--------------------------------------------------------------------------
%auxiliar functions for the RCR_a file 
%
%A = points123(q,pars)
%Position vectors of three non-collinear points corresponding to the 
%link CD. These vectors represent rigid extensions of the link and 
%are arranged as columns in matrix A.
%q: generalized coordinates
%pars: parameters independent of time
function fr = points123(q,pars)
  th = q(1); phi = q(2); s=q(3); bt = q(4);

  BC = pars(1); CD = pars(2);

  T1 = HTM(th,[0,0,1],[0,0,0]);
  T2 = HTM(phi,[1,0,0],[s,0,0]);
  T3 = HTM(0,[0,0,1],[0,0,BC]);
  T4 = HTM(bt,[0,0,1],[0,0,0]);
  T5 = HTM(0,[1,0,0],[CD,0,0]);

  RD = T1*T2*T3*T4*T5; RC = T1*T2*T3; RB = T1*T2;
  pD = RD(1:3,4); pC = RC(1:3,4); pB = RB(1:3,4);
  pCD = pD - pC; pBC = pC - pB; 

  x3 = vuni(pCD); z3 = vuni(pBC); y3 = vuni(cross(z3,x3));

  p1 = pC + x3;
  p2 = pC + y3;
  p3 = pC + z3;

  fr = cat(2,p1,p2,p3);
end
