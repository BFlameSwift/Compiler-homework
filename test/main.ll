declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32@main(){
%1 = alloca i32
store i32 1, i32* %1
%2 = alloca i32
%3 = load i32, i32* %1
%4 = icmp eq i32 %3, 1
br i1 %4, label %5, label %47
5:
store i32 0, i32* %2
%6 = load i32, i32* %1
%7 = add i32 %6, 1
store i32 %7, i32* %1
%8 = load i32, i32* %2
%9 = load i32, i32* %1
%10 = add i32 %8, %9
store i32 %10, i32* %2
%11 = load i32, i32* %1
%12 = icmp eq i32 %11, 2
br i1 %12, label %13, label %46
13:
%14 = load i32, i32* %1
%15 = add i32 %14, 2
store i32 %15, i32* %1
%16 = load i32, i32* %2
%17 = load i32, i32* %1
%18 = sub i32 %16, %17
store i32 %18, i32* %2
%19 = load i32, i32* %1
%20 = icmp eq i32 %19, 4
br i1 %20, label %21, label %45
21:
%22 = load i32, i32* %1
%23 = add i32 %22, 4
store i32 %23, i32* %1
%24 = load i32, i32* %2
%25 = load i32, i32* %1
%26 = add i32 %24, %25
store i32 %26, i32* %2
%27 = load i32, i32* %1
%28 = icmp ne i32 %27, 8
br i1 %28, label %29, label %44
29:
%30 = load i32, i32* %1
%31 = add i32 %30, 8
store i32 %31, i32* %1
%32 = load i32, i32* %2
%33 = load i32, i32* %1
%34 = sub i32 %32, %33
store i32 %34, i32* %2
%35 = load i32, i32* %1
%36 = icmp eq i32 %35, 16
br i1 %36, label %37, label %43
37:
%38 = load i32, i32* %1
%39 = add i32 %38, 16
store i32 %39, i32* %1
%40 = load i32, i32* %2
%41 = load i32, i32* %1
%42 = add i32 %40, %41
store i32 %42, i32* %2
br label %43
43:
br label %44
44:
br label %45
45:
br label %46
46:
br label %47
47:
%48 = load i32, i32* %1
call void @putint( i32 %48)
%49 = load i32, i32* %2
call void @putint( i32 %49)
ret i32 0
}
