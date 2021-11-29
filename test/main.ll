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
br i1 %2, label %3, label %6
3:
%4 = call i32 @g()
%5 = icmp ne i32 %4, 0
br i1 %5, label %6, label %6
6:
%7 = call i32 @f()
%8 = icmp eq i32 %7, 0
br i1 %8, label %9, label %15
9:
%10 = call i32 @g()
%11= zext i1 %2 to i32
%12 = icmp ne i32 %11, 0
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
