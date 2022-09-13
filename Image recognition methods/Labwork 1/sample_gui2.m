function varargout = Lab_3(varargin)
% LAB_3 MATLAB code for Lab_3.fig
% LAB_3, by itself, creates a new LAB_3 or raises the existing
% singleton*.
%
% H = LAB_3 returns the handle to a new LAB_3 or the handle to
% the existing singleton*.
%
% LAB_3('CALLBACK',hObject,eventData,handles,...) calls the local
% function named CALLBACK in LAB_3.M with the given input arguments.
%
% LAB_3('Property','Value',...) creates a new LAB_3 or raises the
% existing singleton*. Starting from the left, property value pairs are
% applied to the GUI before Lab_3_OpeningFcn gets called. An
% unrecognized property name or invalid value makes property application
% stop. All inputs are passed to Lab_3_OpeningFcn via varargin.
%
%*See GUI Options on GUIDE's Tools menu. Choose "GUI allows only one
%instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help Lab_3
% Last Modified by GUIDE v2.5 03-Oct-2015 13:08:58
% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name', mfilename, ...
    'gui_Singleton', gui_Singleton, ...
    'gui_OpeningFcn', @Lab_3_OpeningFcn, ...
    'gui_OutputFcn', @Lab_3_OutputFcn, ...
    'gui_LayoutFcn', [] , ...
    'gui_Callback', []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
% --- Executes just before Lab_3 is made visible.
function Lab_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject
handle to figure
% eventdata reserved - to be defined in a future version of MATLAB
% handles
structure with handles and user data (see GUIDATA)
% varargin
command line arguments to Lab_3 (see VARARGIN)
% Choose default command line output for Lab_3
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes Lab_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = Lab_3_OutputFcn(hObject, eventdata, handles)
% varargout cell array for returning output args (see VARARGOUT);
% hObject
handle to figure
% eventdata reserved - to be defined in a future version of MATLAB
% handles
structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;