function [A,B,b0] = linear_constraints(model,V,s)

[a,b,~,~]=vert2lcon(V);
a(abs(a)<1E-6) = 0;
b(abs(b)<1E-6) = 0;
a = round(a);

order = [1 0 0;
         0 1 0;
         0 0 1;
         -1 0 0;
         0 -1 0;
         0 0 -1];
     

A = zeros(size(a));
B = zeros(size(b));



if isempty(s)
   b0 = zeros(6,1);
else
   w = s(1);
   h = s(2); 
   z = s(3);
   b0 = [w h z w h z]./model.divider;
end


for i=1:size(a,1)
   x = order(i,:);
   r = sum(sqrt((a-x).^2),2);
   ind = find(r==0);
   A(i,:) = a(ind,:);
   B(i) = b(ind);
end


A = [A zeros(model.agent_xdim,3)];

end