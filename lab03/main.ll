declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 0, i32* %1
%2 = alloca i32
store i32 3, i32* %2
%3 = mul i32 5, 5
%4 = sub i32 25, 20
%5 = load i32, i32* %2
%6 = sdiv i32 %4, 5
%7 = mul i32 %6, 0
%8 = sub i32 5, %7
store i32 %8, i32* %1
%9 = load i32, i32* %1
ret i32 0
}
