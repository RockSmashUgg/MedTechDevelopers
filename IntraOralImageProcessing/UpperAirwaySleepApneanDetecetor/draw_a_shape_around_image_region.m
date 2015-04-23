%Name: Esuabom Dijemeno
%Date: 23/04/2015
%Purpose: Learn how to draw a shape around an image

%% Create the shape inserter
shapeInserter = vision.ShapeInserter;

%%  Read the input image
I = imread('cameraman.tif');

%% Define the rectangle dimensions as [x y width height]
rectangle = int32([10 10 30 30]); %The point the the top left corner of the rectangle

%% Draw the rectangle and display the result
J = step(shapeInserter, I, rectangle);
imshow(J);