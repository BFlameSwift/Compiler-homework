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
br i1 %7, label %8, label %16
8:
%9 = load i32, i32* %1
%10 = add i32 %9, 0
%11 = call i32 @getch()
%12 = getelementptr[ 32768 x i32 ],[32768 x i32 ]* @program, i32 0, i32 0
%13 = getelementptr i32,i32* %12, i32 %10
store i32 %11, i32* %13
%14 = load i32, i32* %1
%15 = add i32 %14, 1
store i32 %15, i32* %1
br label %4
16:
%17 = load i32, i32* %1
%18 = add i32 %17, 0
%19 = getelementptr[ 32768 x i32 ],[32768 x i32 ]* @program, i32 0, i32 0
%20 = getelementptr i32,i32* %19, i32 %18
store i32 0, i32* %20
%21 = alloca i32
%22 = alloca i32
store i32 0, i32* %1
br label %23
23:
%24 = load i32, i32* %1
%25 = add i32 %24, 0
%26 = getelementptr[ 32768 x i32 ],[32768 x i32 ]* @program, i32 0, i32 0
%27 = getelementptr i32,i32* %26, i32 %25
%28 = load i32, i32* %27
%29 = icmp ne i32 %28, 0
br i1 %29, label %30, label %138
30:
%31 = load i32, i32* %1
%32 = add i32 %31, 0
%33 = getelementptr[ 32768 x i32 ],[32768 x i32 ]* @program, i32 0, i32 0
%34 = getelementptr i32,i32* %33, i32 %32
%35 = load i32, i32* %34
store i32 %35, i32* %21
%36 = load i32, i32* %21
%37 = icmp eq i32 %36, 62
br i1 %37, label %38, label %41
38:
%39 = load i32, i32* @ptr
%40 = add i32 %39, 1
store i32 %40, i32* @ptr
br label %135
41:
%42 = load i32, i32* %21
%43 = icmp eq i32 %42, 60
br i1 %43, label %44, label %47
44:
%45 = load i32, i32* @ptr
%46 = sub i32 %45, 1
store i32 %46, i32* @ptr
br label %134
47:
%48 = load i32, i32* %21
%49 = icmp eq i32 %48, 43
br i1 %49, label %50, label %61
50:
%51 = load i32, i32* @ptr
%52 = add i32 %51, 0
%53 = load i32, i32* @ptr
%54 = add i32 %53, 0
%55 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 0
%56 = getelementptr i32,i32* %55, i32 %54
%57 = load i32, i32* %56
%58 = add i32 %57, 1
%59 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 0
%60 = getelementptr i32,i32* %59, i32 %52
store i32 %58, i32* %60
br label %133
61:
%62 = load i32, i32* %21
%63 = icmp eq i32 %62, 45
br i1 %63, label %64, label %75
64:
%65 = load i32, i32* @ptr
%66 = add i32 %65, 0
%67 = load i32, i32* @ptr
%68 = add i32 %67, 0
%69 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 0
%70 = getelementptr i32,i32* %69, i32 %68
%71 = load i32, i32* %70
%72 = sub i32 %71, 1
%73 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 0
%74 = getelementptr i32,i32* %73, i32 %66
store i32 %72, i32* %74
br label %132
75:
%76 = load i32, i32* %21
%77 = icmp eq i32 %76, 46
br i1 %77, label %78, label %84
78:
%79 = load i32, i32* @ptr
%80 = add i32 %79, 0
%81 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 0
%82 = getelementptr i32,i32* %81, i32 %80
%83 = load i32, i32* %82
call void @putch( i32 %83)
br label %131
84:
%85 = load i32, i32* %21
%86 = icmp eq i32 %85, 44
br i1 %86, label %87, label %93
87:
%88 = load i32, i32* @ptr
%89 = add i32 %88, 0
%90 = call i32 @getch()
%91 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 0
%92 = getelementptr i32,i32* %91, i32 %89
store i32 %90, i32* %92
br label %130
93:
%94 = load i32, i32* %21
%95 = icmp eq i32 %94, 93
%96 = load i32, i32* @ptr
%97 = add i32 %96, 0
%98 = getelementptr[ 65536 x i32 ],[65536 x i32 ]* @tape, i32 0, i32 0
%99 = getelementptr i32,i32* %98, i32 %97
%100 = load i32, i32* %99
%101 = icmp ne i32 %100, 0
%102 = and i1 %95, %101
br i1 %102, label %103, label %129
103:
store i32 1, i32* %22
br label %104
104:
%105 = load i32, i32* %22
%106 = icmp sgt i32 %105, 0
br i1 %106, label %107, label %128
107:
%108 = load i32, i32* %1
%109 = sub i32 %108, 1
store i32 %109, i32* %1
%110 = load i32, i32* %1
%111 = add i32 %110, 0
%112 = getelementptr[ 32768 x i32 ],[32768 x i32 ]* @program, i32 0, i32 0
%113 = getelementptr i32,i32* %112, i32 %111
%114 = load i32, i32* %113
store i32 %114, i32* %21
%115 = load i32, i32* %21
%116 = icmp eq i32 %115, 91
br i1 %116, label %117, label %120
117:
%118 = load i32, i32* %22
%119 = sub i32 %118, 1
store i32 %119, i32* %22
br label %127
120:
%121 = load i32, i32* %21
%122 = icmp eq i32 %121, 93
br i1 %122, label %123, label %126
123:
%124 = load i32, i32* %22
%125 = add i32 %124, 1
store i32 %125, i32* %22
br label %126
126:
br label %127
127:
br label %104
128:
br label %129
129:
br label %130
130:
br label %131
131:
br label %132
132:
br label %133
133:
br label %134
134:
br label %135
135:
%136 = load i32, i32* %1
%137 = add i32 %136, 1
store i32 %137, i32* %1
br label %23
138:
ret i32 0
}
