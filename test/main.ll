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
br i1 %4, label %5, label %20
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
br i1 %15, label %16, label %18
16:
br label %3
17:
br label %19
18:
br label %19
19:
br label %3
20:
%21 = load i32, i32* %2
store i32 %21, i32* %1
br label %22
22:
%23 = icmp ne i32 1, 0
br i1 %23, label %24, label %42
24:
%25 = call i32 @getch()
%26 = sub i32 %25, 48
store i32 %26, i32* %2
%27 = load i32, i32* %2
%28 = icmp sge i32 %27, 0
%29 = load i32, i32* %2
%30 = icmp sle i32 %29, 9
%31= zext i1 %28 to i32
%32= zext i1 %30 to i32
%33 = and i32 %31, %32
%34 = icmp ne i32 %33, 0
br i1 %34, label %35, label %40
35:
%36 = load i32, i32* %1
%37 = mul i32 %36, 10
%38 = load i32, i32* %2
%39 = add i32 %37, %38
store i32 %39, i32* %1
br label %41
40:
br label %41
41:
br label %22
42:
%43 = load i32, i32* %1
call void @putint( i32 %43)
call void @putch( i32 10)
store i32 0, i32* %1
br label %44
44:
%45 = icmp ne i32 1, 0
br i1 %45, label %46, label %61
46:
%47 = call i32 @getch()
%48 = sub i32 %47, 48
store i32 %48, i32* %2
%49 = load i32, i32* %2
%50 = icmp slt i32 %49, 0
%51 = load i32, i32* %2
%52 = icmp sgt i32 %51, 9
%53= zext i1 %50 to i32
%54= zext i1 %52 to i32
%55 = or i32 %53, %54
%56 = icmp ne i32 %55, 0
br i1 %56, label %57, label %59
57:
br label %44
58:
br label %60
59:
br label %60
60:
br label %44
61:
%62 = load i32, i32* %2
store i32 %62, i32* %1
br label %63
63:
%64 = icmp ne i32 1, 0
br i1 %64, label %65, label %83
65:
%66 = call i32 @getch()
%67 = sub i32 %66, 48
store i32 %67, i32* %2
%68 = load i32, i32* %2
%69 = icmp sge i32 %68, 0
%70 = load i32, i32* %2
%71 = icmp sle i32 %70, 9
%72= zext i1 %69 to i32
%73= zext i1 %71 to i32
%74 = and i32 %72, %73
%75 = icmp ne i32 %74, 0
br i1 %75, label %76, label %81
76:
%77 = load i32, i32* %1
%78 = mul i32 %77, 10
%79 = load i32, i32* %2
%80 = add i32 %78, %79
store i32 %80, i32* %1
br label %82
81:
br label %82
82:
br label %63
83:
%84 = load i32, i32* %1
call void @putint( i32 %84)
ret i32 0
}
