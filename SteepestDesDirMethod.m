function [fmin,xmin]=SteepestDesDirMethod(x0)
global counter
% initialization
epsilon=1.0e-3;
fmin=inf;
xmin=x0;
xk=x0;
yk=obj(xk);
x_vec=[xk];
y_vec=[yk];

% iteration
while 1&&counter<500
   % stop criterion
   gk=grad_obj(xk);
   if norm(gk)<epsilon
       xmin=xk;
       fmin=obj(xmin);
       break;
   else
       % search direction
       dk=-gk;
       % step size
       alphak=fminbnd(@(alpha) phi(alpha,xk,dk),0,10);
       % update point
       xk=xk+alphak*dk;
       yk=obj(xk);
   end
   x_vec=[x_vec,xk];
   y_vec=[y_vec,yk];
    
%     y = sin(a.*x);% 在一个确定的a下得到y=sin(ax)
    
    figure(1);
%     set(figure(1), 'Color', 'white');% 设置图片窗口背景颜色为白色
%     plot(x_vec, y_vec, 'LineWidth', 2, 'Color', [0.0118, 0.0359, 0.4824], 'DisplayName', '{\ita}='+string(roundn(a, -2))); 
%     绘制x,y曲线，并设置线宽，曲线颜色，曲线图例名称
%     scatter(x_vec,y_vec,10)
    plot3(x_vec(1,:),x_vec(2,:),y_vec,'.','markersize',12)
    grid on;% 为绘图窗口加上网格
    
    set(gca,'FontSize',12,'FontName','Bookman Old Style');% 设置图片中字体的大小，样式
    xlabel('Label {\itx}', 'FontSize',14);% 设置x轴标签
%     xlim([min(x), max(x)]);% 设置y轴标签
    xlim([-20,20])
    ylim([-100000, 100000]);% 设置y轴显示范围
    ylabel('Label {\ity}', 'FontSize',14);% 设置y轴标签
    legend('FontSize',14, 'box', 'off');% 为图片加上图例
    title('GIF: {\ity}=sin({\itax})', 'FontSize',14);% 增加图片的标题
    drawnow;% 立即刷新当前绘图窗口，这是matlab绘图中动态展示的关键
   
   
   
end

