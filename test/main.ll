declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@TAPE_LEN = dso_local constant i32 65536, align 4
@BUFFER_LEN = dso_local constant i32 32768, align 4
@tape = dso_local global [65536 x i32 ]  zeroinitializer 
@program = dso_local global [32768 x i32 ]  zeroinitializer 
@ptr = dso_local global i32 0, align 4
define dso_local i32@main(){
%1 = alloca i32
store i32 0, i32* %1
%2 = call i32 @getint()
%3 = alloca i32
store i32 %2, i32* %3
br label %4
4:
%5 = load i32, i32* %1
%6 = load i32, i32* %3
%7 = icmp slt i32 %5, %6
br i1 %7, label %8, label %15
8:
%9 = load i32, i32* %1
%10 = add i32 %9, 0
%11 = call i32 @getch()
%12 = getelementptr[ 32768 x i32 ],[32768 x i32 ]* @program, i32 0, i32 %10
store i32 %11, i32* %12
%13 = load i32, i32* %1
%14 = add i32 %13, 1
store i32 %14, i32* %1
br label %4
15:
%16 = load i32, i32* %1
%17 = add i32 %16, 0
%18 = getelementptr[ 32768 x i32 ],[32768 x i32 ]* @program, i32 0, i32 %17
store i32 0, i32* %18
%19 = alloca i32
%20 = alloca i32
store i32 0, i32* %1
br label %21
21:
%22 = load i32, i32* %1
%23 = add i32 %22, 0
%24 = getelementptr[ 32768 x i32 ],[32768 x i32 ]* @program, i32 0, i32 %23
%25 = load i32, i32* %24
%26 = icmp ne i32 %25, 0
br i1 %26, label %27, label %126
27:
%28 = load i32, i32* %1
%29 = add i32 %28, 0
%30 = getelementptr[ 32768 x i32 ],[32768 x i32 ]* @program, i32 0, i32 %29
%31 = load i32, i32* %30
store i32 %31, i32* %19
%32 = load i32, i32* %19
%33 = icmp eq i32 %32, 62
br i1 %33, label %34, label %37
34:
%35 = load i32, i32* @ptr
%36 = add i32 %35, 1
store i32 %36, i32* @ptr
br label %123
37:
%38 = load i32, i32* %19
%39 = icmp eq i32 %38, 60
br i1 %39, label %40, label %43
40:
%41 = load i32, i32* @ptr
%42 = sub i32 %41, 1
store i32 %42, i32* @ptr
br label %122
43:
%44 = load i32, i32* %19
%45 = icmp eq i32 %44, 43
br i1 %45, label %46, label %55
46:
%47 = load i32, i32* @ptr
%48 = add i32 %47, 0
%49 = load i32, i32* @ptr
%50 = add i32 %49, 0
%51 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 %50
%52 = load i32, i32* %51
%53 = add i32 %52, 1
%54 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 %48
store i32 %53, i32* %54
br label %121
55:
%56 = load i32, i32* %19
%57 = icmp eq i32 %56, 45
br i1 %57, label %58, label %67
58:
%59 = load i32, i32* @ptr
%60 = add i32 %59, 0
%61 = load i32, i32* @ptr
%62 = add i32 %61, 0
%63 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 %62
%64 = load i32, i32* %63
%65 = sub i32 %64, 1
%66 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 %60
store i32 %65, i32* %66
br label %120
67:
%68 = load i32, i32* %19
%69 = icmp eq i32 %68, 46
br i1 %69, label %70, label %75
70:
%71 = load i32, i32* @ptr
%72 = add i32 %71, 0
%73 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 %72
%74 = load i32, i32* %73
call void @putch( i32 %74)
br label %119
75:
%76 = load i32, i32* %19
%77 = icmp eq i32 %76, 44
br i1 %77, label %78, label %83
78:
%79 = load i32, i32* @ptr
%80 = add i32 %79, 0
%81 = call i32 @getch()
%82 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 %80
store i32 %81, i32* %82
br label %118
83:
%84 = load i32, i32* %19
%85 = icmp eq i32 %84, 93
%86 = load i32, i32* @ptr
%87 = add i32 %86, 0
%88 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 %87
%89 = load i32, i32* %88
%90 = icmp ne i32 %89, 0
%91 = and i1 %85, %90
br i1 %91, label %92, label %117
92:
store i32 1, i32* %20
br label %93
93:
%94 = load i32, i32* %20
%95 = icmp sgt i32 %94, 0
br i1 %95, label %96, label %116
96:
%97 = load i32, i32* %1
%98 = sub i32 %97, 1
store i32 %98, i32* %1
%99 = load i32, i32* %1
%100 = add i32 %99, 0
%101 = getelementptr[ 32768 x i32 ],[32768 x i32 ]* @program, i32 0, i32 %100
%102 = load i32, i32* %101
store i32 %102, i32* %19
%103 = load i32, i32* %19
%104 = icmp eq i32 %103, 91
br i1 %104, label %105, label %108
105:
%106 = load i32, i32* %20
%107 = sub i32 %106, 1
store i32 %107, i32* %20
br label %115
108:
%109 = load i32, i32* %19
%110 = icmp eq i32 %109, 93
br i1 %110, label %111, label %114
111:
%112 = load i32, i32* %20
%113 = add i32 %112, 1
store i32 %113, i32* %20
br label %114
114:
br label %115
115:
br label %93
116:
br label %117
117:
br label %118
118:
br label %119
119:
br label %120
120:
br label %121
121:
br label %122
122:
br label %123
123:
%124 = load i32, i32* %1
%125 = add i32 %124, 1
store i32 %125, i32* %1
br label %21
126:
ret i32 0
}
