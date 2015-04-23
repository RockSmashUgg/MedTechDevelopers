%Name: Esuabom Dijemeni
%Date: 23/04/2015
%Purpose: Learn how to draw a shape around an image

%% Create the shape inserter
shapeInserter = vision.ShapeInserter;

%%  Read the input image
I = imread('C:\Users\Dijemni\Documents\GitHub\MedTechDevelopers\IntraOralImageProcessing\UpperAirwaySleepApneanDetecetor\Test_Image.jpg');

%% Define the rectangle dimensions as [x y width height]
rectangle = int32([230 105 251 140]); %The point the the top left corner of the rectangle

%% Draw the rectangle and display the result
J = step(shapeInserter, I, rectangle);
imshow(J);