declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@TAPE_LEN = dso_local constant i32 65536, align 4
@BUFFER_LEN = dso_local constant i32 32768, align 4
@tape = dso_local global [65536 x i32 ]  zeroinitializer 
@program = dso_local global [32768 x i32 ]  zeroinitializer 
@ptr = dso_local global i32 0, align 4
define dso_local i32@func(){
ret i32 0
}
define dso_local i32@main(){
%1 = alloca i32
store i32 0, i32* %1
%2 = call i32 @getint()
%3 = alloca i32
store i32 %2, i32* %3
ret i32 0
}
