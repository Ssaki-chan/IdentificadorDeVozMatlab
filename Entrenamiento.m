function varargout = Entrenamiento(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Entrenamiento_OpeningFcn, ...
                   'gui_OutputFcn',  @Entrenamiento_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function Entrenamiento_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
handles.cDiana = 0;
handles.cJair = 0;
handles.cGenaro = 0;
handles.cJurgen = 0;
guidata(hObject, handles);

function varargout = Entrenamiento_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtUsuario_Callback(hObject, eventdata, handles)
% hObject    handle to txtUsuario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtUsuario as text
%        str2double(get(hObject,'String')) returns contents of txtUsuario as a double


% --- Executes during object creation, after setting all properties.
function txtUsuario_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtUsuario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnGrabar.
function btnGrabar_Callback(hObject, eventdata, handles)
Fs=22050;
objetoaudio=audiorecorder(Fs,16,1);
recordblocking(objetoaudio,5);
s= getaudiodata(objetoaudio)
audiowrite('Prueba.wav',s,Fs)
lon=length(s);
d=max(abs(s));
s=s/d;
prom=sum(s.*s)/lon;
umbral=0.02;
y=[0];

for i= 1:400:lon-400
    seg=s(i:i+399);
    e=sum(seg.*seg)/400;
    %Si el promedio energetico es mayor qe la señal completa por el valor
    %umbral
    if (e> umbral*prom)
        %Almacena en (y) si no es eliminado
        y=[y;seg(1:end)];
end;
end;
nombreU=get(handles.txtUsuario,'String');
if strcmp (nombreU,'jair')
    NombrePista=strcat(nombreU,num2str(handles.cJair),'.wav');
    audiowrite(NombrePista,s,Fs)
    handles.cJair = handles.cJair + 1;
    if handles.cJair==2
        [rec1]=audioread('Jair0.wav')
        [rec2]=audioread('Jair1.wav')
        tam=length(rec2);
        for i=1:1:tam;
            prom(i)=((rec1(i)+rec2(i))/2);
        end;
        lon=length(prom);
        d=max(abs(prom));
        audiowrite('Jairprom.wav',prom,Fs);
        %plot(prom)
        %sound(prom,Fs)
    end;
elseif strcmp (nombreU,'diana')
    NombrePista=strcat(nombreU,num2str(handles.cDiana),'.wav');
    audiowrite(NombrePista,s,Fs)
    handles.cDiana = handles.cDiana + 1;
        if handles.cDiana==2
        [rec1]=audioread('Diana0.wav')
        [rec2]=audioread('Diana1.wav')
        tam=length(rec2);
        for i=1:1:tam;
            prom(i)=((rec1(i)+rec2(i))/2);
        end;
        lon=length(prom);
        d=max(abs(prom));
        audiowrite('Dianaprom.wav',prom,Fs);
        %plot(prom)
        %sound(prom,Fs)
    end;
elseif strcmp (nombreU,'genaro')
  NombrePista=strcat(nombreU,num2str(handles.cGenaro),'.wav');
    audiowrite(NombrePista,s,Fs)
    handles.cGenaro = handles.cGenaro + 1;
        if handles.cGenaro==2
        [rec1]=audioread('Genaro0.wav')
        [rec2]=audioread('Genaro1.wav')
        tam=length(rec2);
        for i=1:1:tam;
            prom(i)=((rec1(i)+rec2(i))/2);
        end;
        lon=length(prom);
        d=max(abs(prom));
        audiowrite('Genaroprom.wav',prom,Fs);
        %plot(prom)
        %sound(prom,Fs)
    end;
elseif strcmp (nombreU,'jurgen')
    NombrePista=strcat(nombreU,num2str(handles.cJurgen),'.wav');
    audiowrite(NombrePista,s,Fs)
    handles.cJurgen = handles.cJurgen + 1;
          if handles.cJurgen==2
        [rec1]=audioread('Jurgen0.wav')
        [rec2]=audioread('Jurgen1.wav')
        tam=length(rec2);
        for i=1:1:tam;
            prom(i)=((rec1(i)+rec2(i))/2);
        end;
        lon=length(prom);
        d=max(abs(prom));
        audiowrite('Jurgenprom.wav',prom,Fs);
        %plot(prom)
        %sound(prom,Fs)
    end;
  end;
AgregarLista= get(handles.listbox1,'String');
if ischar(AgregarLista); AgregarLista=cellstr(AgregarLista);end
AgregarLista=[AgregarLista;NombrePista];
set(handles.listbox1,'String',AgregarLista)
guidata(hObject, handles);

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnretorno.
function btnretorno_Callback(hObject, eventdata, handles)
clear,clc, close all
Vsecundaria;
