declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = call i32 @getint()
%2 = alloca i32
store i32 %1, i32* %2
%3 = call i32 @getint()
%4 = alloca i32
store i32 %3, i32* %4
%5 = load i32, i32* %2
%6 = load i32, i32* %4
%7 = icmp sle i32 %5, %6
br i1 %7, label %8, label %9
8:
call void @putint( i32 1)
br label %9
9:
ret i32 0
}
