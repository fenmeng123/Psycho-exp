function deskchange(windowptr,imagemat)
% �л���ʾͼƬ�ĺ��� windowptr-����ָ�� imagemat-Ҫ�л���ͼƬ����
% 
%
textureIndex = Screen('MakeTexture',windowptr,imagemat);%��������
Screen('DrawTexture',windowptr,textureIndex);%д�뻺��
Screen('Flip',windowptr);%����
Screen('Close' , textureIndex);%����������ͷ��ڴ