%% edge-directed interpolation for sharp areas

m=4;
y=zeros(m^2,1); % m^2 * 1
C=zeros(m^2,4);   % m^2 * 4

%% step 1  reconstruct the points with the form of (2*i+1,2*j+1)
for k=1:3  % 3 colors
    for i=3:height-3
        for j=3:width-3
            if(sharp(i,j)==1)
                temp=1;
                for ii=(i+1-ceil(m/2)):(i+floor(m/2))
                   for jj=j+1-ceil(m/2):j+floor(m/2)
                       y(temp)=simg(2*ii,2*jj,k);
                       C(temp,1)=simg(2*ii-2,2*jj-2,k);
                       C(temp,2)=simg(2*ii+2,2*jj-2,k);
                       C(temp,3)=simg(2*ii+2,2*jj+2,k);
                       C(temp,4)=simg(2*ii-2,2*jj+2,k);
                       temp=temp+1;                     
                   end
                end
                alpha=(C'*C)\(C'*y);
                simg(2*i+1,2*j+1,k)=(alpha(1)*simg(2*i,2*j,k)+alpha(2)*simg(2*i+2,2*j,k)...
                    +alpha(3)*simg(2*i+2,2*j+2,k)+alpha(4)*simg(2*i,2*j+2,k));
                
            end
        end
    end  
end


%% step 2 reconstructed the points with the forms of (2*i+1,2*j)
for k=1:3  % 3 colors
    for i=2:height-4
        for j=2:width-4
            if(sharp(i,j)==1)
                temp=1;
                for ii=(i+1-ceil(m/2)):(i+floor(m/2))
                   for jj=j+1-ceil(m/2):j+floor(m/2)
                       y(temp)=simg(2*ii+1,2*jj-1,k);
                       C(temp,1)=simg(2*ii-1,2*jj-1,k);
                       C(temp,2)=simg(2*ii+1,2*jj-3,k);
                       C(temp,3)=simg(2*ii+3,2*jj-1,k);
                       C(temp,4)=simg(2*ii+1,2*jj+1,k);
                       temp=temp+1;                     
                   end
                end
                alpha=(C'*C)\(C'*y);
                simg(2*i+1,2*j,k)=(alpha(1)*simg(2*i,2*j,k)+alpha(2)*simg(2*i+1,2*j-1,k)...
                    +alpha(3)*simg(2*i+2,2*j,k)+alpha(4)*simg(2*i+1,2*j+1,k));
            end
        end
    end  
end
%% step 3 reconstructed the points with the forms of (2*i,2*j+1)

for k=1:3  % 3 colors
    for i=2:height-4
        for j=2:width-4
            if(sharp(i,j)==1)
                temp=1;
                for ii=(i+1-ceil(m/2)):(i+floor(m/2))
                   for jj=j+1-ceil(m/2):j+floor(m/2)
                       y(temp)=simg(2*ii+1,2*jj-1,k);
                       C(temp,1)=simg(2*ii-1,2*jj-1,k);
                       C(temp,2)=simg(2*ii+1,2*jj-3,k);
                       C(temp,3)=simg(2*ii+3,2*jj-1,k);
                       C(temp,4)=simg(2*ii+1,2*jj+1,k);
                       temp=temp+1;                     
                   end
                end
                alpha=(C'*C)\(C'*y);
                simg(2*i,2*j+1,k)=(alpha(1)*simg(2*i-1,2*j+1,k)+alpha(2)*simg(2*i,2*j,k)...
                    +alpha(3)*simg(2*i+1,2*j+1,k)+alpha(4)*simg(2*i,2*j+2,k));
            end
        end
    end  
end
imshow(simg);
