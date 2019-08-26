function drawstidot(w,stitype,x,y,d,color,textsize)


if stitype==1 %Ë®Æ½
    x1=x-d/2;
    x2=x+d/2;
    y1=y;
    y2=y;
elseif stitype==2 %´¹Ö±
    x1=x;
    x2=x;
    y1=y-d/2;
    y2=y+d/2;
end

str=double('¡¤');
oldsize=Screen('TextSize',w,textsize);
drect=Screen('TextBounds',w,str);

sx=x1-drect(3)/2;
sy=y1-drect(4)/2;
Screen('DrawText',w,str,sx,sy,color);

sx=x2-drect(3)/2;
sy=y2-drect(4)/2;
Screen('DrawText',w,str,sx,sy,color);

Screen('TextSize',w,oldsize);