declare @i int
declare @j int
set @i=3
declare @out varchar(max)
declare @flag bit
set @flag=1

set @out='2'

while @i<1000
begin
set @j=2
set @flag=1
    while @j<@i
    begin    
        if(@i%@j=0)
        begin
            set @flag=0            
        end
        set @j=@j+1        
    end
if(@flag!=0)
begin
    select @out= concat(@out,'&',@i)
end
set @i=@i+2
end

Print @out