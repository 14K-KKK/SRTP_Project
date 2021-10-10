%此程序用于计算ClassE电路参数

function [C0,C1,L0,L01,LP,RP,L03,C03,Lf] = Calculate_ClassE_Para(w,Q,RL,Q0)
%w为角频率，Q为振荡回路的品质因数，RL为负载阻值，Q0为谐波优化时构造的LC谐振腔的品质因数
%C0,C1,L0为基本参数；
%L01,LP,RP为变负载优化后新增元件的参数；L03,C03为谐波优化后新增的参数

clc;

%以下为基本classE电路参数计算公式
C1 = 8/((pi^2+4)*(pi*w*RL));
L0 = RL*Q/w;
C0 = 1/(w*RL*(Q-pi*(pi^2-4)/16));
Lf = 10/(w^2*C1);

%以下为classE电路变负载优化后新增元件参数计算公式
L01 = 1/(w^2*C0);
L02 = L0-L01;
LP = ((w*L02)^2+RL^2)/(w^2*L02);
RP = ((w*L02)^2+RL^2)/(RL);

%以下为classE电路谐波优化后新增元件参数计算公式
L03 = RP*Q0/(2*w);
C03 = 1/(2*w*RP*Q0);
end

