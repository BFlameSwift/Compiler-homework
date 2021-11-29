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
br i1 %2, label %3, label %8
3:
%4 = call i32 @g()
%5 = icmp ne i32 %4, 0
br i1 %5, label %6, label %8
6:
%7 = icmp ne i32 %6, 0
br i1 %7, label %8, label %8
8:
%9 = call i32 @f()
%10 = icmp eq i32 %9, 0
br i1 %10, label %11, label %18
11:
%12 = call i32 @g()
%13 = icmp ne i32 %12, 0
br i1 %13, label %14, label %18
14:
%15 = icmp ne i32 %2, 0
br i1 %15, label %16, label %18
16:
ret i32 0
17:
br label %20
18:
ret i32 1
19:
br label %20
20:
ret i32 0
}
