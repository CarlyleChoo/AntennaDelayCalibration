%%���ء�λ�ò�������20180418���Ĳ�������
clear;close all;
%A0T0���λ����Ϣ
temp1=xlsread('./Data/λ�ò�������20180418/A0/A0_1_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A0/A0_1_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A0/A0_1_3.csv');
A0T0P1=[temp1;temp2;temp3];

temp1=xlsread('./Data/λ�ò�������20180418/A0/A0_2_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A0/A0_2_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A0/A0_2_3.csv');
A0T0P2=[temp1;temp2;temp3];

temp1=xlsread('./Data/λ�ò�������20180418/A0/A0_3_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A0/A0_3_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A0/A0_3_3.csv');
A0T0P3=[temp1;temp2;temp3];

temp1=xlsread('./Data/λ�ò�������20180418/A0/A0_4_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A0/A0_4_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A0/A0_4_3.csv');
A0T0P4=[temp1;temp2;temp3];

%A1T0���λ����Ϣ
temp1=xlsread('./Data/λ�ò�������20180418/A1/A1_1_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A1/A1_1_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A1/A1_1_3.csv');
A1T0P1=[temp1;temp2;temp3];

temp1=xlsread('./Data/λ�ò�������20180418/A1/A1_2_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A1/A1_2_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A1/A1_2_3.csv');
A1T0P2=[temp1;temp2;temp3];

temp1=xlsread('./Data/λ�ò�������20180418/A1/A1_3_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A1/A1_3_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A1/A1_3_3.csv');
A1T0P3=[temp1;temp2;temp3];

temp1=xlsread('./Data/λ�ò�������20180418/A1/A1_4_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A1/A1_4_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A1/A1_4_3.csv');
A1T0P4=[temp1;temp2;temp3];

%A2T0���λ����Ϣ
temp1=xlsread('./Data/λ�ò�������20180418/A2/A2_1_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A2/A2_1_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A2/A2_1_3.csv');
A2T0P1=[temp1;temp2;temp3];

temp1=xlsread('./Data/λ�ò�������20180418/A2/A2_2_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A2/A2_2_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A2/A2_2_3.csv');
A2T0P2=[temp1;temp2;temp3];

temp1=xlsread('./Data/λ�ò�������20180418/A2/A2_3_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A2/A2_3_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A2/A2_3_3.csv');
A2T0P3=[temp1;temp2;temp3];

temp1=xlsread('./Data/λ�ò�������20180418/A2/A2_4_1.csv');
temp2=xlsread('./Data/λ�ò�������20180418/A2/A2_4_2.csv');
temp3=xlsread('./Data/λ�ò�������20180418/A2/A2_4_3.csv');
A2T0P4=[temp1;temp2;temp3];



save positiondata_20180418.mat