function [Xout,Uout] = plotResult(model,Xpred,fig)


N = model.agent_particles;
T = model.horizon;
Uout = zeros(model.agent_udim,T); 
Xout = zeros(model.agent_xdim,T,N);


if ~isempty(Xpred)
    for i=1:N
        for t=1:T
            for d = 1: model.agent_xdim
                Xout(d,t,i) = Xpred(I(model,'x',[i t d]));
            end
        end
    end

    cpmap = hsv(N);
    figure(fig);
    for i=1:N
        xp = Xout(:,:,i);
        plot3(xp(1,:),xp(2,:),xp(3,:),'-o','Color',cpmap(i,:),...
             'MarkerFaceColor',cpmap(i,:),'MarkerEdgeColor','k','Linewidth',2);

    end

end

if ~isempty(Xpred)
    for t=1:T
        for d = 1: model.agent_udim
            Uout(d,t) = Xpred(I(model,'u',[t d]));
        end
    end
    
end

drawnow;


end