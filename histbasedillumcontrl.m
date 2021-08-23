function [im_histeq]=histbasedillumcontrl(a)
im_histeq=histeq(a,256)
figure, imshow(im_histeq);

    end
  