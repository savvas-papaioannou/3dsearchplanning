function TT = computeTrackTime(Xout,Vstop)

model = gen_model();
[A,B,~] = linear_constraints(model,Vstop,[]);
A = A(1:6,1:3);
Xout = Xout(1:3,:);
TT = 0;

for i = 1:size(Xout,2)
    X = Xout(:,i);
    flag = sum(A*X<B);
    
    if flag==6
        TT = i;
        break;
    end
end
end
