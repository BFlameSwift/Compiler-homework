declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 1, i32* %1
%2 = load i32, i32* %1
call void @putint(i32 @1 )
ret i32 0
}
