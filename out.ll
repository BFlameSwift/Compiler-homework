; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@TAPE_LEN = dso_local constant i32 65536, align 4
@BUFFER_LEN = dso_local constant i32 32768, align 4
@tape = dso_local global [65536 x i32] zeroinitializer
@program = dso_local global [32768 x i32] zeroinitializer
@ptr = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define dso_local i32 @main() {
  %1 = alloca i32
  store i32 0, i32* %1
  %2 = call i32 @getint()
  %3 = alloca i32
  store i32 %2, i32* %3
  br label %4

4:                                                ; preds = %8, %0
  %5 = load i32, i32* %1
  %6 = load i32, i32* %3
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %16

8:                                                ; preds = %4
  %9 = load i32, i32* %1
  %10 = add i32 %9, 0
  %11 = call i32 @getch()
  %12 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 0
  %13 = getelementptr i32, i32* %12, i32 %10
  store i32 %11, i32* %13
  %14 = load i32, i32* %1
  %15 = add i32 %14, 1
  store i32 %15, i32* %1
  br label %4

16:                                               ; preds = %4
  %17 = load i32, i32* %1
  %18 = add i32 %17, 0
  %19 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 0
  %20 = getelementptr i32, i32* %19, i32 %18
  store i32 0, i32* %20
  %21 = alloca i32
  %22 = alloca i32
  store i32 0, i32* %1
  br label %23

23:                                               ; preds = %126, %16
  %24 = load i32, i32* %1
  %25 = add i32 %24, 0
  %26 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 0
  %27 = getelementptr i32, i32* %26, i32 %25
  %28 = load i32, i32* %27
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %129

30:                                               ; preds = %23
  %31 = load i32, i32* %1
  %32 = add i32 %31, 0
  %33 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 0
  %34 = getelementptr i32, i32* %33, i32 %32
  %35 = load i32, i32* %34
  store i32 %35, i32* %21
  %36 = load i32, i32* %21
  %37 = icmp eq i32 %36, 62
  br i1 %37, label %38, label %41

38:                                               ; preds = %30
  %39 = load i32, i32* @ptr
  %40 = add i32 %39, 1
  store i32 %40, i32* @ptr
  br label %126

41:                                               ; preds = %30
  %42 = load i32, i32* %21
  %43 = icmp eq i32 %42, 60
  br i1 %43, label %44, label %47

44:                                               ; preds = %41
  %45 = load i32, i32* @ptr
  %46 = sub i32 %45, 1
  store i32 %46, i32* @ptr
  br label %125

47:                                               ; preds = %41
  %48 = load i32, i32* %21
  %49 = icmp eq i32 %48, 43
  br i1 %49, label %50, label %61

50:                                               ; preds = %47
  %51 = load i32, i32* @ptr
  %52 = add i32 %51, 0
  %53 = load i32, i32* @ptr
  %54 = add i32 %53, 0
  %55 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 0
  %56 = getelementptr i32, i32* %55, i32 %54
  %57 = load i32, i32* %56
  %58 = add i32 %57, 1
  %59 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 0
  %60 = getelementptr i32, i32* %59, i32 %52
  store i32 %58, i32* %60
  br label %124

61:                                               ; preds = %47
  %62 = load i32, i32* %21
  %63 = icmp eq i32 %62, 45
  br i1 %63, label %64, label %75

64:                                               ; preds = %61
  %65 = load i32, i32* @ptr
  %66 = add i32 %65, 0
  %67 = load i32, i32* @ptr
  %68 = add i32 %67, 0
  %69 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 0
  %70 = getelementptr i32, i32* %69, i32 %68
  %71 = load i32, i32* %70
  %72 = sub i32 %71, 1
  %73 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 0
  %74 = getelementptr i32, i32* %73, i32 %66
  store i32 %72, i32* %74
  br label %123

75:                                               ; preds = %61
  %76 = load i32, i32* %21
  %77 = icmp eq i32 %76, 46
  br i1 %77, label %78, label %84

78:                                               ; preds = %75
  %79 = load i32, i32* @ptr
  %80 = add i32 %79, 0
  %81 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 0
  %82 = getelementptr i32, i32* %81, i32 %80
  %83 = load i32, i32* %82
  call void @putint(i32 %83)
  br label %122

84:                                               ; preds = %75
  %85 = load i32, i32* %21
  %86 = icmp eq i32 %85, 93
  %87 = load i32, i32* @ptr
  %88 = add i32 %87, 0
  %89 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 0
  %90 = getelementptr i32, i32* %89, i32 %88
  %91 = load i32, i32* %90
  %92 = zext i1 %86 to i32
  %93 = and i32 %92, %91
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %121

95:                                               ; preds = %84
  store i32 1, i32* %22
  br label %96

96:                                               ; preds = %119, %95
  %97 = load i32, i32* %22
  %98 = icmp sgt i32 %97, 0
  br i1 %98, label %99, label %120

99:                                               ; preds = %96
  %100 = load i32, i32* %1
  %101 = sub i32 %100, 1
  store i32 %101, i32* %1
  %102 = load i32, i32* %1
  %103 = add i32 %102, 0
  %104 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 0
  %105 = getelementptr i32, i32* %104, i32 %103
  %106 = load i32, i32* %105
  store i32 %106, i32* %21
  %107 = load i32, i32* %21
  %108 = icmp eq i32 %107, 91
  br i1 %108, label %109, label %112

109:                                              ; preds = %99
  %110 = load i32, i32* %22
  %111 = sub i32 %110, 1
  store i32 %111, i32* %22
  br label %119

112:                                              ; preds = %99
  %113 = load i32, i32* %21
  %114 = icmp eq i32 %113, 93
  br i1 %114, label %115, label %118

115:                                              ; preds = %112
  %116 = load i32, i32* %22
  %117 = add i32 %116, 1
  store i32 %117, i32* %22
  br label %118

118:                                              ; preds = %115, %112
  br label %119

119:                                              ; preds = %118, %109
  br label %96

120:                                              ; preds = %96
  br label %121

121:                                              ; preds = %120, %84
  br label %122

122:                                              ; preds = %121, %78
  br label %123

123:                                              ; preds = %122, %64
  br label %124

124:                                              ; preds = %123, %50
  br label %125

125:                                              ; preds = %124, %44
  br label %126

126:                                              ; preds = %125, %38
  %127 = load i32, i32* %1
  %128 = add i32 %127, 1
  store i32 %128, i32* %1
  br label %23

129:                                              ; preds = %23
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getint() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %1)
  %3 = load i32, i32* %1, align 4
  ret i32 %3
}

