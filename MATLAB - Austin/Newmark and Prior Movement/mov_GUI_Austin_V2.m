function varargout = mov_GUI_Austin_V2(varargin)
% MOV_GUI_AUSTIN_V2 MATLAB code for mov_GUI_Austin_V2.fig
%      MOV_GUI_AUSTIN_V2, by itself, creates a new MOV_GUI_AUSTIN_V2 or raises the existing
%      singleton*.
%
%      H = MOV_GUI_AUSTIN_V2 returns the handle to a new MOV_GUI_AUSTIN_V2 or the handle to
%      the existing singleton*.
%
%      MOV_GUI_AUSTIN_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOV_GUI_AUSTIN_V2.M with the given input arguments.
%
%      MOV_GUI_AUSTIN_V2('Property','Value',...) creates a new MOV_GUI_AUSTIN_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mov_GUI_Austin_V2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mov_GUI_Austin_V2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mov_GUI_Austin_V2

% Last Modified by GUIDE v2.5 22-Jul-2016 13:51:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mov_GUI_Austin_V2_OpeningFcn, ...
                   'gui_OutputFcn',  @mov_GUI_Austin_V2_OutputFcn, ...
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


% --- Executes just before mov_GUI_Austin_V2 is made visible.
function mov_GUI_Austin_V2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mov_GUI_Austin_V2 (see VARARGIN)

% Choose default command line output for mov_GUI_Austin_V2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mov_GUI_Austin_V2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mov_GUI_Austin_V2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% NEWMARK CONTROLLER

% --- Executes on button press in z_pos_newmark.
%%  Z+ BUTTON
function z_pos_newmark_Callback(hObject, eventdata, handles)
% hObject    handle to z_pos_newmark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global newmark_controller
fprintf(newmark_controller, 'AY;UF;');  % Eliminates the current units already assigned to the Newmark
fprintf(newmark_controller, 'AY;UU25;');    % Sets units to mm
user_input = get(handles.input_distance,'String');
user_input = int2str(round(str2double(user_input))); 
fprintf(newmark_controller, ['AY;MR-' user_input ';GO;']); 
disp(['AX;MR' user_input])

% --- Executes on button press in z_neg_newmark.
function z_neg_newmark_Callback(hObject, eventdata, handles)
%%  Z- BUTTON
% hObject    handle to z_neg_newmark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global newmark_controller;
fprintf(newmark_controller, 'AY;UF;'); % Eliminates the current units already assigned to the Newmark
fprintf(newmark_controller, 'AY;UU25;');    % Sets units to mm
user_input = get(handles.input_distance,'String');
user_input = int2str(round(str2double(user_input)));
fprintf(newmark_controller, ['AY;MR' user_input ';GO;']);
disp(['AX;MR-' user_input])

% --- Executes on button press in x_pos_newmark.
function x_pos_newmark_Callback(hObject, eventdata, handles)
%%  X+ BUTTON
% hObject    handle to x_pos_newmark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global newmark_controller;
fprintf(newmark_controller, 'AX;UF;');  % Eliminates the current units already assigned to the Newmark
fprintf(newmark_controller, 'AX;UU25;');    %Sets units to mm
user_input = get(handles.input_distance,'String'); 
user_input = int2str(round(str2double(user_input)));
fprintf(newmark_controller, ['AX;MR' user_input ';GO;']);
disp(['AX;MR' user_input])

% --- Executes on button press in x_neg_newmark.
function x_neg_newmark_Callback(hObject, eventdata, handles)
%%  X- BUTTON
% hObject    handle to x_neg_newmark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global newmark_controller;
fprintf(newmark_controller, 'AX;UF;');  % Eliminates the current units already assigned to the Newmark
fprintf(newmark_controller, 'AX;UU25;');    % Sets units to mm
user_input = get(handles.input_distance,'String');
user_input = int2str(round(str2double(user_input)));
fprintf(newmark_controller, ['AX;MR-' user_input ';GO;']);
disp(['AX;MR-' user_input])

