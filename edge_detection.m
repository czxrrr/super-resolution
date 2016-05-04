%% use the canny operator to detect edge
img=imread('bluecat.jpg');
img=im2double(img);

I=rgb2gray(img);

sharp = edge(I,'canny');
figure;
imshow(sharp)

%% another method proposed in the paper





