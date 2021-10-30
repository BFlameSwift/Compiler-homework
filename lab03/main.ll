declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = add i32 1, 1
ret i32 2
}
