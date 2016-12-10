hFig = figure('Menu', 'none', 'Toolbar', 'none', 'color','white');
set(hFig,'Position',[0 0 500 100]);
set(hFig,'name','Pupil+','numbertitle','off');
movegui(hFig, 'center');
%%Step1:
je = javax.swing.JEditorPane('text/html', '<html><img src="file:/D:\Pupil+\PUPIL-Srujana-master\02.gif"/></html>'); %Java editor pane embed in figure to include Gif image, you should place full address of the gif file
[hj, hc] =  javacomponent(je,[],hFig);
set(hc, 'pos', [0,0,130,100]);
text(0.25,0.45,'fks!','fontsize',12,'color','b');
set(gca,'Color','white');
set(gca,'XColor','white');
set(gca,'YColor','white');

%%TO know which ports are being used
[~,res]=system('mode')
ports=regexp(res,'COM\d+','match')'