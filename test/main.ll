declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@a = dso_local constant i32 6, align 4
@b = dso_local global i32 7, align 4
define dso_local i32@main(){
%1 = load i32, i32* @b
%2 = alloca i32
store i32 %1, i32* %2
%3 = alloca i32
store i32 8, i32* %3
%4 = load i32, i32* %3
%5 = load i32, i32* %2
%6 = add i32 %4, %5
call void @putint( i32 %6)
ret i32 0
}
