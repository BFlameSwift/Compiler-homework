declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = alloca i32
%2 = alloca i32
%3 = alloca i32
%4 = alloca i32
%5 = alloca i32
%6 = call i32 @getint()
store i32 %6, i32* %5
br label %7
7:
%8 = load i32, i32* %5
%9 = icmp sgt i32 %8, 0
br i1 %9, label %10, label %48
10:
%11 = call i32 @getint()
store i32 %11, i32* %2
%12 = call i32 @getint()
store i32 %12, i32* %3
%13 = load i32, i32* %5
%14 = sub i32 %13, 1
store i32 %14, i32* %5
br label %15
15:
br i1 %15, label %16, label %46
16:
%17 = load i32, i32* %2
%18 = load i32, i32* %3
%19 = add i32 %17, %18
%20 = add i32 %19, 1
%21 = sdiv i32 %20, 2
store i32 %21, i32* %4
%22 = call i32 @getint()
store i32 %22, i32* %1
%23 = load i32, i32* %1
%24 = icmp eq i32 %23, 0
br i1 %24, label %25, label %26
25:
br label %46
26:
%27 = load i32, i32* %1
%28 = icmp eq i32 %27, 1
br i1 %28, label %29, label %31
29:
%30 = load i32, i32* %4
store i32 %30, i32* %3
br label %38
31:
%32 = load i32, i32* %1
%33 = icmp eq i32 %32, 2
br i1 %33, label %34, label %36
34:
%35 = load i32, i32* %4
store i32 %35, i32* %2
br label %37
36:
call void @putch( i32 69)
call void @putch( i32 10)
br label %37
37:
br label %38
38:
br label %39
39:
%40 = load i32, i32* %2
%41 = load i32, i32* %3
%42 = icmp eq i32 %40, %41
br i1 %42, label %43, label %44
43:
call void @putch( i32 67)
call void @putch( i32 10)
br label %46
44:
%45 = load i32, i32* %4
call void @putint( i32 %45)
call void @putch( i32 10)
br label %15
46:
%47 = load i32, i32* %4
call void @putint( i32 %47)
call void @putch( i32 10)
call void @putch( i32 10)
br label %7
48:
ret i32 0
}
