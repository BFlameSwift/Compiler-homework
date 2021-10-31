declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = alloca i32
%3 = alloca i32
%4 = alloca i32
%5 = alloca i32
store i32 5, i32* %1
store i32 5, i32* %2
store i32 1, i32* %3
store i32 -2, i32* %4
%6 = load i32, i32* %4
%7 = mul i32 %6, 1
%8 = sdiv i32 %7, 2
%9 = load i32, i32* %1
%10 = load i32, i32* %2
%11 = sub i32 %9, %10
%12 = add i32 %8, %11
%13 = load i32, i32* %3
%14 = add i32 %13, 3
%15 = sub i32 %12, 0
store i32 %15, i32* %5
%16 = load i32, i32* %5
call void @putint( i32 %16)
%17 = load i32, i32* %4
%18 = srem i32 %17, 2
%19 = add i32 %18, 67
%20 = load i32, i32* %1
%21 = load i32, i32* %2
%22 = sub i32 %20, %21
%23 = add i32 %19, 0
%24 = load i32, i32* %3
%25 = add i32 %24, 2
%26 = srem i32 %25, 2
%27 = sub i32 %23, -1
store i32 %27, i32* %5
%28 = load i32, i32* %5
%29 = add i32 %28, 3
store i32 %29, i32* %5
%30 = load i32, i32* %5
call void @putint( i32 %30)
ret i32 0
}
