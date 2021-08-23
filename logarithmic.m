function [a]=logarithmic(a)
%c=input('Enter the constant value, c = ');
c=2.2;
[M,N]=size(a);
        for x = 1:M
            for y = 1:N
                m=double(a(x,y));
                a(x,y)=c.*log10(1+m); %#ok<AGROW>
            end
            x=x+1;
        end
%figure, imshow(a);
end
%{
a1 = imread('log.jpg'); % Read the image
a = double(a1)/255; % Normalized Image
c = 2; % Constant
f = c*log(1 + (a)); % Log Transform
subplot(1,2,1),imshow(a1),title('Original Image');
subplot(1,2,2),imshow((f)),title('Log Transformation Image');
%}