% --- Executes on button press in connect_to_newmark.
function connect_to_newmark_Callback(hObject, eventdata, handles)
%% CONNECT TO SCOPE - NEWMARK
% hObject    handle to connect_to_newmark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global newmark_controller
com_port = 'COM6';
newmark_controller = serial(com_port, 'BaudRate',9600);
if isvalid(newmark_controller)
    fclose(newmark_controller)
    fopen(newmark_controller);
    display('Newmark Controller Connected')
    set(handles.disconnect_from_newmark, 'Enable','on')
    set(handles.connect_to_newmark,'Enable','off')
else
    warndlg('Serial port is not valid')
end

% --- Executes on button press in disconnect_from_newmark.
function disconnect_from_newmark_Callback(hObject, eventdata, handles)
%% DISCONNECT FROM SCOPE - NEWMARK
% hObject    handle to disconnect_from_newmark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global newmark_controller; 
fclose(newmark_controller);
display('Newmark Controller Disconnected');
set (handles.disconnect_from_newmark,'Enable','off')
set(handles.connect_to_newmark,'Enable','on')

function input_distance_newmark_Callback(hObject, eventdata, handles)
%% DISTANCE
% hObject    handle to input_distance_newmark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_distance_newmark as text
%        str2double(get(hObject,'String')) returns contents of input_distance_newmark as a double
input_distance = str2double(get(hObject,'String'));
if isnan(input_distance) || ~isreal(input_distance) %If input is a real number - enable Z+,Z-,X+,X- buttons
    set(handles.z_pos_new,'Enable','off')
    set(handles.z_neg_new,'Enable','off')
    set(handles.x_pos_new,'Enable','off')
    set(handles.x_neg_new,'Enable','off')
    uicontrol(hObject)
else
    set(handles.z_pos_new,'Enable','on')    %If input is not a real number - disable Z+,Z-,X+,X- buttons
    set(handles.z_neg_new,'Enable','on')
    set(handles.x_pos_new,'Enable','on')
    set(handles.x_neg_new,'Enable','on')
end
%% PRIOR PANEL

% --- Executes on button press in z_pos_prior.
function z_pos_prior_Callback(hObject, eventdata, handles)
%% Z+ BUTTON
% hObject    handle to z_pos_prior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prior_controller;
str1 = sprintf('RES,s,1.0\r\n'); %Sets units of movement to microns
fwrite(prior_controller, str1); %Write to prior
user_input = get(handles.input_distance_prior,'String'); %Obtain input_distance
user_input = round(str2double(user_input));
str2 = sprintf('GR,0,0,%d\r\n',user_input); %GR - Go Relative - move function for prior
fwrite(prior_controller, str2);  
disp(str2) 

% --- Executes on button press in z_neg_prior.
function z_neg_prior_Callback(hObject, eventdata, handles)
%% Z- BUTTON
% hObject    handle to z_neg_prior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prior_controller;
str1 = sprintf('RES,s,1.0\r\n'); %Sets units of movement to microns
fwrite(prior_controller, str1); %Write to prior
user_input = get(handles.input_distance_prior,'String'); %Obtain input_distance
user_input = round(str2double(user_input));
str2 = sprintf('GR,0,0,-%d\r\n',user_input); %GR - Go Relative - move function for prior
fwrite(prior_controller, str2);  
disp(str2) 

% --- Executes on button press in y_pos_prior.
function y_pos_prior_Callback(hObject, eventdata, handles)
%% Y+ BUTTON
% hObject    handle to y_pos_prior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prior_controller;
str1 = sprintf('RES,s,1.0\r\n'); %Sets units of movement to microns
fwrite(prior_controller, str1); %Write to prior
user_input = get(handles.input_distance_prior,'String'); %Obtain input_distance
user_input = round(str2double(user_input));
str2 = sprintf('GR,0,-%d,0\r\n',user_input); %GR - Go Relative - move function for prior
fwrite(prior_controller, str2);  
disp(str2) 

