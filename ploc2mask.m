function mask=ploc2mask(totalRow,totalCol,locRow,locCol)
% (locRow locCol) is point location
% (totalRow totalCol) is image size

mask=logical(zeros(totalRow,totalCol));
index=(locCol-1)*totalRow+locRow; 

totalindex=totalRow*totalCol;
keepindex= index<=totalindex & index>=1;

keepindex=logical(keepindex);
keepindex=index(keepindex);

mask(keepindex)=1;
