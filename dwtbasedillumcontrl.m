function [im_dwt]=dwtbasedillumcontrol(a)
[p q r s]=dwt2(single(a),'rbio1.1', 'mode','sym');
b=[uint8(p), q; r, s];
[p1 q1 r1 s1]=dwt2(p,'rbio1.1', 'mode','sym');
%c=[uint8(p1), q1; r1, s1];
%figure, imshow(c);
[row, c, n] = size(p1);
X= mean2(a);
if n==3
for i=1:row
        for j=1:c
            
         p1(i,j,1)=p1(i,j,1)-X/2;
            p1(i,j,2)=p1(i,j,2)-X/2;
             p1(i,j,3)=p1(i,j,3)-X/2; 
        end
end
else
  for i=1:row
        for j=1:c
                    
            P1(i,j,1)=p1(i,j,1)-X/2; 
        end
  end
  
 p1=cat(3,p1, p1, p1);           
end
q=imsharpen(q,'Radius',1.5,'Amount',0.8);
r=imsharpen(r,'Radius',1.5,'Amount',0.8);
s=imsharpen(s,'Radius',1.5,'Amount',0.8);
q1=imsharpen(q1,'Radius',1.5,'Amount',0.8);
r1=imsharpen(r1,'Radius',1.5,'Amount',0.8);
s1=imsharpen(s1,'Radius',1.5,'Amount',0.8);



p_i= idwt2(p1, q1, r1, s1,'rbio1.1');
%p_i=imresize(p_i, [151 151]);
a_i= idwt2(p_i, q, r, s, 'rbio1.1');
im_dwt =uint8(a_i);
figure, imshow(im_dwt);
end