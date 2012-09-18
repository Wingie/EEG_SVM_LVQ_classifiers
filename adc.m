%function v = adc(ns)
ns=10;
numSec=ns*100;
t=[];
v=[];

s1 = serial('COM7');    
s1.BaudRate=9600;     
set(s1, 'terminator', 'LF');
fopen(s1)

try                         
                            
    w=fscanf(s1,'%s');      
    w=fscanf(s1,'%s'); 

    i=0;
    t0=tic;
    while (i<numSec)
        i=i+1;
        t(i)=toc(t0);
        t(i)=t(i)-t(1);
        v(i)=fscanf(s1,'%d')
    end

    fclose(s1);
    figure(2);
    plot(v);
catch me
    fclose(s1);                
end       