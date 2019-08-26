function drawdotcenteredtext(wptr,str,x,y,color,textsize)



str=double(str);
oldsize=Screen('TextSize',wptr,textsize);

drect=Screen('TextBounds',wptr,str);

sx=x-drect(3)/2;
sy=y-drect(4)/2;

Screen('DrawText',wptr,str,sx,sy,color);
Screen('TextSize',wptr,oldsize);