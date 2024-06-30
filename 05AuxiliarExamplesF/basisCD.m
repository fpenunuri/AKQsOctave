%A = basisCD(q,pars)
%Attached basis to the link CD. The vectors are given as columns of 
%matrix A.
%q: generalized coordinates
%pars: parameters independent of time
function fr = basisCD(q,pars)
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

  fr = cat(2,x3,y3,z3);
end


