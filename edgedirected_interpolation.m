%% edge-directed interpolation for sharp areas

m=4;
y=zeros(m^2,1); % m^2 * 1
C=zeros(m^2,4);   % m^2 * 4

for k=1:3  % 3 colors
    for i=3:height-3
        for j=3:width-3
            if(sharp(i,j)==1)
                temp=1;
                for ii=(i+1-ceil(m/2)):(i+floor(m/2))
                   for jj=j+1-ceil(m/2):j+floor(m/2)
                       y(temp)=img(ii,jj,k);
                       C(temp,1)=img(ii-1,jj-1,k);
                       C(temp,2)=img(ii+1,jj-1,k);
                       C(temp,3)=img(ii+1,jj+1,k);
                       C(temp,4)=img(ii-1,jj+1,k);
                       temp=temp+1;                     
                   end
                end
                alpha=(C'*C)\(C'*y);
                simg(2*i+1,2*j+1,k)=(alpha(1)*img(i,j,k)+alpha(2)*img(i+1,j,k)...
                    +alpha(3)*img(i+1,j+1,k)+alpha(4)*img(i,j+1,k));
            end
        end
    end  
end
imshow(simg);