declare dso_local i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getch() #0 {
  %1 = alloca i8, align 1
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* %1)
  %3 = load i8, i8* %1, align 1
  %4 = sext i8 %3 to i32
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getarray(i32* %0) #0 {
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32* %0, i32** %2, align 8
  %5 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %3)
  store i32 0, i32* %4, align 4
  br label %6

6:                                                ; preds = %16, %1
  %7 = load i32, i32* %4, align 4
  %8 = load i32, i32* %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %19

10:                                               ; preds = %6
  %11 = load i32*, i32** %2, align 8
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32* %11, i64 %13
  %15 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %14)
  br label %16

16:                                               ; preds = %10
  %17 = load i32, i32* %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %4, align 4
  br label %6

19:                                               ; preds = %6
  %20 = load i32, i32* %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putint(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %3)
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putch(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putarray(i32 %0, i32* %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32* %1, i32** %4, align 8
  %6 = load i32, i32* %3, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %6)
  store i32 0, i32* %5, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %22

12:                                               ; preds = %8
  %13 = load i32*, i32** %4, align 8
  %14 = load i32, i32* %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32* %13, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %17)
  br label %19

19:                                               ; preds = %12
  %20 = load i32, i32* %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %5, align 4
  br label %8

22:                                               ; preds = %8
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 10.0.0-4ubuntu1 "}
!1 = !{i32 1, !"wchar_size", i32 4}
