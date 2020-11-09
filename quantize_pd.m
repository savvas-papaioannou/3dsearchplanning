function qPd = quantize_pd(model)

n_zones = model.n_zones;
fov_len = model.fov_len;
phi = model.phi;


qPd = quantize(n_zones,fov_len,phi);



end

function qPd = quantize(n_zones,fov_len,phi)

qPd = zeros(1,n_zones);
dmin = 17;
dmax = 92;

d = 0:0.1:100;

sense = zeros(1,length(d));
for i=1:length(d)
    sense(i) = Pd(d(i),dmin,dmax);
end

figure
cmap = colorcube(200);
h(1) = plot(d,sense,'-','color','k','linewidth',2);
l(1) = {'Search Quality'};
grid on;
xlabel('Distance (m)');
ylabel('Probability of Detection');
hold on;

cmap = colorcube(200);
c = [42 87 129];

v = getdist_for_FOVlen(fov_len,phi);
z = [v dmax];
count = 1;

for i = 1:n_zones
   
   x1 = z(i);
   x2 = z(i+1);
   x_vec = x1:0.1:x2;
   
   ind1 = find(d==x1,1,'first');
   y1 = sense(ind1);
   
   ind2 = find(d==x2,1,'last');
   y2 = sense(ind2);
   
   avg = mean(y2:0.01:y1);
   qPd(i) = avg;
   
   y1_vec = 0:0.01:avg;
   y2_vec = 0:0.01:avg;
   
  
   
   count = count + 1;
   h(count) = plot(x1.*ones(1,length(y2_vec)),y2_vec,'-.','Color',cmap(c(i),:),'linewidth',3);
   l(count) = {'Quantization'};
   
   plot(x2.*ones(1,length(y2_vec)),y2_vec,'-.','Color',cmap(c(i),:),'linewidth',3);
   plot(x_vec, avg.*ones(1,length(x_vec)),'-.','Color',cmap(c(i),:),'linewidth',3);
  
   
    
end
ylim([0 1.2]);

end


function val=Pd(d,dmin,dmax)

if d < dmin
    
    val = 0;
    
else
    
    val = max(0,1 - ((d-dmin)/(dmax-dmin)));
end


end
