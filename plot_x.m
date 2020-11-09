function plot_x(Xout,Vstop,TT)

T = 1:size(Xout,2);
t = 1:size(Xout,2);

% --------------------- POSITION ----------------------------
figure;
cmap = colorcube(400);
colors = cmap([171 233 80 135 30 200 111],:);

subplot(3,1,1)
plot(t,Xout(1,:),'Color',colors(1,:),'linewidth',2);
grid on;
hold on;
plot(t(TT),Xout(1,TT),'*','Color',colors(1,:),'linewidth',2,'MarkerSize',14);
xlabel('time (s)');
ylabel('X (m)');
set(gca,'fontsize',14);


subplot(3,1,2)
plot(t,Xout(2,:),'Color',colors(2,:),'linewidth',2);
grid on;
xlabel('time (s)');
ylabel('Y (m)');
hold on;
plot(t(TT),Xout(2,TT),'*','Color',colors(2,:),'linewidth',2,'MarkerSize',14);
set(gca,'fontsize',14);


subplot(3,1,3)
plot(t,Xout(3,:),'Color',colors(3,:),'linewidth',2);
grid on;
xlabel('time (s)');
ylabel('Z (m)')
hold on;
plot(t(TT),Xout(3,TT),'*','Color',colors(3,:),'linewidth',2,'MarkerSize',14);
ylim([0 50]);
set(gca,'fontsize',14);

% ----------------- VELOCITY -------------------
figure;
cmap = colorcube(400);
colors = cmap([171 233 80 135 30 200 111],:);

subplot(3,1,1)
plot(t,Xout(4,:),'Color',colors(1,:),'linewidth',2);
grid on;
hold on;
xlabel('time (s)');
ylabel('Xv (m)');
set(gca,'fontsize',14);


subplot(3,1,2)
plot(t,Xout(5,:),'Color',colors(2,:),'linewidth',2);
grid on;
xlabel('time (s)');
ylabel('Yv (m)');
hold on;
set(gca,'fontsize',14);


subplot(3,1,3)
plot(t,Xout(6,:),'Color',colors(3,:),'linewidth',2);
grid on;
xlabel('time (s)');
ylabel('Zv (m)')
hold on;
set(gca,'fontsize',14);

% ----- ACCELERATION -------------

accX = diff(Xout(4,:));
accY = diff(Xout(5,:));
accZ = diff(Xout(6,:));

t = 2:size(Xout,2);

figure;
cmap = colorcube(400);
colors = cmap([171 233 80 135 30 200 111],:);

subplot(3,1,1)
plot(t,accX,'Color',colors(1,:),'linewidth',2);
grid on;
hold on;
xlabel('time (s)');
ylabel('Xa (m)');
set(gca,'fontsize',14);


subplot(3,1,2)
plot(t,accY,'Color',colors(2,:),'linewidth',2);
grid on;
xlabel('time (s)');
ylabel('Ya (m)');
hold on;
set(gca,'fontsize',14);

subplot(3,1,3)
plot(t,accZ,'Color',colors(3,:),'linewidth',2);
grid on;
xlabel('time (s)');
ylabel('Za (m)')
hold on;
set(gca,'fontsize',14);


end

