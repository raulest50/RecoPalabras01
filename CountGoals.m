function [america, cali] = CountGoals(txt)

c = 0;
a = 0;

state = 0;
x=1;

while x<=length(txt)
    
    if state==0 && txt(x:x+3)=="cali"
        x = x+4;
    end
    if x>=length(txt)
        break;
    end
    if state==0 && txt(x:x+6)=="america"
        x = x+7;
    end
    if x>=length(txt)
        break;
    end
    if state==0 && txt(x:x+2)=="gol"
        state = 1;
        x = x+3;
    end
    if x>=length(txt)
        break;
    end
    
    if state==1 && txt(x:x+2)=="gol"
        x = x+3;
    end
    if x>=length(txt)
        break;
    end
    if state==1 && txt(x:x+3)=="cali"
        x = x+4;
        state=2;
        c = c+1;
    end
    if x>=length(txt)
        break;
    end
    if state==1 && txt(x:x+6)=="america"
        x = x+7;
        state=2;
        a = a+1;
    end
    if x>=length(txt)
        break;
    end
    
    if state==2 && txt(x:x+2)=="gol"
        x = x+3;
        state=1;
    end
    if x>=length(txt)
        break;
    end
    if state==2 && txt(x:x+3)=="cali"
        x = x+4;
    end
    if x>=length(txt)
        break;
    end
    if state==2 && txt(x:x+6)=="america"
        x = x+7;
    end
    if x>=length(txt)
        break;
    end
    
end


america = a;
cali = c;

