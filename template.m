%% 基于PTB-3.0的心理学实验程序模板
% 2019.8.26 by skr 
clc;
clear;
%% 手动参数设置区
textsize = 25;%屏幕上所呈现的文字大小
instruct_str = '请按S键开始';
%% 增强程序的稳定性
Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference', 'VisualDebuglevel', 0);
Screen('Preference', 'SuppressAllWarnings', 1);
%% UI界面输入被试信息与实验选项
sub_info = inputdlg('sub-被试编号','被试信息');
%% 读取所需的实验材料
impath = [pwd,'\picture'];
[imfile,nimfile] = FileFromFolder(impath,'bmp');
%% 预处理工作
addpath([pwd,'\materials']);%添加子函数文件夹到路径内
KbName('UnifyKeyNames'); %将当前系统的键盘按键命名方案进行标准化

Screen('CloseAll');
ListenChar(2);%屏蔽按键输出
%% 实验程序主体
%-------参数说明-------
%   main_window 主窗口指针
%   xc,yc       窗口中心坐标
%   rect        主显示器的窗口大小
%   hz          PTB窗口大小（精确值）
rect=Screen('Rect',0);%获取当前显示器的尺寸
[main_window,rect] = Screen('OpenWindow',0,0,rect,[],[],[],[],[],[],[]);%默认背景为黑色

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
        Recordtime = datetime;%记录实验开始的时间
        eStart = GetSecs;
        break
    end
end
%% 实验程序结束判断
[KD,KeyCode,~] = KbWait([],2,0.01);%获取被试的按键输入
%KD是按键标志位，有键被按下则置1
%secs是按键行为发生的时间
%KeyCode是被按下的键的扫描码序列，是一个1*256的double变量


Screen('CloseAll');
ListenChar(0);%恢复按键输出

%% 数据处理与记录
cd .\record
OutputFileName = ['Record_' num2str(Sub) '.xlsx'];
xlswrite(OutputFileName,Result)
cd ..

