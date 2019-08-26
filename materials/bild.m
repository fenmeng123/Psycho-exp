function bild(w,x,y,z,array)

texid=Screen('MakeTexture',w,array);

[m,n,~]=size(array);

disprect=[x-n/2*z,y-m/2*z,x+n/2*z,y+m/2*z];

Screen('DrawTexture',w,texid,[],disprect);

Screen('Close',texid);