function rgbhistogram()
%% Histogram Display
global filename ;


%% Create a System Object to Read Video from a Multimedia File
obj.hSrc = vision.VideoFileReader(filename, 'ImageColorSpace', 'RGB');

%% Create a Histogram System Object to Compute Color Densities
obj.hHist = vision.Histogram('LowerLimit', 0, 'UpperLimit', 1,'NumBins', 256);

%% Create a System Object to Display the Original Video
%WindowSize = [190 150];
obj.hView = vision.VideoPlayer('Name', 'Original');
%obj.hView.Position = [80 obj.hView.Position(2) WindowSize];

%% Set up Plots to Display the Histograms
videohistplots(3);

%% Stream Processing Loop


while ~isDone(obj.hSrc)
  frame2 = step(obj.hSrc);         % Read a video frame2
 obj.hView.step(frame2);         % Display the frame2
  
  % Loop through each color channel
  R_hist = step(obj.hHist, frame2(:,:,1));
  G_hist = step(obj.hHist, frame2(:,:,2));
  B_hist = step(obj.hHist, frame2(:,:,3));

  % plot R, G, B histogram
  videohistplots(3,cat(3, R_hist,G_hist,B_hist));
end

%% Release

release(obj.hSrc);

%displayEndOfDemoMessage(mfilename)
end 

