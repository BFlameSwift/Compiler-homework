declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
define dso_local i32 @f(){
call void @putint(i32 0)
ret i32 0
}
define dso_local i32 @g(){
call void @putint(i32 1)
ret i32 1
}
define dso_local i32 @main(){
%1 = call i32 @f()
%2 = icmp ne i32 %1, 0
br i1 %2, label %3, label %22
3:
%4 = call i32 @g()
%5 = icmp ne i32 %4, 0
br i1 %5, label %6, label %22
6:
%7 = icmp ne i32 %6, 0
br i1 %7, label %22, label %8
8:
%9 = call i32 @f()
%10 = icmp eq i32 %9, 0
br i1 %10, label %11, label %22
11:
%12 = call i32 @g()
%13 = icmp ne i32 %12, 0
br i1 %13, label %14, label %22
14:
%15 = icmp ne i32 %14, 0
br i1 %15, label %22, label %16
16:
%17 = icmp ne i32 %2, 0
br i1 %17, label %18, label %20
18:
ret i32 0
19:
br label %22
20:
ret i32 1
21:
br label %22
22:
ret i32 0
}
