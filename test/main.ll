declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
define dso_local void @set1(i32 %0, i32* %1){
%3 = alloca i32 
store i32 %0, i32* %3
%4 = alloca i32* 
store i32* %1, i32* * %4
%5 = load i32, i32* %3
%6 = add i32 %5, 0
%7 = load i32* , i32* * %4
%8 = getelementptr i32, i32* %7, i32 %6
store i32 1, i32* %8
}
define dso_local i32 @main(){
%1 = alloca [ 10 x i32 ]
%2 = alloca i32 
%3 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
%4 = call i32 @getarray(i32 * %3)
store i32 %4, i32* %2
%5 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 5
%6 = call i32 @getarray(i32 * %5)
%7 = alloca i32 
store i32 0, i32* %7
br label %8
8:
%9 = load i32, i32* %7
%10 = load i32, i32* %2
%11 = icmp slt i32 %9, %10
br i1 %11, label %12, label %22
12:
%13 = load i32, i32* %7
%14 = load i32, i32* %7
%15 = srem i32 %14, 2
%16 = mul i32 %15, 5
%17 = add i32 %16, 0
%18 = add i32 0, %17
%19 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 %18
call void @set1(i32 %13, i32 * %19)
%20 = load i32, i32* %7
%21 = add i32 %20, 1
store i32 %21, i32* %7
br label %8
22:
%23 = load i32, i32* %2
%24 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 0
call void @putarray(i32 %23, i32 * %24)
%25 = load i32, i32* %2
%26 = getelementptr[ 10 x i32 ],[10 x i32 ]* %1, i32 0, i32 5
call void @putarray(i32 %25, i32 * %26)
ret i32 0
}
