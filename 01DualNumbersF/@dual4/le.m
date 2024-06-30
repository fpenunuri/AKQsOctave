%<=   Less than or equal.
%   A <= B does 
% There is no order on the dual4 numbers. The comparison is made 
% between the f0 components (real components).

function fr = le(A,B)

  if(isnumeric(A))
    A = dual4(A);
  end

  if(isnumeric(B))
    B = dual4(B);
  end

  A0 = A.f0;
  B0 = B.f0;

  fr = builtin('le',A0,B0);
end
