declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 5, i32* %1
%2 = load i32, i32* %1
%3 = add i32 %2, 1
%4 = load i32, i32* %1
%5 = sub i32 6, %4
call void @putint( i32%5)
ret i32 0
}
