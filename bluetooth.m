global bt1;
global bt;
port=instrhwinfo('serial');
list=port.AvailableSerialPorts;
if isempty(list)
    msgbox('Please Connect the Bluetooth module and restart MATLAB')
else
    need=list(length(list));
    s=serial(need{1});
end
fopen(s);
fwrite(s,'x','char');
fclose(s);
clear('s');