function varargout = svm_gui(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @svm_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @svm_gui_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before svm_gui is made visible.
function svm_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to svm_gui (see VARARGIN)

% Choose default command line output for svm_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes svm_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = svm_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'Enable','off');

h = msgbox('Acquiring Class 1 Data');
%uiwait(h);

time = 5;
data = adc(time);
%class 1
s = reshape(data,100,time);
f1 = getfeatures(s);
disp 'done acquiring class1'

h = msgbox('Class 1 done; Prepare foe Aquiring Class 2 data.');
uiwait(h);

h = msgbox('Acquiring Class 2 Data','modal');
%uiwait(h);
data = adc(time);
%class 2
s = reshape(data,100,time);
f2 = getfeatures(s);
disp 'done acquiring class2'
h = msgbox('Data Aquisition & Feature extration complete','modal');
uiwait(h);
t1 = [1 1 1 1 1];
t2 = [2 2 2 2 2];
handles.P = [f1 f2];
handles.Tc = [t1 t2];
size(handles.P)
size(handles.Tc)

set(handles.text1,'String', 'Training Data Aquired');
guidata(hObject, handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'Enable','off');
handles.model = svmtrain(handles.Tc',handles.P', '-t 0 -c 1 -g 0.07 -s 0');
[predict_label, handles.accuracy, dec_values] = svmpredict(handles.Tc',handles.P', handles.model); % test the training data
handles.accuracy
guidata(hObject, handles);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'Enable','off');
%uiwait(h);
h = msgbox('Acquiring Data','modal');
time = 1;
data = adc(time);
f = getfeatures(data);
a = svmpredict(0,f', handles.model)
a = num2str(a);
a = ['belongs to class ' a];
h = msgbox(a,'modal');
set(hObject,'Enable','on');