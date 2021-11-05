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
store i32 5, i32* %1
store i32 5, i32* %2
store i32 1, i32* %3
store i32 -2, i32* %4
store i32 2, i32* %5
%6 = load i32, i32* %4
%7 = mul i32 %6, 1
%8 = sdiv i32 %7, 2
%9 = icmp slt i32 %8, 0
%10 = zext i1 %9 to i32
%11 = load i32, i32* %1
%12 = load i32, i32* %2
%13 = sub i32 %11, %12
%14 = icmp ne i32 %13, 0
%15 = zext i1 %14 to i32
%16 = load i32, i32* %3
%17 = add i32 %16, 3
%18 = srem i32 %17, 2
%19 = icmp ne i32 %18, 0
%20 = zext i1 %19 to i32
%21= zext i1 %9 to i32
%22= zext i1 %19 to i32
%23 = or i32 %21, %22
%24 = icmp ne i32 %23, 0
br i1 %24, label %25, label %27
25:
%26 = load i32, i32* %5
call void @putint( i32 %26)
br label %27
27:
%28 = load i32, i32* %4
%29 = srem i32 %28, 2
%30 = add i32 %29, 67
%31 = icmp slt i32 %30, 0
%32 = zext i1 %31 to i32
%33 = load i32, i32* %1
%34 = load i32, i32* %2
%35 = sub i32 %33, %34
%36 = icmp ne i32 %35, 0
%37 = zext i1 %36 to i32
%38 = load i32, i32* %3
%39 = add i32 %38, 2
%40 = srem i32 %39, 2
%41 = icmp ne i32 %40, 0
%42 = zext i1 %41 to i32
%43= zext i1 %31 to i32
%44= zext i1 %41 to i32
%45 = or i32 %43, %44
%46 = icmp ne i32 %45, 0
br i1 %46, label %47, label %49
47:
store i32 4, i32* %5
%48 = load i32, i32* %5
call void @putint( i32 %48)
br label %49
49:
ret i32 0
}
