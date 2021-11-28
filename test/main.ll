declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
define dso_local i32 @fib(i32 %0){
%2 = alloca i32 
store i32 %0, i32* %2
%3 = load i32, i32* %2
%4 = icmp eq i32 %3, 0
br i1 %4, label %5, label %7
5:
ret i32 0
6:
br label %7
7:
%8 = load i32, i32* %2
%9 = icmp eq i32 %8, 1
br i1 %9, label %10, label %12
10:
ret i32 1
11:
br label %12
12:
%13 = alloca i32 
%14 = load i32, i32* %2
%15 = sub i32 %14, 1
store i32 %15, i32* %13
%16 = alloca i32 
%17 = load i32, i32* %2
%18 = sub i32 %17, 2
store i32 %18, i32* %16
%19 = load i32, i32* %13
call void @fib(i32 %19)
%20 = load i32, i32* %16
call void @fib(i32 %20)
%21 = add i32 %0, %0
ret i32 %21
}
define dso_local i32 @main(){
%1 = alloca i32 
store i32 10, i32* %1
%2 = load i32, i32* %1
call void @fib(i32 %2)
call void @putint(i32 %0)
ret i32 0
}
