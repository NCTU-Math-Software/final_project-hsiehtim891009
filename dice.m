function dice()
    dice_x=zeros(6,36);
    dice_y=zeros(9,36);
    dice_x(1,1)=1;
    dice_x(1,2)=1;
    dice_x(1,3)=1;
    dice_x(1,4)=1;
    dice_x(1,5)=1;
    dice_x(1,6)=1;  
    for ii=2:6
        for jj=1:36
            point=jj;
            sum=0;
            while (point>1)&&(sum<6)
                point=point-1;
                dice_x(ii,jj)=dice_x(ii,jj)+dice_x(ii-1,point);
                sum=sum+1;
            end
        end
    end
    dice_y(1,1)=1;
    dice_y(1,2)=1;
    dice_y(1,3)=1;
    dice_y(1,4)=1;
    for ii=2:9
       for jj=1:36
           point=jj;
           sum=0;
          while (point>1)&&(sum<4)
              point=point-1;
              dice_y(ii,jj)=dice_y(ii,jj)+dice_y(ii-1,point);
              sum=sum+1;
          end
       end
    end
    
    win_sum=0;
    for ii=9:36
        total=0;
        for jj=1:ii-1
            total=total+dice_x(6,jj);
        end
        win_sum=win_sum+dice_y(9,ii)*total;
    end
    
    tie_sum=0;
    for ii=9:36
       tie_sum=tie_sum+dice_x(6,ii)*dice_y(9,ii);
    end
    
    win_rate=((win_sum/(4^9*6^6))*100);
    win_rate=roundn(win_rate,-7);
    tie_rate=((tie_sum/(4^9*6^6))*100);
    tie_rate=roundn(tie_rate,-7);
    lose_rate=roundn((((4^9*6^6)-win_sum-tie_sum)/(4^9*6^6))*100,-7);
    disp('The probability that Peter will be the winner is ');    
    fprintf('%6.7f',win_rate);
    disp(' %');
    disp('The probability that the competition will tie is ');
    fprintf('%6.7f',tie_rate);
    disp(' %');
    disp('The probability that Peter will be the loser is ');
    fprintf('%6.7f',lose_rate);
    disp(' %');
end