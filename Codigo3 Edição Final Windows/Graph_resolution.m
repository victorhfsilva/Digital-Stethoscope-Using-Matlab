function [handles,res,resy,resy_auto,lat]=Graph_resolution(handles)

%% Leitura da Resolu��o dos Gr�ficos

% Leitura dos valores das Configura��es Iniciais dos Gr�ficos
resy_matrix = get(handles.resy, "String");
res_matrix = get(handles.res, "String");
lat_matrix = get(handles.lat, "String");

resy_index = get(handles.resy, "Value");
res_index = get(handles.res, "Value");
lat_index = get(handles.lat,"Value");
resy_auto = get(handles.resy_auto, "Value");

resy=str2num(cell2mat(resy_matrix(resy_index)));
res=str2num(cell2mat(res_matrix(res_index)));
lat_samples=str2num(cell2mat(lat_matrix(lat_index)));
lat=(lat_samples/44100);

% Declara��o dos callbacks das janelas de configura��o do gr�fico

% Eixo x
res_callback = [...
'res_matrix = get(handles.res, "String");'...
'res_index = get(handles.res, "Value");'...
'res=str2num(cell2mat(res_matrix(res_index)));'];
set(handles.res, 'Callback', res_callback);

% Eixo y
resy_callback = [...
'resy_matrix = get(handles.resy, "String");'...
'resy_index = get(handles.resy, "Value");'...
'resy=str2num(cell2mat(resy_matrix(resy_index)));'];
set(handles.resy, 'Callback', resy_callback);

% Profundidade de bits
lat_callback = [...
    'lat_matrix = get(handles.lat, "String");'...
    'lat_index = get(handles.lat, "Value");'...
    'lat_samples = str2num(cell2mat(lat_matrix(lat_index)));'...
    'lat=(lat_samples/44100);'];
set(handles.lat, 'Callback', lat_callback); 
   
% Declara��o do callback da op��o de autom�tico de eixo y
resy_auto_callback = ['resy_auto = get(handles.resy_auto, "Value");'];
set(handles.resy_auto, 'Callback', resy_auto_callback);

end