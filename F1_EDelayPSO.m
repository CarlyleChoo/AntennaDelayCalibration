% Copyright by Xinzhe Gui @ 2017
% Email: lwft@qq.com
% You can change and distribute this code freely for academic usage
% Business usage is strictly prohibited
clear
clc
load F0_calibrationdata.mat
%%%%%%%%%���ӳٵĹ�ϵ
% ������ǰ���Ĺ�ʽ����ʱ�ó������� no use
% fitdata=A0_A1;%3.286587345991266e+04
% fitdata=A0_A2;%3.287092032231401e+04
% fitdata=A0_T0;%3.287218030875541e+04
% fitdata=A1_A2;%3.285044209376539e+04
% fitdata=A1_T0;%3.287413288854748e+04
% fitdata=A2_T0;%3.286474784046557e+04
% fitdata=A1_A3;%3.286587346020784e+04
% fitdata=A2_A3;%3.287092032084848e+04
% fitdata=A3_T0;%3.287218031280406e+04
fitreal=2;
fitdata=A0_A1;%[32883.2168198808]
fitdata=A0_A2;%[32888.2690141552]
% fitdata=A0_T0;%[32889.5303335300]
fitdata=A1_A2;%[32867.7691941474]
% fitdata=A1_T0;%[32891.4849837626]
% fitdata=A2_T0;%[32882.0900220365]
% fitdata=A1_A3;%[32883.2168198803]
% fitdata=A2_A3;%[32888.2690141558]
% fitdata=A3_T0;%[32889.5303335231]

%% 
%��ʼ��PSO��ز���
% vmax=0.15; %ÿ�����ӵ�����ٶ�
% vmin=-0.15;
xmax=65536; 
xmin=-65536;
vmax=65536/2; %ÿ�����ӵ�����ٶ�
vmin=-65536/2;
minerr=0.0015; %��С���
% wmax=1;%������Ȩ��
% wmin=1;%��С����Ȩ��
wmax=0.90;%������Ȩ��
wmin=0.40;%��С����Ȩ��
global itmax; %���Ѱ�Ŵ���
itmax=200;
c1=2.05;%����
c2=2.05;%ȫ��
cf=0.729;
W(itmax)=0;
for iter=1:itmax
    W(iter)=wmax-((wmax-wmin)/itmax)*iter; % ����Ȩ�ص������½�
end
Vmax(itmax)=0;
for iter=1:itmax
    Vmax(iter)=vmax/iter; % ����ٶȵ������½�
%     Vmax(iter)=vmax;
end
Vmin(itmax)=0;
for iter=1:itmax
    Vmin(iter)=vmin/iter; % ������ٶȵ������½�
%     Vmin(iter)=vmin;
end
% ����λ�ó�ʼ����Χ
a=0;
b=65536;
% �����ٶȳ�ʼ����Χ
m=0;
n=65536;
ParticleNum=100;

% �Ż�����������Ȩֵ�ͷ�ֵ 
% 1 3 1 ��ʱ��D=((1+1)*3+(3+1)*1)=10 Ϊ10
ParticleDimension=1; %D=(14+1)*7+(7+1)*1=113

rng(sum(100*clock),'v5uniform');
%����λ�ñ���ʼ��Ϊ(0,1)֮������ֵ
X=a+(b-a)*rand(ParticleNum,ParticleDimension,1);
%�����ٶȱ���ʼ��Ϊ(0,1)֮������ֵ
V=m+(n-m)*rand(ParticleNum,ParticleDimension,1);

%������Ӧ��

MinFit=[];
BestFit=[];

fitness=fitcal(X,fitdata,fitreal); %����ֵ ÿһ�������ƽ����Ӧֵ

fvrec(:,1,1)=fitness(:,1,1);%����ֵ ÿһ������(��40������)����Ӧֵ ��һ��

[C,I]=min(fitness(:,1,1)); %������С��ӦֵC����������I
MinFit=[MinFit C];  %��һ�������������Ӧ��ֵ
BestFit=[BestFit C]; %��һ����ȫ�������Ӧ��ֵ
L(:,1,1)=fitness(:,1,1); %��ÿ��ѭ���м�¼���ӵ���Ӧ��
B(1,1,1)=C; %��¼�����ӵ���С��Ӧ��
gbest(1,:,1)=X(I,1,1); %ȫ�����ŵ���Ӧ��ֵ

%Matrix composed of gbest vector
for p=1:ParticleNum
    G(p,:,1)=gbest(1,:,1); %ÿ�������ȫ������
end
for i=1:ParticleNum;
    pbest(i,:,1)=X(i,:,1); %��һ������ʷ��þ����Լ�
end
%�����ٶȸ��¹�ʽ
V(:,:,2)=W(1)*V(:,:,1)+c1*rand*(pbest(:,:,1)-X(:,:,1))+c2*rand*(G(:,:,1)-X(:,:,1));
%V(:,:,2)=cf*(W(1)*V(:,:,1)+c1*rand*(pbest(:,:,1)-X(:,:,1))+c2*rand*(G(:,:,1)-X(:,:,1)));
% V(:,:,2)=cf*(V(:,:,1)+c1*rand*(pbest(:,:,1)-X(:,:,1))+c2*rand*(G(:,:,1)-X(:,:,1)));
% V(:,:,2)=cf*(c1*rand*(pbest(:,:,1)-X(:,:,1))+c2*rand*(G(:,:,1)-X(:,:,1)));
%����ÿ�����ӵ��ٶȣ��ڣ�vmin,vmax��֮��
for ni=1:ParticleNum
    for di=1:ParticleDimension
        if V(ni,di,2) > Vmax(1)
            V(ni,di,2) = Vmax(1);
        elseif V(ni,di,2) < Vmin(1)
            V(ni,di,2) = Vmin(1);
        else
            V(ni,di,2) = V(ni,di,2);
        end
    end
