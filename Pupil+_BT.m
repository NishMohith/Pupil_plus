%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author  : Chakri.M                                                 %
% Date    : 18/07/2016                                               %
% Project : Pupil +                                                  %
% About   : This MATLAB script is a GUI that searches and conencts   %
%           Pupil+ bluetooth module. First, you've to switch on      %
%           bluetooth manually on your PC manually.Pair the device   %
%           when prompt.                                             %
% BT module : HC-05                                                  %
%             Password : 1234                                        %
%             Device Id : Pupil+                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;
global switcher;
global bt;
hFig = figure('Menu', 'none', 'Toolbar', 'none', 'color','white');
set(hFig,'Position',[0 0 500 100]);
set(hFig,'name','Pupil+','numbertitle','off');
movegui(hFig, 'center');
%%Step1:
je = javax.swing.JEditorPane('text/html', '<html><img src="file:/D:\Pupil+\PUPIL-Srujana-master\02.gif"/></html>'); %Java editor pane embed in figure to include Gif image, you should place full address of the gif file
[hj, hc] =  javacomponent(je,[],hFig);
set(hc, 'pos', [0,0,130,100]);
%set(gcf,'Color', 'white');
cfr = 1;

%%Step2:
switcher = 1;
while strcmp(get(hFig, 'name'), 'Pupil+') && cfr == 1 %instrumentation toolbox Bluetooth control,
    if switcher == 1                                  %strcmp is used to exit the loop and close window and process when user closes the window
        clf;
        text(0.25,0.45,'Switch Bluetooth on in your PC..., Please!','fontsize',12,'color','b');
        set(gca,'Color','white');
        set(gca,'XColor','white');
        set(gca,'YColor','white');
        pause(10);
        clf;
        switcher =2;
    elseif switcher == 2
        text(0.25,0.45,'Searching nearby BT devices...','fontsize',12,'color','b');
        set(gca,'Color','white');
        set(gca,'XColor','white');
        set(gca,'YColor','white');
        pause(2);
        bt=instrhwinfo('Bluetooth');
        avlb = bt.RemoteNames();
        conf=0;
        if ~isempty(avlb)
            for i=1:length(avlb)
                if strcmp('Pupil+', avlb(i))
                    conf=1;
                end
            end
        else
            conf = 0;
        end
        clf;
        if conf==1
            pup='Pupil+ is detected...';
            text(0.25,0.45,pup,'fontsize',12,'color','b');
            set(gca,'Color','white');
            set(gca,'XColor','white');
            set(gca,'YColor','white');
            switcher = 3;
            pause(1);
            clf;
        elseif conf == 0
            pup='Pupil+ is not detected...';
            text(0.25,0.45,pup,'fontsize',12,'color','b');
            set(gca,'Color','white');
            set(gca,'XColor','white');
            set(gca,'YColor','white');
            pause(1);
            switcher = 1;
        end
    elseif switcher == 3
        pup='Connecting to Pupil+...';
        text(0.25,0.45,pup,'fontsize',12,'color','b');
        set(gca,'Color','white');
        set(gca,'XColor','white');
        set(gca,'YColor','white');
        clf;
        try
            bt1 = Bluetooth('Pupil+', 1);
            fopen(bt1);
            switcher = 4;
        catch
            text(0.25,0.45,'An error occured, Reconnecting...','fontsize',12,'color','b');
            set(gca,'Color','white');
            set(gca,'XColor','white');
            set(gca,'YColor','white');
            pause(1);
            switcher = 2;
            clf;
        end
    elseif switcher == 4
        cfr=2;
        text(0.25,0.45,'Pupil+ is successfully connected...','fontsize',12,'color','b');
        set(gca,'Color','white');
        set(gca,'XColor','white');
        set(gca,'YColor','white');
        pause(1);
        break;
    end
end
close all;
%hFig = figure('Menu', 'none', 'Toolbar', 'none', 'color','white');
