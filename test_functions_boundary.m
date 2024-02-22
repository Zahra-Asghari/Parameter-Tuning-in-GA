function [down,up,dim]=test_functions_boundary(F_num)
dim=5;
if F_num==1
    down=-100;up=100;
end

if F_num==2
    down=-10;up=10;
end

if F_num==3
    down=-100;up=100;
end

if F_num==4
    down=-100;up=100;
end

if F_num==5
    down=-30;up=30;
end

if F_num==6
    down=-100;up=100;
end

if F_num==7
    down=-1.28;up=1.28;
end

if F_num==8
    down=-500;up=500;
end

if F_num==9
    down=-5.12;up=5.12;
end

if F_num==10
    down=-32;up=32;
end

if F_num==11
    down=-600;up=600;
end

if F_num==12
    down=-50;up=50;
end

if F_num==13
    down=-50;up=50;
end

if F_num==14
    down=-65.536;up=65.536;dim=2;
end

if F_num==15
    down=-5;up=5;dim=4;
end

if F_num==16
    down=-5;up=5;dim=2;
end

if F_num==17
    down=[-5;0];up=[10;15];dim=2;
end

if F_num==18
    down=-2;up=2;dim=2;
end

if F_num==19
    down=0;up=1;dim=3;
end

if F_num==20
    down=0;up=1;dim=6;
end

if F_num==21
    down=0;up=10;dim=4;
end

if F_num==22
    down=0;up=10;dim=4;
end

if F_num==23
    down=0;up=10;dim=4;
end