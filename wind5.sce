// Расчет прогноза развития кластера
//////////

f4 = figure('figure_position', [10, 10], 'figure_size', [780, 580], 'auto_resize', 'on', 'background', [33],'figure_name', 'Расчет прогноза развития кластера');

delmenu(f4.figure_id,gettext('File'));
delmenu(f4.figure_id,gettext('?'));
delmenu(f4.figure_id,gettext('Tools'));
delmenu(f4.figure_id,gettext('Edit'));
toolbar(f4.figure_id,'off');
handles.dummy = 0;


global inVector
global outVector
global inCodes

inVector = outVector'; // вектор значений входных переменных
// краткие наименования вх. переменных
inCodes = ['I.1',
'I.2',
'I.3',
'II.1',
'II.2',
'II.3',
'III.1',
'III.2',
'III.3',
'IV.1',
'IV.3'];

//_______________ "Элементы управления"
handles.tx00 = uicontrol(f4, 'Style', 'text', ...
                             'String', ' Расчет прогноза развития кластера', ...
                             'Position', [60 460 620 20], 'FontName','Times New Roman','FontSize',[15]);

handles.tx01 = uicontrol(f4, 'Style', 'text', ...
                             'String', " Показатель     Задайте значение     Балл     Степени истинности высказываний', ...
                             'Position', [10 430 460 20], 'FontName','Arial','FontSize',[12]);
handles.tx02 = uicontrol(f4, 'Style', 'text', 'String', "     низкий           средний         высокий', ...
                             'Position', [257 400 213 20], 'FontName', 'Arial', 'FontSize',[11]);

vertPos = 370:-30:70; // вертикальные координаты строк

handles.txi01 = uicontrol(f4, 'Style', 'text', 'String', " " + inCodes(1), 'Position', [10 vertPos(1) 50 20], 'FontName','Times New Roman','FontSize',[12]);
handles.txi02 = uicontrol(f4, 'Style', 'text', 'String', " " + inCodes(2), 'Position', [10 vertPos(2) 50 20], 'FontName','Times New Roman','FontSize',[12]);
handles.txi03 = uicontrol(f4, 'Style', 'text', 'String', " " + inCodes(3), 'Position', [10 vertPos(3) 50 20], 'FontName','Times New Roman','FontSize',[12]);
handles.txi04 = uicontrol(f4, 'Style', 'text', 'String', " " + inCodes(4), 'Position', [10 vertPos(4) 50 20], 'FontName','Times New Roman','FontSize',[12]);
handles.txi05 = uicontrol(f4, 'Style', 'text', 'String', " " + inCodes(5), 'Position', [10 vertPos(5) 50 20], 'FontName','Times New Roman','FontSize',[12]);
handles.txi06 = uicontrol(f4, 'Style', 'text', 'String', " " + inCodes(6), 'Position', [10 vertPos(6) 50 20], 'FontName','Times New Roman','FontSize',[12]);
handles.txi07 = uicontrol(f4, 'Style', 'text', 'String', " " + inCodes(7), 'Position', [10 vertPos(7) 50 20], 'FontName','Times New Roman','FontSize',[12]);
handles.txi08 = uicontrol(f4, 'Style', 'text', 'String', " " + inCodes(8), 'Position', [10 vertPos(8) 50 20], 'FontName','Times New Roman','FontSize',[12]);
handles.txi09 = uicontrol(f4, 'Style', 'text', 'String', " " + inCodes(9), 'Position', [10 vertPos(9) 50 20], 'FontName','Times New Roman','FontSize',[12]);
handles.txi10 = uicontrol(f4, 'Style', 'text', 'String', " " + inCodes(10), 'Position', [10 vertPos(10) 50 20], 'FontName','Times New Roman','FontSize',[12]);
handles.txi11 = uicontrol(f4, 'Style', 'text', 'String', " " + inCodes(11), 'Position', [10 vertPos(11) 50 20], 'FontName','Times New Roman','FontSize',[12]);

