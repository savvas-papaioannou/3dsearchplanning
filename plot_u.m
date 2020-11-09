function plot_u(Uout)

figure;
cmap = colorcube(400);
colors = cmap([171 233 80 135 30 200 111],:);

T = 1:size(Uout,2)-1;
t = T(end);


subplot(3,1,1)
plot(T,Uout(1,1:t),'-','Color',colors(1,:),'linewidth',2);
grid on;
hold on;
xlabel('time (s)');
ylabel('U_x (N)')
set(gca,'fontsize',14);

subplot(3,1,2)
plot(T,Uout(2,1:t),'-','Color',colors(2,:),'linewidth',2);
grid on;
hold on;


xlabel('time (s)');
ylabel('U_y (N)')
set(gca,'fontsize',14);

subplot(3,1,3)
plot(T,Uout(3,1:t),'-','Color',colors(3,:),'linewidth',2);
grid on;
hold on;
xlabel('time (s)');
ylabel('U_z (N)')

set(gca,'fontsize',14);

end