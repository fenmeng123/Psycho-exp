%% ����PTB-3.0������ѧʵ�����ģ��
% 2019.8.26 by skr 
clc;
clear;
%% �ֶ�����������
textsize = 25;%��Ļ�������ֵ����ִ�С
%% ��ǿ������ȶ���
Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference', 'VisualDebuglevel', 0);
Screen('Preference', 'SuppressAllWarnings', 1);
%% UI�������뱻����Ϣ��ʵ��ѡ��

%% ��ȡ�����ʵ�����

%% Ԥ������
addpath([pwd,'\materials']);%����Ӻ����ļ��е�·����
KbName('UnifyKeyNames'); %����ǰϵͳ�ļ��̰��������������б�׼��

Screen('CloseAll');
ListenChar(2);%���ΰ������
%% ʵ���������
%-------����˵��-------
%   main_window ������ָ��
%   xc,yc       ������������
%   rect        ����ʾ���Ĵ��ڴ�С
%   hz          PTB���ڴ�С����ȷֵ��
rect=Screen('Rect',0);%��ȡ��ǰ��ʾ���ĳߴ�
[main_window,rect] = Screen('OpenWindow',0,0,rect,[],[],[],[],[],[],[]);%Ĭ�ϱ���Ϊ��ɫ

hz=FrameRate(main_window);hz=round(hz);
[xc,yc]=WindowCenter(main_window);
AssertOpenGL;
Screen('BlendFunction', main_window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
Priority(MaxPriority(main_window));
Screen('TextSize',main_window,textsize);
Screen('TextFont',main_window,'-:lang=zh-cn');




%% ʵ���������ж�
[KD,KeyCode,~] = KbWait([],2,0.01);%��ȡ���Եİ�������
%KD�ǰ�����־λ���м�����������1
%secs�ǰ�����Ϊ������ʱ��
%KeyCode�Ǳ����µļ���ɨ�������У���һ��1*256��double����


Screen('CloseAll');
ListenChar(0);%�ָ��������

%% ���ݴ������¼


