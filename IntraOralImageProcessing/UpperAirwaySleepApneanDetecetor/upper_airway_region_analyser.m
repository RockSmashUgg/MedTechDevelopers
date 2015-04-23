% Name: Esuabom David Dijemeni
% Date: 23/04/2015
% Purpose: Detect the airways using simple algorithm

%% Clear and clc
clear;
clc;

%% Read test image into matlab
test_image = (imread('C:\Users\Dijemni\Documents\GitHub\MedTechDevelopers\IntraOralImageProcessing\UpperAirwaySleepApneanDetecetor\Test_Image.jpg'));
figure(1); imshow(test_image);

%% Convert the image from RGB to grayscale
test_image_gray = rgb2gray(test_image);
%figure(2); imshow(test_image_gray)

%% Get the size of the gray scale image
[img_x , img_y] = size(test_image_gray);

%% Create a blank image of the same size as the grayscale image
upper_airway = zeros(img_x,img_y,'uint8');

%% Define the ROI of the upper airway
% Create the shape inserter
shapeInserter = vision.ShapeInserter;

% Define the rectangle dimensions as [x y width height]
rectangle = int32([230 105 251 140]); %The point the the top left corner of the rectangle

% Draw the rectangle and display the result
%upper_airway_rect = step(shapeInserter, test_image_gray, rectangle);
%figure(3); imshow(upper_airway_rect);

%% Get the ROI
upper_airway(105:245,230:481)= test_image(105:245,230:481); %,105:245
figure(4); imshow(upper_airway)

%% Test edge detection
%test_edge = edge(upper_airway,'canny');
%figure(5); imshow(test_edge)

%% Threshold Segmentation
bw = upper_airway < 85
figure(5); imshow(upper_airway)

%% Analyse the data
stats = regionprops('table',bw,'Centroid',...
    'MajorAxisLength','MinorAxisLength',...
    'Area','BoundingBox','Eccentricity','EquivDiameter',...
    'Extent','FilledArea', 'Orientation', 'Perimeter', 'Solidity')