end
%����λ�ø��¹�ʽ
X(:,:,2)=X(:,:,1)+V(:,:,2);
%����ÿ�����ӵ�λ�ã��ڣ�xmin,xmax��֮��
for ni=1:ParticleNum
    for di=1:ParticleDimension
        if X(ni,di,2) > xmax
            X(ni,di,2) = xmax;
        elseif V(ni,di,2) < xmin
            X(ni,di,2) = xmin;
        else
            X(ni,di,2) = X(ni,di,2);
        end
    end
end
%%
%******************************************************
for j=2:itmax
    disp('Iteration and Current Best Fitness')
    disp(j-1)
    disp(B(1,1,j-1))
    % Calculation of new positions
    fitness=fitcal(X,fitdata,fitreal); %����ֵ ÿһ���������Ӧֵ******************************************************
    fvrec(:,1,j)=fitness(:,1,j); %����ֵ ÿһ���������Ӧֵ ��j��
    %[maxC,maxI]=max(fitness(:,1,j));
    %MaxFit=[MaxFit maxC];
    %MeanFit=[MeanFit mean(fitness(:,1,j))];
    [C,I]=min(fitness(:,1,j));%��j�����ӵ���С��Ӧֵ,���������������Ӧ����С��һ������¼��C---������С��Ӧ��ֵ��I---������С��Ӧ��ֵ��Ӧ���������
    
    MinFit=[MinFit C]; %��¼ÿ������С��Ӧֵ
    BestFit=[BestFit min(MinFit)]; %��¼ȫ��ȫ�������Ӧֵ
    
    L(:,1,j)=fitness(:,1,j); %��¼ÿ�����ӵ���Ӧֵ
    B(1,1,j)=C;              %��¼j�����ӵ���С��Ӧֵ
    
    gbest(1,:,j)=X(I,:,j);%�ѵ�j��������С��Ӧֵ�����ӷ���gbest��
    [C,I]=min(B(1,1,:));%��¼��ʷֱ����j�����ӵ���С��Ӧֵ
    
    % keep gbest is the best particle of all have occured
    if B(1,1,j)<=C
        gbest(1,:,j)=gbest(1,:,j);
    else
        gbest(1,:,j)=gbest(1,:,I);
    end
     %Matrix composed of gbest vector
    for p=1:ParticleNum
        G(p,:,j)=gbest(1,:,j);
    end
    
    for i=1:ParticleNum;
        [iMinC,I]=min(L(i,1,:));
        if L(i,1,j)<=iMinC
            pbest(i,:,j)=X(i,:,j);
        else
            pbest(i,:,j)=X(i,:,I);
        end
    end
    
    if C<=minerr, break, end
    if j>=itmax, break, end
    
    %�����ٶȸ��¹�ʽ
    V(:,:,j+1)=W(j)*V(:,:,j)+c1*rand*(pbest(:,:,j)-X(:,:,j))+c2*rand*(G(:,:,j)-X(:,:,j));
    %V(:,:,j+1)=cf*(W(j)*V(:,:,j)+c1*rand*(pbest(:,:,j)-X(:,:,j))+c2*rand*(G(:,:,j)-X(:,:,j)));
%     V(:,:,j+1)=cf*(V(:,:,j)+c1*rand*(pbest(:,:,j)-X(:,:,j))+c2*rand*(G(:,:,j)-X(:,:,j)));
%     V(:,:,j+1)=cf*(c1*rand*(pbest(:,:,j)-X(:,:,j))+c2*rand*(G(:,:,j)-X(:,:,j)));
    %����ÿ�����ӵ��ٶȣ��ڣ�vmin,vmax��֮��
    for ni=1:ParticleNum
        for di=1:ParticleDimension
            if V(ni,di,j+1)>Vmax(j)
                V(ni,di,j+1)=Vmax(j);
            elseif V(ni,di,j+1)<Vmin(j)
                V(ni,di,j+1)=Vmin(j);
            else
                V(ni,di,j+1)=V(ni,di,j+1);
            end
        end
    end
    
    %����λ�ø��¹�ʽ
    X(:,:,j+1)=X(:,:,j)+V(:,:,j+1);
    %����ÿ�����ӵ��ٶȣ��ڣ�vmin,vmax��֮��
    for ni=1:ParticleNum
        for di=1:ParticleDimension
            if X(ni,di,j+1) > xmax
                X(ni,di,j+1) = xmax;
            elseif V(ni,di,j+1) < xmin
                X(ni,di,j+1) = xmin;
            else
                X(ni,di,j+1) = X(ni,di,j+1);
            end
        end
    end
    
end

disp('Iteration and Current Best Fitness')
disp(j)
disp(B(1,1,j))
disp('Global Best Fitness and Occurred Iteration')
[C,I] = min(B(1,1,:))
best_para=gbest(:,:,I)
%��ʾ��Ӧ�ȵı仯

%��ʾ����ֵ�ñ仯
