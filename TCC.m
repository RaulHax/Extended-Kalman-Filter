clc
clear all
close all

addpath('3D_models');
addpath('functions');
run initial_conditions.m

global T

%%Configuração Geral
ttotal=30;
T=0.1;
t=0:T:ttotal;
N=length(t);

[c,e,f,medida1,medida2,medida3,erro1,erro2,erro3,position,errotri,sk,errokalman,erromedio1,erromedio2,erromedio3,erromediotri,erromediokalman,p1,p2,p3,p4,p5,p6,p7,p8,p9] = simulation( T , N );

run plots.m