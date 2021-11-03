@a = dso_local global i32 1, align 4
@cons = dso_local constant i32 2, align 4
@comon = common dso_local global i32 0, align 4
define dso_local i32@main
()
{
%1 = alloca i32
store i32 2, i32* %1
ret i32 3
}
