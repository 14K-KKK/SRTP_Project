%此程序用于对ClassE模型进行参数扫描

clc;clear;close all;

%开关管占空比扫描
% PW = 0.3:0.1:0.7;
% for i = length(PW):-1:1
% in(i) = Simulink.SimulationInput('ClassE');
% in(i) = in(i).setVariable('PW',PW(i));
% end
% out = parsim(in, 'ShowProgress', 'on');

%负载阻值扫描
% RP = 5:5:25;
% for i = length(RP):-1:1
% in(i) = Simulink.SimulationInput('ClassE');     %将参数传入模型
% in(i) = in(i).setVariable('RP',RP(i));          %将模型中的"RP"设为给定参数值RP(i)
% end
% out = parsim(in, 'ShowProgress', 'on');

%互感线圈耦合系数扫描
K_coupling = 0.3:0.1:0.7;
for i = length(K_coupling):-1:1
in(i) = Simulink.SimulationInput('ClassE_WPT');
in(i) = in(i).setVariable('K_coupling',K_coupling(i));
end
out = parsim(in, 'ShowProgress', 'on');