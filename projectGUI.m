function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 26-Jan-2016 17:59:01


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)

%the output vector for the read wave
global wavVector  
%the output FS for the read wave
global wavFS  
% boolean that is true when the wav file is played
global play  
% string that contains the filter type
global filterType  
% currnet Filter
global currnetFilter  
%minimu gain
global minGain  
%minimu gain
global maxGain  
% frequency sample
global FS  
% current gains of the 9 bands
global currentGains  
% number of bands for each filter (9)
global bandsNum  
% output sample rate
global rate  
%signal type
global siganlType
%band to plot
global band


% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% variables initialization
play = false ;
minGain = -30;
maxGain = 30;
FS = 48000;
wavFS = 48000 ;
bandsNum = 9;
currentGains = ones(1,bandsNum);
currnetFilter  = [dfilt.dffir dfilt.dffir dfilt.dffir dfilt.dffir dfilt.dffir dfilt.dffir dfilt.dffir dfilt.dffir dfilt.dffir] ;
filterType = 'FIR (equiripple)';
rate = 1 ;
siganlType = 'input';
band = '0-170' ;



% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
global wavVector 
global wavFS 
[FileName,PathName] = uigetfile({'*.wav'},'File Selector') ;
isOK=true;
if length(FileName)==1
     if FileName==0
         isOK=false;
     end
end
if isOK
    filePath = strcat(PathName,FileName);
    set(handles.filepath,'String',filePath);
    [wavVector wavFS] = wavread(filePath);
end



function filepath_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function filepath_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in filtertype.
function filtertype_Callback(hObject, eventdata, handles)
global filterType 
global currnetFilter 

contents = cellstr(get(hObject,'String')) ;
filterType = contents{get(hObject,'Value')} ;

% --- Executes during object creation, after setting all properties.
function filtertype_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement. (volum)
function volum_Callback(hObject, eventdata, handles)
sliderVal = get(hObject,'Value') ;


% --- Executes during object creation, after setting all properties.
function volum_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement. (0-170 Hz)
function slider2_Callback(hObject, eventdata, handles)
global currentGains 
sliderVal = get(hObject,'Value') ;
currentGains(1) = sliderVal ;
set(handles.gain1,'String',num2str(currentGains(1)));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement. (170-310 Hz)
function slider3_Callback(hObject, eventdata, handles)
global currentGains 
sliderVal = get(hObject,'Value') ;
currentGains(2) = sliderVal ;
set(handles.gain2,'String',num2str(currentGains(2)));

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement. (310-600 Hz)
function slider4_Callback(hObject, eventdata, handles)
global currentGains 
sliderVal = get(hObject,'Value') ;
currentGains(3) = sliderVal ;
set(handles.gain3,'String',num2str(currentGains(3)));

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.(600-1K Hz)
function slider5_Callback(hObject, eventdata, handles)
global currentGains 
sliderVal = get(hObject,'Value') ;
currentGains(4) = sliderVal ;
set(handles.gain4,'String',num2str(currentGains(4)));

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.(1-3 KHz)
function slider6_Callback(hObject, eventdata, handles)
global currentGains 
sliderVal = get(hObject,'Value') ;
currentGains(5) = sliderVal ;
set(handles.gain5,'String',num2str(currentGains(5)));

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.(3-6 KHz)
function slider7_Callback(hObject, eventdata, handles)
global currentGains 
sliderVal = get(hObject,'Value') ;
currentGains(6) = sliderVal ;
set(handles.gain6,'String',num2str(currentGains(6)));

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.(6-12 KHz)
function slider8_Callback(hObject, eventdata, handles)
global currentGains 
sliderVal = get(hObject,'Value') ;
currentGains(7) = sliderVal ;
set(handles.gain7,'String',num2str(currentGains(7)));

% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.(12-14 KHz)
function slider9_Callback(hObject, eventdata, handles)
global currentGains 
sliderVal = get(hObject,'Value') ;
currentGains(8) = sliderVal ;
set(handles.gain8,'String',num2str(currentGains(8)));


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.(14-16 KHz)
function slider10_Callback(hObject, eventdata, handles)
global currentGains 
sliderVal = get(hObject,'Value') ;
currentGains(9) = sliderVal ;
set(handles.gain9,'String',num2str(currentGains(9)));

% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
global play 
global currentGains 
global currentFilter 
global wavVector  
global wavFS 
global rate 
global filterType 
global siganlType
global band

play = true ;
assignin('base','filterType',filterType);

