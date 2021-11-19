declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = alloca i32
store i32 1, i32* %1
br label %2
2:
%3 = icmp ne i32 1, 0
br i1 %3, label %4, label %11
4:
%5 = load i32, i32* %1
%6 = icmp eq i32 %5, 0
br i1 %6, label %7, label %8
7:
store i32 0, i32* %1
br label %10
8:
br label %11
9:
br label %10
10:
br label %2
11:
ret i32 1
}