handles.sl01 = uicontrol(f4, 'Style','slider', 'Position',[95 vertPos(1) 100 20],'Callback', 'sl01_callback(handles)', 'Enable', 'off', 'Min',[-1], 'Max', [1], 'Relief','default','SliderStep',[0.01,0.1],'Value',outVector(1));
handles.txsl01 = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [210 vertPos(1) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txN01  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [270 vertPos(1) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txZ01  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [340 vertPos(1) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txP01  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [410 vertPos(1) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');

handles.sl02 = uicontrol(f4, 'Style','slider', 'Position',[95 vertPos(2) 100 20],'Callback', 'sl02_callback(handles)', 'Enable', 'off', 'Min',[-1], 'Max', [1], 'Relief','default','SliderStep',[0.01,0.1],'Value',outVector(2));
handles.txsl02 = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [210 vertPos(2) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txN02  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [270 vertPos(2) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txZ02  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [340 vertPos(2) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txP02  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [410 vertPos(2) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');

handles.sl03 = uicontrol(f4, 'Style','slider', 'Position',[95 vertPos(3) 100 20],'Callback', 'sl03_callback(handles)', 'Enable', 'off', 'Min',[-1], 'Max', [1], 'Relief','default','SliderStep',[0.01,0.1],'Value',outVector(3));
handles.txsl03 = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [210 vertPos(3) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txN03  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [270 vertPos(3) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txZ03  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [340 vertPos(3) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txP03  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [410 vertPos(3) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');

handles.sl04 = uicontrol(f4, 'Style','slider', 'Position',[95 vertPos(4) 100 20],'Callback', 'sl04_callback(handles)', 'Enable', 'off', 'Min',[-1], 'Max', [1], 'Relief','default','SliderStep',[0.01,0.1],'Value',outVector(4));
handles.txsl04 = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [210 vertPos(4) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txN04  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [270 vertPos(4) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txZ04  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [340 vertPos(4) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txP04  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [410 vertPos(4) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');

handles.sl05 = uicontrol(f4, 'Style','slider', 'Position',[95 vertPos(5) 100 20],'Callback', 'sl05_callback(handles)', 'Enable', 'off', 'Min',[-1], 'Max', [1], 'Relief','default','SliderStep',[0.01,0.1],'Value',outVector(5));
handles.txsl05 = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [210 vertPos(5) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txN05  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [270 vertPos(5) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txZ05  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [340 vertPos(5) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txP05  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [410 vertPos(5) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');

handles.sl06 = uicontrol(f4, 'Style','slider', 'Position',[95 vertPos(6) 100 20],'Callback', 'sl06_callback(handles)', 'Enable', 'off', 'Min',[-1], 'Max', [1], 'Relief','default','SliderStep',[0.01,0.1],'Value',outVector(6));
handles.txsl06 = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [210 vertPos(6) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txN06  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [270 vertPos(6) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txZ06  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [340 vertPos(6) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txP06  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [410 vertPos(6) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');

handles.sl07 = uicontrol(f4, 'Style','slider', 'Position',[95 vertPos(7) 100 20],'Callback', 'sl07_callback(handles)', 'Enable', 'off', 'Min',[-1], 'Max', [1], 'Relief','default','SliderStep',[0.01,0.1],'Value',outVector(7));
handles.txsl07 = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [210 vertPos(7) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txN07  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [270 vertPos(7) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txZ07  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [340 vertPos(7) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txP07  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [410 vertPos(7) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');

handles.sl08 = uicontrol(f4, 'Style','slider', 'Position',[95 vertPos(8) 100 20],'Callback', 'sl08_callback(handles)', 'Enable', 'off', 'Min',[-1], 'Max', [1], 'Relief','default','SliderStep',[0.01,0.1],'Value',outVector(8));
handles.txsl08 = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [210 vertPos(8) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txN08  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [270 vertPos(8) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txZ08  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [340 vertPos(8) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txP08  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [410 vertPos(8) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');

handles.sl09 = uicontrol(f4, 'Style','slider', 'Position',[95 vertPos(9) 100 20],'Callback', 'sl09_callback(handles)', 'Enable', 'off', 'Min',[-1], 'Max', [1], 'Relief','default','SliderStep',[0.01,0.1],'Value',outVector(9));
handles.txsl09 = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [210 vertPos(9) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txN09  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [270 vertPos(9) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txZ09  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [340 vertPos(9) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txP09  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [410 vertPos(9) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');

handles.sl10 = uicontrol(f4, 'Style','slider', 'Position',[95 vertPos(10) 100 20],'Callback', 'sl10_callback(handles)', 'Enable', 'off', 'Min',[-1], 'Max', [1], 'Relief','default','SliderStep',[0.01,0.1],'Value',outVector(10));
handles.txsl10 = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [210 vertPos(10) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txN10  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [270 vertPos(10) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txZ10  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [340 vertPos(10) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txP10  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [410 vertPos(10) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');

handles.sl11 = uicontrol(f4, 'Style','slider', 'Position',[95 vertPos(11) 100 20],'Callback', 'sl11_callback(handles)', 'Enable', 'on', 'Min',[-1], 'Max', [1], 'Relief','default','SliderStep',[0.01,0.1],'Value',[0]);
handles.txsl11 = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [210 vertPos(11) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txN11  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [270 vertPos(11) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txZ11  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [340 vertPos(11) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');
handles.txP11  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [410 vertPos(11) 35 20], 'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center');


handles.btCalc2  = uicontrol(f4, 'Style', 'pushbutton', 'String', "Рассчитать прогноз", 'Position', [470 vertPos(2) 230 40], 'FontName','Arial','FontSize',[15], ...
                                'HorizontalAlignment','center', 'Enable', 'on', 'Callback','btCalc2_callback(handles)');

handles.btNext2  = uicontrol(f4, 'Style', 'pushbutton', 'String', "Завершить работу", 'Position', [470 20 230 40], 'FontName','Arial','FontSize',[15], ...
                                'HorizontalAlignment','center', 'Enable', 'off', 'Callback','btNext2_callback(handles)');

handles.txResTxt1  = uicontrol(f4, 'Style', 'text', 'String', " Прогнозная оценка (балл)", 'Position', [470 vertPos(3) 230 20], ...
                                'FontName','Times New Poman','FontSize',[12], 'HorizontalAlignment','left', 'Visible', 'off');
handles.txResTxt2  = uicontrol(f4, 'Style', 'text', 'String', " Прогноз - негативный", 'Position', [470 vertPos(5) 230 20], ...
                                'FontName','Times New Poman','FontSize',[12], 'HorizontalAlignment','left', 'Visible', 'off');
handles.txResTxt3  = uicontrol(f4, 'Style', 'text', 'String', " Прогноз - нейтральный", 'Position', [470 vertPos(7) 230 20], ...
                                'FontName','Times New Poman','FontSize',[12], 'HorizontalAlignment','left', 'Visible', 'off');
handles.txResTxt4  = uicontrol(f4, 'Style', 'text', 'String', " Прогноз - позитивный", 'Position', [470 vertPos(9), 230 20], ...
                                'FontName','Times New Poman','FontSize',[12], 'HorizontalAlignment','left', 'Visible', 'off');
                                
handles.txResVal1  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [470 vertPos(4) 230 20], ...
                                'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center', 'Visible', 'off');

handles.txResVal2  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [470 vertPos(6) 230 20], ...
                                'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center', 'Visible', 'off');
handles.txResVal3  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [470 vertPos(8) 230 20], ...
                                'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center', 'Visible', 'off');
handles.txResVal4  = uicontrol(f4, 'Style', 'text', 'String', "0.0", 'Position', [470 vertPos(10) 230 20], ...
                                'FontName','Arial','FontSize',[12], 'HorizontalAlignment','center', 'Visible', 'off');


sl01_callback(handles);
sl02_callback(handles);
sl03_callback(handles);
sl04_callback(handles);
sl05_callback(handles);
sl06_callback(handles);
sl07_callback(handles);
sl08_callback(handles);
sl09_callback(handles);
sl10_callback(handles);

//////////
// Callbacks are defined as below. Please do not delete the comments as it will be used in coming version
//////////


function sl01_callback(handles)
  global inVector
  r = floor(handles.sl01.Value * 10 + 0.5)/10; // округл до десятых
  inVector(1) = r; 
  set(handles.txsl01, "String", string(r)) // показать балл (четкое значение)
  
  if r <=0 then // для терма Низкий
      set(handles.txN01, "String", string(-r));   
  else
      set(handles.txN01, "String", "0.0");
  end

  if r <=0 then // для терма Средний
      set(handles.txZ01, "String", string(r + 1.0));   
  else
      set(handles.txZ01, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Высокий
      set(handles.txP01, "String", string(r));   
  else
      set(handles.txP01, "String", "0.0");
  end
  return(r)
endfunction

function sl02_callback(handles)
  global inVector
  r = floor(handles.sl02.Value * 10 + 0.5)/10; // округл до десятых
  inVector(2) = r; 
  set(handles.txsl02, "String", string(r)) // показать балл (четкое значение)
  
  if r <=0 then // для терма Низкий
      set(handles.txN02, "String", string(-r));   
  else
      set(handles.txN02, "String", "0.0");
  end

  if r <=0 then // для терма Средний
      set(handles.txZ02, "String", string(r + 1.0));   
  else
      set(handles.txZ02, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Высокий
      set(handles.txP02, "String", string(r));   
  else
      set(handles.txP02, "String", "0.0");
  end
  return(r)
endfunction

function sl03_callback(handles)
  global inVector
  r = floor(handles.sl03.Value * 10 + 0.5)/10; // округл до десятых
  inVector(3) = r; 
  set(handles.txsl03, "String", string(r)) // показать балл (четкое значение)
  
  if r <=0 then // для терма Низкий
      set(handles.txN03, "String", string(-r));   
  else
      set(handles.txN03, "String", "0.0");
  end

  if r <=0 then // для терма Средний
      set(handles.txZ03, "String", string(r + 1.0));   
  else
      set(handles.txZ03, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Высокий
      set(handles.txP03, "String", string(r));   
  else
      set(handles.txP03, "String", "0.0");
  end
  return(r)
endfunction

function sl04_callback(handles)
  global inVector
  r = floor(handles.sl04.Value * 10 + 0.5)/10; // округл до десятых
  inVector(4) = r; 
  set(handles.txsl04, "String", string(r)) // показать балл (четкое значение)
  
  if r <=0 then // для терма Низкий
      set(handles.txN04, "String", string(-r));   
  else
      set(handles.txN04, "String", "0.0");
  end

  if r <=0 then // для терма Средний
      set(handles.txZ04, "String", string(r + 1.0));   
  else
      set(handles.txZ04, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Высокий
      set(handles.txP04, "String", string(r));   
  else
      set(handles.txP04, "String", "0.0");
  end
  return(r)
endfunction

function sl05_callback(handles)
  global inVector
  r = floor(handles.sl05.Value * 10 + 0.5)/10; // округл до десятых
  inVector(5) = r; 
  set(handles.txsl05, "String", string(r)) // показать балл (четкое значение)
  
  if r <=0 then // для терма Низкий
      set(handles.txN05, "String", string(-r));   
  else
      set(handles.txN05, "String", "0.0");
  end

  if r <=0 then // для терма Средний
      set(handles.txZ05, "String", string(r + 1.0));   
  else
      set(handles.txZ05, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Высокий
      set(handles.txP05, "String", string(r));   
  else
      set(handles.txP05, "String", "0.0");
  end
  return(r)
endfunction

function sl06_callback(handles)
  global inVector
  r = floor(handles.sl06.Value * 10 + 0.5)/10; // округл до десятых
  inVector(6) = r; 
  set(handles.txsl06, "String", string(r)) // показать балл (четкое значение)
  
  if r <=0 then // для терма Низкий
      set(handles.txN06, "String", string(-r));   
  else
      set(handles.txN06, "String", "0.0");
  end

  if r <=0 then // для терма Средний
      set(handles.txZ06, "String", string(r + 1.0));   
  else
      set(handles.txZ06, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Высокий
      set(handles.txP06, "String", string(r));   
  else
      set(handles.txP06, "String", "0.0");
  end
  return(r)
endfunction

function sl07_callback(handles)
  global inVector
  r = floor(handles.sl07.Value * 10 + 0.5)/10; // округл до десятых
  inVector(7) = r; 
  set(handles.txsl07, "String", string(r)) // показать балл (четкое значение)
  
  if r <=0 then // для терма Низкий
      set(handles.txN07, "String", string(-r));   
  else
      set(handles.txN07, "String", "0.0");
  end

  if r <=0 then // для терма Средний
      set(handles.txZ07, "String", string(r + 1.0));   
  else
      set(handles.txZ07, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Высокий
      set(handles.txP07, "String", string(r));   
  else
      set(handles.txP07, "String", "0.0");
  end
  return(r)
endfunction

function sl08_callback(handles)
  global inVector
  r = floor(handles.sl08.Value * 10 + 0.5)/10; // округл до десятых
  inVector(8) = r; 
  set(handles.txsl08, "String", string(r)) // показать балл (четкое значение)
  
  if r <=0 then // для терма Низкий
      set(handles.txN08, "String", string(-r));   
  else
      set(handles.txN08, "String", "0.0");
  end

  if r <=0 then // для терма Средний
      set(handles.txZ08, "String", string(r + 1.0));   
  else
      set(handles.txZ08, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Высокий
      set(handles.txP08, "String", string(r));   
  else
      set(handles.txP08, "String", "0.0");
  end
  return(r)
endfunction

function sl09_callback(handles)
  global inVector
  r = floor(handles.sl09.Value * 10 + 0.5)/10; // округл до десятых
  inVector(9) = r; 
  set(handles.txsl09, "String", string(r)) // показать балл (четкое значение)
  
  if r <=0 then // для терма Низкий
      set(handles.txN09, "String", string(-r));   
  else
      set(handles.txN09, "String", "0.0");
  end

  if r <=0 then // для терма Средний
      set(handles.txZ09, "String", string(r + 1.0));   
  else
      set(handles.txZ09, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Высокий
      set(handles.txP09, "String", string(r));   
  else
      set(handles.txP09, "String", "0.0");
  end
  return(r)
endfunction

function sl10_callback(handles)
  global inVector
  r = floor(handles.sl10.Value * 10 + 0.5)/10; // округл до десятых
  inVector(10) = r; 
  set(handles.txsl10, "String", string(r)) // показать балл (четкое значение)
  
  if r <=0 then // для терма Низкий
      set(handles.txN10, "String", string(-r));   
  else
      set(handles.txN10, "String", "0.0");
  end

  if r <=0 then // для терма Средний
      set(handles.txZ10, "String", string(r + 1.0));   
  else
      set(handles.txZ10, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Высокий
      set(handles.txP10, "String", string(r));   
  else
      set(handles.txP10, "String", "0.0");
  end
  return(r)
endfunction

function sl11_callback(handles)
  global inVector
  r = floor(handles.sl11.Value * 10 + 0.5)/10; // округл до десятых
  inVector(11) = r; 
  set(handles.txsl11, "String", string(r)) // показать балл (четкое значение)
  
  if r <=0 then // для терма Низкий
      set(handles.txN11, "String", string(-r));   
  else
      set(handles.txN11, "String", "0.0");
  end

  if r <=0 then // для терма Средний
      set(handles.txZ11, "String", string(r + 1.0));   
  else
      set(handles.txZ11, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Высокий
      set(handles.txP11, "String", string(r));   
  else
      set(handles.txP11, "String", "0.0");
  end
  return(r)
endfunction


// Расчет интегральных показателей
function btCalc2_callback(handles)
  global inVector // вектор входов
  global inCodes  // обoзначения вх переменнных
  global outVector  // вектор выходов
  
  exec("fis_V.sci")
  
  // вызов процедур нечеткого вывода
  r = fis_V(inVector, inCodes); // четкое значение прогноза
  
  // Отображаем округленные результаты
  r = floor(r * 10 + 0.5*sign(r))/10;
  set(handles.txResVal1, "String", string(r));
  
  if r <=0 then // для терма Негативный
      set(handles.txResVal2, "String", string(-r));   
  else
      set(handles.txResVal2, "String", "0.0");
  end

  if r <=0 then // для терма Нейтральный
      set(handles.txResVal3, "String", string(r + 1.0));   
  else
      set(handles.txResVal3, "String", string(1.0 - r));
  end

  if r >=0 then // для терма Позитивный
      set(handles.txResVal4, "String", string(r));   
  else
      set(handles.txResVal4, "String", "0.0");
  end
    
  set(handles.txResTxt1, "Visible", "on");
  set(handles.txResVal1, "Visible", "on");
  set(handles.txResTxt2, "Visible", "on");
  set(handles.txResVal2, "Visible", "on");
  set(handles.txResTxt3, "Visible", "on");
  set(handles.txResVal3, "Visible", "on");
  set(handles.txResTxt4, "Visible", "on");
  set(handles.txResVal4, "Visible", "on");

  // разрешаем переход к след. этапу
  set(handles.btNext2, "Enable", "on");
endfunction

// Продолжить
function btNext2_callback(handles)
   global stage
   stage(5) = 1; // 5 этап успешно завершен
   close(f4)  // закрыть окно
endfunction


