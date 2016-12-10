function begin_test(~, ~, val)
% A simple function to update the value of the global variable record,
% which is read by the process_videos_func callback function which is
% called every time the preview window updates. This will tell it to start
% and stop the test.

global area_pupil_right;
global area_pupil_left;
global time_right;
global time_left;
global record;
global bt1;
global bt;
global stop;
global im_left;
global im_right;
global tstampstr_left;
global tstampstr_right;
global s

im_left = [];
im_right = [];
tstampstr_left = [];
tstampstr_right = [];

area_pupil_right = [];
area_pupil_left = [];
time_left = [];
time_right = [];

display('DO Record')

stop = 0;
record = str2num(val);
%hFig = figure('Menu', 'none', 'Toolbar', 'none', 'color','white');
%set(hFig,'Position',[0 0 500 100]);
%set(hFig,'name','Pupil+','numbertitle','off');
%movegui(hFig, 'center');
%je = javax.swing.JEditorPane('text/html', '<html><img src="file:/D:\Pupil+\PUPIL-Srujana-master\02.gif"/></html>'); %Java editor pane embed in figure to include Gif image, you should place full address of the gif file
%[hj, hc] =  javacomponent(je,[],hFig);
%set(hc, 'pos', [0,0,130,100]);
%text(0.25,0.45,'Searching for Devices....!','fontsize',12,'color','b');
%set(gca,'Color','white');
%set(gca,'XColor','white');
%set(gca,'YColor','white');
%pause(10);
%if bt1 == Bluetooth('PUPILv2',1)
%    clk;
%    text(0.25,0.45,'Bluetooth is Connected','fontsize',12,'color','b');
%    set(gca,'Color','white');
%    set(gca,'XColor','white');
%    set(gca,'YColor','white');
%    pause(2);
%    clf;
%else
%    text(0.25,0.45,'Searching for Devices....!','fontsize',12,'color','b');
%    set(gca,'Color','white');
%    set(gca,'XColor','white');
%    set(gca,'YColor','white');
%    pause(10);
%    bt=instrhwinfo('Bluetooth');
%    avlb=bt.RemoteNames();
%    conf=1;
%    if isempty(avlb)
%        conf = 0;
%    else
%        for i=1:length(avlb)
%            if strcmp('PUPILv2', avlb(i))
%                bt1=Bluetooth('PUPILv2',1)
%                try
%                    fopen(bt1);
%                catch
%                    conf=0;
%                end
%            end
%        end
%    end
%    if conf==1
%        clf;
%        text(0.25,0.45,'Bluetooth is Connected','fontsize',12,'color','b');
%        set(gca,'Color','white');
%        set(gca,'XColor','white');
%        set(gca,'YColor','white');
%        pause(2);
%        clf;
%    else
%        clf;
%        text(0.25,0.45,'No bluetooth device found','fontsize',12,'color','b');
%        set(gca,'Color','white');
%        set(gca,'XColor','white');
%        set(gca,'YColor','white');
%        pause(10);
%        clf;
%    end    
%end
%fprintf(arduino, 's');
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