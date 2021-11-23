declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@field = common dso_local global [2 x i32 ]  zeroinitializer 
define dso_local i32@main(){
%1 = alloca [ 1 x i32 ]
%2 = alloca [ 3 x i32 ]
%3 = alloca i32
%4 = call i32 @getint()
store i32 %4, i32* %3
%5 = call i32 @getint()
%6 = getelementptr[ 2 x i32 ],[2 x i32 ]* @field, i32 0, i32 0
%7 = getelementptr i32,i32* %6, i32 0
store i32 %5, i32* %7
%8 = call i32 @getint()
%9 = getelementptr[ 2 x i32 ],[2 x i32 ]* @field, i32 0, i32 0
%10 = getelementptr i32,i32* %9, i32 1
store i32 %8, i32* %10
%11 = getelementptr[ 3 x i32 ],[3 x i32 ]* %2, i32 0, i32 0
%12 = getelementptr i32,i32* %11, i32 0
store i32 -1, i32* %12
%13 = getelementptr[ 3 x i32 ],[3 x i32 ]* %2, i32 0, i32 0
%14 = getelementptr i32,i32* %13, i32 0
%15 = load i32, i32* %14
%16 = sub i32 %15, 2
%17 = getelementptr[ 3 x i32 ],[3 x i32 ]* %2, i32 0, i32 0
%18 = getelementptr i32,i32* %17, i32 1
store i32 %16, i32* %18
%19 = getelementptr[ 3 x i32 ],[3 x i32 ]* %2, i32 0, i32 0
%20 = getelementptr i32,i32* %19, i32 1
%21 = load i32, i32* %20
store i32 %21, i32* %3
%22 = getelementptr[ 3 x i32 ],[3 x i32 ]* %2, i32 0, i32 0
%23 = getelementptr i32,i32* %22, i32 2
store i32 16, i32* %23
%24 = getelementptr[ 2 x i32 ],[2 x i32 ]* @field, i32 0, i32 0
%25 = getelementptr i32,i32* %24, i32 0
%26 = load i32, i32* %25
%27 = sub i32 3, %26
%28 = add i32 %27, 0
%29 = getelementptr[ 3 x i32 ],[3 x i32 ]* %2, i32 0, i32 0
%30 = getelementptr i32,i32* %29, i32 %28
%31 = load i32, i32* %30
%32 = add i32 %31, 2
%33 = load i32, i32* %3
%34 = add i32 %32, %33
call void @putint( i32 %34)
ret i32 0
}
