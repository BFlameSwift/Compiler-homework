declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
define dso_local i32 @func(i32 %0){
%2 = alloca i32 
store i32 %0, i32* %2
%3 = load i32, i32* %2
%4 = icmp sle i32 %3, 50
br i1 %4, label %5, label %8
5:
%6 = load i32, i32* %2
call void @putint(i32 %6)
ret i32 1
7:
br label %11
8:
%9 = load i32, i32* %2
call void @putint(i32 %9)
ret i32 0
10:
br label %11
11:
ret i32 0
}
define dso_local i32 @main(){
%1 = alloca i32 
%2 = call i32 @func(i32 0)
%3 = icmp eq i32 %2, 1
br i1 %3, label %4, label %4
4:
%5 = call i32 @func(i32 50)
%6 = icmp eq i32 %5, 1
br i1 %6, label %7, label %11
7:
%8 = call i32 @func(i32 100)
%9 = icmp eq i32 %8, 0
br i1 %9, label %10, label %11
10:
store i32 0, i32* %1
br label %12
11:
store i32 1, i32* %1
br label %12
12:
%13 = call i32 @func(i32 50)
%14 = icmp eq i32 %13, 1
br i1 %14, label %15, label %18
15:
%16 = call i32 @func(i32 40)
%17 = icmp eq i32 %16, 1
br i1 %17, label %18, label %18
18:
%19 = call i32 @func(i32 1)
%20 = icmp eq i32 %19, 1
br i1 %20, label %21, label %22
21:
store i32 0, i32* %1
br label %23
22:
store i32 1, i32* %1
br label %23
23:
ret i32 0
}
