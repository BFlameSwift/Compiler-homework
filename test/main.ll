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
%10 = load i32, i32* %1
%11 = load i32, i32* %2
%12 = sub i32 %10, %11
%13 = icmp ne i32 %12, 0
%14 = load i32, i32* %3
%15 = add i32 %14, 3
%16 = srem i32 %15, 2
%17 = icmp ne i32 %16, 0
%18= zext i1 %13 to i32
%19= zext i1 %17 to i32
%20 = and i32 %18, %19
%21= zext i1 %9 to i32
%22 = or i32 %21, %20
%23 = icmp ne i32 %22, 0
br i1 %23, label %24, label %26
24:
%25 = load i32, i32* %5
call void @putint( i32 %25)
br label %26
26:
%27 = load i32, i32* %4
%28 = srem i32 %27, 2
%29 = add i32 %28, 67
%30 = icmp slt i32 %29, 0
%31 = load i32, i32* %1
%32 = load i32, i32* %2
%33 = sub i32 %31, %32
%34 = icmp ne i32 %33, 0
%35 = load i32, i32* %3
%36 = add i32 %35, 2
%37 = srem i32 %36, 2
%38 = icmp ne i32 %37, 0
%39= zext i1 %34 to i32
%40= zext i1 %38 to i32
%41 = and i32 %39, %40
%42= zext i1 %30 to i32
%43 = or i32 %42, %41
%44 = icmp ne i32 %43, 0
br i1 %44, label %45, label %47
45:
store i32 4, i32* %5
%46 = load i32, i32* %5
call void @putint( i32 %46)
br label %47
47:
ret i32 0
}
