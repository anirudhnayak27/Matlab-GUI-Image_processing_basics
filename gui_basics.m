function varargout = gui_basics(varargin)
% GUI_BASICS MATLAB code for gui_basics.fig
%      GUI_BASICS, by itself, creates a new GUI_BASICS or raises the existing
%      singleton*.
%
%      H = GUI_BASICS returns the handle to a new GUI_BASICS or the handle to
%      the existing singleton*.
%
%      GUI_BASICS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_BASICS.M with the given input arguments.
%
%      GUI_BASICS('Property','Value',...) creates a new GUI_BASICS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_basics_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_basics_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_basics

% Last Modified by GUIDE v2.5 04-Sep-2023 22:31:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_basics_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_basics_OutputFcn, ...
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


% --- Executes just before gui_basics is made visible.
function gui_basics_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_basics (see VARARGIN)

% Choose default command line output for gui_basics
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_basics wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_basics_OutputFcn(hObject, eventdata, handles) 
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
% Load the image
global a;
try
    [filename,pathname]=uigetfile("*.*",'Pick a image');
    filename=strcat(pathname,filename);
    a=imread(filename);
    %a = imnoise(a,'salt & pepper',0.4);
    % Display the image in the axes
    axes(handles.axes1);
    imshow(a);
catch
    errordlg('Image not found or cannot be displayed.', 'Image Error');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
b=rgb2gray(a);
axes(handles.axes2);
imshow(b);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
c=im2bw(a);
axes(handles.axes3);
imshow(c);
