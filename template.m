%% ����PTB-3.0������ѧʵ�����ģ��
% 2019.8.26 by skr 
clc;
clear;
%% �ֶ�����������
textsize = 25;%��Ļ�������ֵ����ִ�С
instruct_str = '�밴S����ʼ';
%% ��ǿ������ȶ���
Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference', 'VisualDebuglevel', 0);
Screen('Preference', 'SuppressAllWarnings', 1);
%% UI�������뱻����Ϣ��ʵ��ѡ��
sub_info = inputdlg('sub-���Ա��','������Ϣ');
%% ��ȡ�����ʵ�����
impath = [pwd,'\picture'];
[imfile,nimfile] = FileFromFolder(impath,'bmp');
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

DrawFormattedText(main_window,double(instruct_str),'center','center',255);
Screen('Flip',main_window);

KbReleaseWait();
while true
    [~,~,kc] = KbCheck();
    if kc(KbName('s'))
        Recordtime = datetime;%��¼ʵ�鿪ʼ��ʱ��
        eStart = GetSecs;
        break
    end
end
%% ʵ���������ж�
[KD,KeyCode,~] = KbWait([],2,0.01);%��ȡ���Եİ�������
%KD�ǰ�����־λ���м�����������1
%secs�ǰ�����Ϊ������ʱ��
%KeyCode�Ǳ����µļ���ɨ�������У���һ��1*256��double����


Screen('CloseAll');
ListenChar(0);%�ָ��������

%% ���ݴ������¼
cd .\record
OutputFileName = ['Record_' num2str(Sub) '.xlsx'];
xlswrite(OutputFileName,Result)
cd ..

