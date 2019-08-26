function drawfix(w,fixsize,xc,yc)

Screen('DrawLine',w,255,xc-fixsize/2,yc,xc+fixsize/2,yc,3);
Screen('DrawLine',w,255,xc,yc-fixsize/2,xc,yc+fixsize/2,3);

