%% 将一个椭圆进行倾斜
rotax=20;    %绕X轴旋转的角度
rotay=40;              % 绕Z轴旋转的角度
rotaz=60;             % 绕Y轴旋转的角度
% rotamatrix	坐标系旋转矩阵	
rotamatrix=[cosd(rotaz)*cosd(rotay),sind(rotaz),-cosd(rotaz)*sind(rotay);...
    -sind(rotaz)*cosd(rotay)*cosd(rotax)+sind(rotay)*sind(rotax),...
    cosd(rotaz)*cosd(rotax),...
    sind(rotaz)*sind(rotay)*cosd(rotax)+cosd(rotay)*sind(rotax);...
    sind(rotaz)*cosd(rotay)*sind(rotax)+sind(rotay)*cosd(rotax),...
    -cosd(rotaz)*sind(rotax),...
    -sind(rotaz)*sind(rotay)*sind(rotax)+cosd(rotay)*cosd(rotax)];
%% 生成椭圆的坐标矩阵
[x,y,z] = ellipsoid(0,0,0,10,6,4,50);
figure
hold on
subplot(2,1,1)
surf(x, y, z)
axis equal
xlabel('X'),ylabel('Y'),zlabel('Z')
% 对坐标点进行变换
coor = [x(:),y(:),z(:)];  % 网格坐标数据转化为列坐标数据
% 数据进行矩阵变换
newcoor = coor*rotamatrix;
newx = reshape(newcoor(:,1),size(x))
newy = reshape(newcoor(:,2),size(y))
newz = reshape(newcoor(:,3),size(z))
subplot(2,1,2)
surf(newx, newy, newz)
axis equal
xlabel('X'),ylabel('Y'),zlabel('Z')
hold off