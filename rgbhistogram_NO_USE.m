%% Histogram Display
global filename ;
%% Create a System Object to Read Video from a Multimedia File
obj.hSrc = vision.VideoFileReader(filename, ...
                              'ImageColorSpace', 'RGB');

%% Create a Histogram System Object to Compute Color Densities
hHist = vision.Histogram('LowerLimit', 0,'UpperLimit', 1,'NumBins', 256);

%% Create a System Object to Display the Original Video
WindowSize = [190 150];
hView = vision.VideoPlayer('Name', 'Original');
hView.Position = [80 hView.Position(2) WindowSize];

%% Set up Plots to Display the Histograms
videohistplots(3);

%% Stream Processing Loop
% Here you call the processing loop to compute the histogram in the input
% video. This loop uses the System objects you instantiated.
%
% The loop is stopped when you reach the end of the input file, which is
% detected by the VideoFileReader System object.

while ~isDone(obj.hSrc)
  frame2 = step(obj.hSrc);         % Read a video frame2
  step(hView, frame2);         % Display the frame2
  
  % Loop through each color channel
  R_hist = step(hHist, frame2(:,:,1));
  G_hist = step(hHist, frame2(:,:,2));
  B_hist = step(hHist, frame2(:,:,3));

  % plot R, G, B histogram
  videohistplots(3,cat(3, R_hist,G_hist,B_hist));
end

%% Release
% Here you call the release method on the System objects to close any open
% files.
release(obj.hSrc);

%displayEndOfDemoMessage(mfilename)