% --- Executes on button press in y_neg_prior.
function y_neg_prior_Callback(hObject, eventdata, handles)
%%  Y- BUTTON
% hObject    handle to y_neg_prior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prior_controller;
str1 = sprintf('RES,s,1.0\r\n'); %Sets units of movement to microns
fwrite(prior_controller, str1); %Write to prior
user_input = get(handles.input_distance_prior,'String'); %Obtain input_distance
user_input = round(str2double(user_input));
str2 = sprintf('GR,0,%d,0\r\n',user_input); %GR - Go Relative - move function for prior
fwrite(prior_controller, str2);  
disp(str2) 

% --- Executes on button press in x_pos_prior.
function x_pos_prior_Callback(hObject, eventdata, handles)
%% X+ BUTTON
% hObject    handle to x_pos_prior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prior_controller;
str1 = sprintf('RES,s,1.0\r\n'); %Sets units of movement to microns
fwrite(prior_controller, str1); %Write to prior
user_input = get(handles.input_distance_prior,'String'); %Obtain input_distance
user_input = round(str2double(user_input));
str2 = sprintf('GR,%d,0,0\r\n',user_input); %GR - Go Relative - move function for prior
fwrite(prior_controller, str2);  
disp(str2) 

% --- Executes on button press in x_neg_prior.
function x_neg_prior_Callback(hObject, eventdata, handles)
%% X- BUTTON
% hObject    handle to x_neg_prior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prior_controller;
str1 = sprintf('RES,s,1.0\r\n'); %Sets units of movement to microns
fwrite(prior_controller, str1); %Write to prior
user_input = get(handles.input_distance_prior,'String'); %Obtain input_distance
user_input = round(str2double(user_input));
str2 = sprintf('GR,-%d,0,0\r\n',user_input); %GR - Go Relative - move function for prior
fwrite(prior_controller, str2);  
disp(str2)

% --- Executes on button press in connect_to_prior.
function connect_to_prior_Callback(hObject, eventdata, handles)
%% CONNECT TO SCOPE - PRIOR
% hObject    handle to connect_to_prior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prior_controller
com_port = 'COM1';
prior_controller = serial(com_port, 'BaudRate',9600);
if isvalid(prior_controller)
    fclose(prior_controller)
    fopen(prior_controller);
    display('Prior Controller Connected')
    set(handles.disconnect_from_prior, 'Enable','on')
    set(handles.connect_to_prior,'Enable','off')
else
    warndlg('Serial port is not valid')
end

% --- Executes on button press in disconnect_from_prior.
function disconnect_from_prior_Callback(hObject, eventdata, handles)
%% DISCONNECT FROM SCOPE - PRIOR
% hObject    handle to disconnect_from_prior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global prior_controller; 
fclose(prior_controller);
display('Prior Controller Disconnected');
set (handles.disconnect_from_prior,'Enable','off')
set(handles.connect_to_prior,'Enable','on')





% --- Executes during object creation, after setting all properties.
function input_distance_newmark_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_distance_newmark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input_distance_prior_Callback(hObject, eventdata, handles)
%% DISTANCE
% hObject    handle to input_distance_prior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_distance_prior as text
%        str2double(get(hObject,'String')) returns contents of input_distance_prior as a double
input_distance = str2double(get(hObject,'String'));
if isnan(input_distance) || ~isreal(input_distance) %If input is a real number - enable Z+,Z-,X+,X- buttons
    set(handles.z_pos_prior,'Enable','off')
    set(handles.z_neg_prior,'Enable','off')
    set(handles.y_neg_prior,'Enable','off')
    set(handles.y_pos_prior,'Enable','off')
    set(handles.x_pos_prior,'Enable','off')
    set(handles.x_neg_prior,'Enable','off')
    uicontrol(hObject)
else
    set(handles.z_pos_prior,'Enable','on')  %If input is not a real number - disable Z+,Z-,X+,X- buttons
    set(handles.z_neg_prior,'Enable','on')
    set(handles.y_neg_prior,'Enable','on')
    set(handles.y_pos_prior,'Enable','on')    
    set(handles.x_pos_prior,'Enable','on')
    set(handles.x_neg_prior,'Enable','on')
end


% --- Executes during object creation, after setting all properties.
function input_distance_prior_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_distance_prior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
