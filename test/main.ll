declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = alloca i32
store i32 3389, i32* %1
%2 = load i32, i32* %1
%3 = icmp slt i32 %2, 10000
br i1 %3, label %4, label %30
4:
%5 = load i32, i32* %1
%6 = add i32 %5, 1
store i32 %6, i32* %1
%7 = alloca i32
store i32 112, i32* %7
%8 = load i32, i32* %7
%9 = icmp sgt i32 %8, 10
br i1 %9, label %10, label %28
10:
%11 = load i32, i32* %7
%12 = sub i32 %11, 88
store i32 %12, i32* %7
%13 = load i32, i32* %7
%14 = icmp slt i32 %13, 1000
br i1 %14, label %15, label %27
15:
%16 = alloca i32
store i32 9, i32* %16
%17 = alloca i32
store i32 11, i32* %17
store i32 10, i32* %16
%18 = load i32, i32* %7
%19 = load i32, i32* %16
%20 = sub i32 %18, %19
store i32 %20, i32* %7
%21 = alloca i32
store i32 11, i32* %21
%22 = load i32, i32* %7
%23 = load i32, i32* %21
%24 = add i32 %22, %23
%25 = load i32, i32* %17
%26 = add i32 %24, %25
store i32 %26, i32* %7
br label %27
27:
br label %28
28:
%29 = load i32, i32* %7
call void @putint( i32 %29)
br label %30
30:
ret i32 0
}
