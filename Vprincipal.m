function varargout = Vprincipal(varargin)
% VPRINCIPAL MATLAB code for Vprincipal.fig
%      VPRINCIPAL, by itself, creates a new VPRINCIPAL or raises the existing
%      singleton*.
%
%      H = VPRINCIPAL returns the handle to a new VPRINCIPAL or the handle to
%      the existing singleton*.
%
%      VPRINCIPAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VPRINCIPAL.M with the given input arguments.
%
%      VPRINCIPAL('Property','Value',...) creates a new VPRINCIPAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Vprincipal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Vprincipal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Vprincipal

% Last Modified by GUIDE v2.5 30-Nov-2016 16:21:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Vprincipal_OpeningFcn, ...
                   'gui_OutputFcn',  @Vprincipal_OutputFcn, ...
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


% --- Executes just before Vprincipal is made visible.
function Vprincipal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Vprincipal (see VARARGIN)

% Choose default command line output for Vprincipal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Vprincipal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Vprincipal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnInicio.
function btnInicio_Callback(hObject, eventdata, handles)
Vsecundaria;
