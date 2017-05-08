function mask=mstConnect(mst,groupPoint,row,col)
mask=zeros(row,col);
for iNum=1:size(mst,1)
    pIndex=mst(iNum,:);
        
    index1=pIndex(1); % first point
    index2=pIndex(2); % second point
   
    point1=groupPoint(index1,:);
    point2=groupPoint(index2,:);
    
    xRange=min(point1(1),point2(1)):max(point1(1),point2(1));
    yRange=min(point1(2),point2(2)):max(point1(2),point2(2));
    
    if length(xRange)>=length(yRange)  % x axis has large range
        if point1(1)>point2(1)
           x=[point2(1) point1(1)];
           y=[point2(2) point1(2)];
       
           X=point2(1):point1(1);
           Y=interp1(x,y,X);
           Y=round(Y);
       
           for ii=1:length(X)
               mask(X(ii),Y(ii))=1;
           end
        else
           x=[point1(1) point2(1)];
           y=[point1(2) point2(2)];
       
           X=point1(1):point2(1);
           Y=interp1(x,y,X);
           Y=round(Y);
       
           for ii=1:length(X)
              mask(X(ii),Y(ii))=1;
           end
        end
        
    else
        if point1(2)>point2(2)
           x=[point2(2) point1(2)];
           y=[point2(1) point1(1)];
       
           X=point2(2):point1(2);
           Y=interp1(x,y,X);
           Y=round(Y);
       
           for ii=1:length(X)
               mask(Y(ii),X(ii))=1;
           end
        else
           x=[point1(2) point2(2)];
           y=[point1(1) point2(1)];
       
           X=point1(2):point2(2);
           Y=interp1(x,y,X);
           Y=round(Y);
       
           for ii=1:length(X)
              mask(Y(ii),X(ii))=1;
           end
        end 
    end
end   


