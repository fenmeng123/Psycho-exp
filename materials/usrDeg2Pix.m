function pix = usrDeg2Pix(degree,screen_distance,screen_width) 
screens=Screen('Screens');  screen_num=max(screens);  
[Width]=Screen('WindowSize',screen_num);
pix=tan(degree./2./180.*pi).*screen_distance./screen_width.*2.*Width;  
end