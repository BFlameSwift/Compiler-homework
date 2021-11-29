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
br i1 %1, label %2, label %17
2:
%3 = call i32 @g()
br i1 %3, label %4, label %17
4:
br i1 %4, label %17, label %5
5:
%6 = call i32 @f()
%7 = icmp eq i32 %6, 0
br i1 %7, label %8, label %17
8:
%9 = call i32 @g()
br i1 %9, label %10, label %17
10:
br i1 %10, label %17, label %11
11:
%12 = icmp ne i32 %1, 0
br i1 %12, label %13, label %15
13:
ret i32 0
14:
br label %17
15:
ret i32 1
16:
br label %17
17:
ret i32 0
}
