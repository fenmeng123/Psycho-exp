function deskchange(windowptr,imagemat)
% 切换显示图片的函数 windowptr-窗口指针 imagemat-要切换的图片矩阵
% 
%
textureIndex = Screen('MakeTexture',windowptr,imagemat);%制作缓冲
Screen('DrawTexture',windowptr,textureIndex);%写入缓冲
Screen('Flip',windowptr);%呈现
Screen('Close' , textureIndex);%清空纹理缓冲释放内存