if( strcmp( siganlType , 'input') )
    % time domain
     t=linspace(0, length(wavVector)/wavFS,length(wavVector)  );
    axes(handles.timeresponce);
    plot( t , wavVector , 'r-' );
    % frequency domain
    Nfft = length(wavVector);
        f=linspace(0, wavFS, Nfft);
        G=abs(fft(wavVector, Nfft));
        axes(handles.frequencyresponse);
        plot(f(1:Nfft/2), G(1:Nfft/2) , 'r-' );
    % play the signal
    wavplay(wavVector, wavFS*rate , 'async') ;
    
elseif( strcmp( siganlType , 'output') )

    if ( strcmp( filterType , 'FIR (equiripple)' ) )
            r(1) = Equaripple_1(wavFS) ;
            r(2) = Equaripple_2(wavFS) ;
            r(3) = Equaripple_3(wavFS) ;
            r(4) = Equaripple_4(wavFS) ;
            r(5) = Equaripple_5(wavFS) ;
            r(6) = Equaripple_6(wavFS) ;
            r(7) = Equaripple_7(wavFS) ;
            r(8) = Equaripple_8(wavFS) ;
            r(9) = Equaripple_9(wavFS) ;

    elseif ( strcmp( filterType , 'FIR (least square)' ) )
            r(1) = leastSquare_1(wavFS);
            r(2) = leastSquare_2(wavFS);
            r(3) = leastSquare_3(wavFS);
            r(4) = leastSquare_4(wavFS);
            r(5) = leastSquare_5(wavFS);
            r(6) = leastSquare_6(wavFS);
            r(7) = leastSquare_7(wavFS);
            r(8) = leastSquare_8(wavFS);
            r(9) = leastSquare_9(wavFS);

    elseif ( strcmp( filterType , 'FIR (window(rectangular))' ) )
            r(1) = rectangular_1(wavFS);
            r(2) = rectangular_2(wavFS);
            r(3) = rectangular_3(wavFS);
            r(4) = rectangular_4(wavFS);
            r(5) = rectangular_5(wavFS);
            r(6) = rectangular_6(wavFS);
            r(7) = rectangular_7(wavFS);
            r(8) = rectangular_8(wavFS);
            r(9) = rectangular_9(wavFS);

    elseif ( strcmp( filterType , 'FIR (window(hamming))' ) )
            r(1) = hamming_1(wavFS);
            r(2) = hamming_2(wavFS);
            r(3) = hamming_3(wavFS);
            r(4) = hamming_4(wavFS);
            r(5) = hamming_5(wavFS);
            r(6) = hamming_6(wavFS);
            r(7) = hamming_7(wavFS);
            r(8) = hamming_8(wavFS);
            r(9) = hamming_9(wavFS);

    elseif ( strcmp( filterType , 'FIR (window(blackman-harris))' ) )
            r(1) = blackman_harris_1(wavFS);
            r(2) = blackman_harris_2(wavFS);
            r(3) = blackman_harris_3(wavFS);
            r(4) = blackman_harris_4(wavFS);
            r(5) = blackman_harris_5(wavFS);
            r(6) = blackman_harris_6(wavFS);
            r(7) = blackman_harris_7(wavFS);
            r(8) = blackman_harris_8(wavFS);
            r(9) = blackman_harris_9(wavFS);

    elseif ( strcmp( filterType , 'IIR' ) )
            r(1) = IIR_1(wavFS);
            r(2) = IIR_2(wavFS);
            r(3) = IIR_3(wavFS);
            r(4) = IIR_4(wavFS);
            r(5) = IIR_5(wavFS);
            r(6) = IIR_6(wavFS);
            r(7) = IIR_7(wavFS);
            r(8) = IIR_8(wavFS);
            r(9) = IIR_9(wavFS);

    end

    y_1=filter(r(1) , wavVector);
    y_2=filter(r(2) , wavVector);
    y_3=filter(r(3) , wavVector);
    y_4=filter(r(4) , wavVector);
    y_5=filter(r(5) , wavVector);
    y_6=filter(r(6) , wavVector);
    y_7=filter(r(7) , wavVector);
    y_8=filter(r(8) , wavVector);
    y_9=filter(r(9) , wavVector);
    
    if ( strcmp(band , '0-170' ) )
        t=linspace(0, length(y_1)/wavFS,length(y_1));
        figure;
        plot(t, y_1); 
        Nfft = length(y_1);
        f=linspace(0, wavFS, Nfft);
        G=abs(fft(y_1, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
elseif ( strcmp(band , '170-310' ) )
        t=linspace(0, length(y_2)/wavFS,length(y_2));
        figure;
        plot(t, y_2); 
        Nfft = length(y_2);
        f=linspace(0, wavFS, Nfft);
        G=abs(fft(y_2, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
elseif ( strcmp(band , '310-600' ) )
        t=linspace(0, length(y_3)/wavFS,length(y_3));
        figure;
        plot(t, y_3); 
        Nfft = length(y_3);
        f=linspace(0, wavFS, Nfft);
        G=abs(fft(y_3, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
elseif ( strcmp(band , '600-1000' ) )
        t=linspace(0, length(y_4)/wavFS,length(y_4));
        figure;
        plot(t, y_4); 
        Nfft = length(y_4);
        f=linspace(0, wavFS, Nfft);
        G=abs(fft(y_4, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
elseif ( strcmp(band , '1000-3000' ) )
        t=linspace(0, length(y_5)/wavFS,length(y_5));
        figure;
        plot(t, y_5); 
        Nfft = length(y_5);
        f=linspace(0, wavFS, Nfft);
        G=abs(fft(y_5, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
elseif ( strcmp(band , '3000-6000' ) )
        t=linspace(0, length(y_6)/wavFS,length(y_6));
        figure;
        plot(t, y_6); 
        Nfft = length(y_6);
        f=linspace(0, wavFS, Nfft);
        G=abs(fft(y_6, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
elseif ( strcmp(band , '6000-12000' ) )
        t=linspace(0, length(y_7)/wavFS,length(y_7));
        figure;
        plot(t, y_7); 
        Nfft = length(y_7);
        f=linspace(0, wavFS, Nfft);
        G=abs(fft(y_7, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
elseif ( strcmp(band , '12000-14000' ) )
        t=linspace(0, length(y_8)/wavFS,length(y_8));
        figure;
        plot(t, y_8); 
        Nfft = length(y_8);
        f=linspace(0, wavFS, Nfft);
        G=abs(fft(y_8, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
elseif ( strcmp(band , '14000-16000' ) )
        t=linspace(0, length(y_9)/wavFS,length(y_9));
        figure;
        plot(t, y_9); 
        Nfft = length(y_9);
        f=linspace(0, wavFS, Nfft);
        G=abs(fft(y_9, Nfft));
        figure;
        plot(f(1:Nfft/2), G(1:Nfft/2))
end

    y_1=y_1*(10^(currentGains(1)/20));
    y_2=y_2*(10^(currentGains(2)/20));
    y_3=y_3*(10^(currentGains(3)/20));
    y_4=y_4*(10^(currentGains(4)/20));
    y_5=y_5*(10^(currentGains(5)/20));
    y_6=y_6*(10^(currentGains(6)/20));
    y_7=y_7*(10^(currentGains(7)/20));
    y_8=y_8*(10^(currentGains(8)/20));
    y_9=y_9*(10^(currentGains(9)/20));

    Y = y_1+y_2+y_3+y_4+y_5+y_6+y_7+y_8+y_9;
    
    % time domain
     t=linspace(0, length(Y)/wavFS,length(Y)  );
    axes(handles.timeresponce);
    plot( t , Y , 'r-' );
    % frequency domain
    Nfft = length(Y);
        f=linspace(0, wavFS, Nfft);
        G=abs(fft(Y, Nfft));
        axes(handles.frequencyresponse);
        plot(f(1:Nfft/2), G(1:Nfft/2) , 'r-' );
    
    sound(Y, wavFS*rate);
end


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
global play 
if( play )
       clear playsnd ;
       play = false ;
end


% --- Executes on selection change in sinaltype.
function sinaltype_Callback(hObject, eventdata, handles)
global siganlType 
contents = cellstr(get(hObject,'String')) ;
siganlType = contents{get(hObject,'Value')} ;


% --- Executes during object creation, after setting all properties.
function sinaltype_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in responsetype.
function responsetype_Callback(hObject, eventdata, handles)
global band
contents = cellstr(get(hObject,'String')) ;
band = contents{get(hObject,'Value')} ;


% --- Executes during object creation, after setting all properties.
function responsetype_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FS_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function FS_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in updateFS.
function updateFS_Callback(hObject, eventdata, handles)
global FS
value = str2double( get(handles.FS,'String') ) ;
if ( value >0 )
    FS = value ;
end



% --- Executes on selection change in rate.
function rate_Callback(hObject, eventdata, handles)
global rate
contents = cellstr(get(hObject,'String'))  ;
value  = contents{get(hObject,'Value')} ;

if( strcmp(value,'normal'))
    rate = 1 ;
elseif( strcmp(value,'double'))
    rate = 2 ;
elseif( strcmp(value,'half'))
    rate = .5 ;
end



% --- Executes during object creation, after setting all properties.
function rate_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function gain2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gain2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function gain1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gain1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
