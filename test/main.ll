declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
define dso_local i32 @main(){
%1 = alloca i32 
store i32 1, i32* %1
%2 = alloca i32 
store i32 2, i32* %2
%3 = alloca i32 
store i32 3, i32* %3
%4 = alloca i32 
store i32 4, i32* %4
br label %5
5:
%6 = load i32, i32* %1
%7 = icmp eq i32 %6, 1
%8 = load i32, i32* %2
%9 = icmp eq i32 %8, 2
%10 = and i1 %7, %9
%11 = load i32, i32* %3
%12 = icmp eq i32 %11, 3
%13 = and i1 %10, %12
%14 = load i32, i32* %4
%15 = icmp eq i32 %14, 0
%16 = and i1 %13, %15
br i1 %16, label %17, label %20
17:
%18 = load i32, i32* %4
%19 = sub i32 %18, 1
store i32 %19, i32* %4
br label %5
20:
%21 = load i32, i32* %4
call void @putint(i32 %21)
%22 = load i32, i32* %4
ret i32 %22
}
