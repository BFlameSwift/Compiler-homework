declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = alloca i32
store i32 1, i32* %1
%2 = alloca i32
store i32 0, i32* %2
%3 = alloca i32
store i32 2, i32* %3
%4 = load i32, i32* %2
%5 = load i32, i32* %3
%6 = add i32 %4, %5
store i32 %6, i32* %2
%7 = alloca i32
store i32 3, i32* %7
%8 = load i32, i32* %2
%9 = load i32, i32* %7
%10 = add i32 %8, %9
store i32 %10, i32* %2
%11 = load i32, i32* %2
call void @putint( i32 %11)
%12 = load i32, i32* %7
call void @putint( i32 %12)
call void @putch( i32 10)
store i32 4, i32* %7
%13 = alloca i32
%14 = load i32, i32* %2
store i32 %14, i32* %13
%15 = alloca i32
%16 = load i32, i32* %13
%17 = load i32, i32* %7
%18 = add i32 %16, %17
store i32 %18, i32* %15
%19 = alloca i32
store i32 5, i32* %19
%20 = alloca i32
%21 = load i32, i32* %15
store i32 %21, i32* %20
%22 = alloca i32
%23 = load i32, i32* %20
%24 = load i32, i32* %19
%25 = add i32 %23, %24
store i32 %25, i32* %22
store i32 6, i32* %19
%26 = load i32, i32* %22
call void @putint( i32 %26)
%27 = load i32, i32* %19
call void @putint( i32 %27)
call void @putch( i32 10)
%28 = load i32, i32* %22
%29 = load i32, i32* %19
%30 = add i32 %28, %29
store i32 %30, i32* %22
store i32 7, i32* %19
%31 = load i32, i32* %22
%32 = load i32, i32* %19
%33 = add i32 %31, %32
store i32 %33, i32* %22
%34 = load i32, i32* %22
call void @putint( i32 %34)
%35 = load i32, i32* %19
call void @putint( i32 %35)
%36 = load i32, i32* %22
%37 = load i32, i32* %19
%38 = add i32 %36, %37
store i32 %38, i32* %22
call void @putch( i32 10)
%39 = load i32, i32* %22
call void @putint( i32 %39)
%40 = load i32, i32* %19
call void @putint( i32 %40)
ret i32 0
}
