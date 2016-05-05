%% ----bilinear interpolation
%this process handles the smooth area
%after this we will use New edge-directed interpolation to deal with the
%sharp area.
[height,width,~]=size(img);
simg=zeros(height*2,width*2,3);
for i=1:height
    for j=1:width
        for k=1:3
            simg(i*2,j*2,k)=img(i,j,k);
        end
    end
end
%imshow(simg);
% x interpolation
for i=1:height
    for j=1:width
        for k=1:3
            if(i==1)
                simg(i*2-1,j*2,k)=simg(i*2,j*2,k);
            else
                simg(i*2-1,j*2,k)=0.5*(simg(i*2-2,j*2,k)+simg(i*2,j*2,k));
            end
        end
    end
end
% y interpolation
for i=1:height
    for j=1:width
        for k=1:3
            if(j==1)
                simg(i*2,j*2-1,k)=simg(i*2,j*2,k);
                simg(i*2-1,j*2-1,k)=simg(i*2-1,j*2,k);
            else
            simg(i*2,j*2-1,k)=0.5*(simg(i*2,j*2,k)+simg(i*2,j*2-2,k));
            simg(i*2-1,j*2-1,k)=0.5*(simg(i*2-1,j*2,k)+simg(i*2-1,j*2-2,k));
            end
        end
    end
end
imshow(simg);


