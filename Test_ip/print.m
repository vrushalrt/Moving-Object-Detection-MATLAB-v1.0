function varargout = print(varargin)
% PRINT MATLAB code for print.fig
%      PRINT, by itself, creates a new PRINT or raises the existing
%      singleton*.
%
%      H = PRINT returns the handle to a new PRINT or the handle to
%      the existing singleton*.
%
%      PRINT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRINT.M with the given input arguments.
%
%      PRINT('Property','Value',...) creates a new PRINT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before print_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to print_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help print

% Last Modified by GUIDE v2.5 15-Mar-2015 14:36:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @print_OpeningFcn, ...
                   'gui_OutputFcn',  @print_OutputFcn, ...
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


% --- Executes just before print is made visible.
function print_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to print (see VARARGIN)

% Choose default command line output for print
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes print wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = print_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global labels;
