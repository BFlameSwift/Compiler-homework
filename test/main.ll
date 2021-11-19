declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@ascii_0 = dso_local constant i32 48, align 4
define dso_local i32@main(){
%1 = alloca i32
store i32 0, i32* %1
%2 = alloca i32
br label %3
3:
%4 = icmp ne i32 1, 0
br i1 %4, label %5, label %19
5:
%6 = call i32 @getch()
%7 = sub i32 %6, 48
store i32 %7, i32* %2
%8 = load i32, i32* %2
%9 = icmp slt i32 %8, 0
%10 = load i32, i32* %2
%11 = icmp sgt i32 %10, 9
%12= zext i1 %9 to i32
%13= zext i1 %11 to i32
%14 = or i32 %12, %13
%15 = icmp ne i32 %14, 0
br i1 %15, label %16, label %17
16:
br label %3
17:
br label %18
18:
br label %3
19:
%20 = load i32, i32* %2
store i32 %20, i32* %1
br label %21
21:
%22 = icmp ne i32 1, 0
br i1 %22, label %23, label %41
23:
%24 = call i32 @getch()
%25 = sub i32 %24, 48
store i32 %25, i32* %2
%26 = load i32, i32* %2
%27 = icmp sge i32 %26, 0
%28 = load i32, i32* %2
%29 = icmp sle i32 %28, 9
%30= zext i1 %27 to i32
%31= zext i1 %29 to i32
%32 = and i32 %30, %31
%33 = icmp ne i32 %32, 0
br i1 %33, label %34, label %39
34:
%35 = load i32, i32* %1
%36 = mul i32 %35, 10
%37 = load i32, i32* %2
%38 = add i32 %36, %37
store i32 %38, i32* %1
br label %40
39:
br label %40
40:
br label %21
41:
%42 = load i32, i32* %1
call void @putint( i32 %42)
call void @putch( i32 10)
store i32 0, i32* %1
br label %43
43:
%44 = icmp ne i32 1, 0
br i1 %44, label %45, label %59
45:
%46 = call i32 @getch()
%47 = sub i32 %46, 48
store i32 %47, i32* %2
%48 = load i32, i32* %2
%49 = icmp slt i32 %48, 0
%50 = load i32, i32* %2
%51 = icmp sgt i32 %50, 9
%52= zext i1 %49 to i32
%53= zext i1 %51 to i32
%54 = or i32 %52, %53
%55 = icmp ne i32 %54, 0
br i1 %55, label %56, label %57
56:
br label %43
57:
br label %58
58:
br label %43
59:
%60 = load i32, i32* %2
store i32 %60, i32* %1
br label %61
61:
%62 = icmp ne i32 1, 0
br i1 %62, label %63, label %81
63:
%64 = call i32 @getch()
%65 = sub i32 %64, 48
store i32 %65, i32* %2
%66 = load i32, i32* %2
%67 = icmp sge i32 %66, 0
%68 = load i32, i32* %2
%69 = icmp sle i32 %68, 9
%70= zext i1 %67 to i32
%71= zext i1 %69 to i32
%72 = and i32 %70, %71
%73 = icmp ne i32 %72, 0
br i1 %73, label %74, label %79
74:
%75 = load i32, i32* %1
%76 = mul i32 %75, 10
%77 = load i32, i32* %2
%78 = add i32 %76, %77
store i32 %78, i32* %1
br label %80
79:
br label %80
80:
br label %61
81:
%82 = load i32, i32* %1
call void @putint( i32 %82)
ret i32 0
}
