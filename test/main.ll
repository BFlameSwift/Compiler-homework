declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@c = dso_local constant i32 [2 x i32 ][ i32 1, i32 3 ]
@b = dso_local global i32 [6 x i32 ][ i32 1, i32 0, i32 0, i32 0, i32 0, i32 0 ]
@e = common dso_local global i32 [16 x i32 ] zeroinitializer
@d = common dso_local global i32 [5 x i32 ] zeroinitializer
@a = dso_local global i32 [3 x i32 ][ i32 1, i32 2, i32 0 ]
define dso_local i32@main(){
%1 = alloca i32
store i32 5, i32* %1
%2 = load i32, i32* %1
ret i32 %2
}
