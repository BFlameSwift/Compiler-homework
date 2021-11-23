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
  br i1 %7, label %8, label %15

8:                                                ; preds = %4
  %9 = load i32, i32* %1
  %10 = add i32 %9, 0
  %11 = call i32 @getch()
  %12 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 %10
  store i32 %11, i32* %12
  %13 = load i32, i32* %1
  %14 = add i32 %13, 1
  store i32 %14, i32* %1
  br label %4

15:                                               ; preds = %4
  %16 = load i32, i32* %1
  %17 = add i32 %16, 0
  %18 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 %17
  store i32 0, i32* %18
  %19 = alloca i32
  %20 = alloca i32
  store i32 0, i32* %1
  br label %21

21:                                               ; preds = %123, %15
  %22 = load i32, i32* %1
  %23 = add i32 %22, 0
  %24 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 %23
  %25 = load i32, i32* %24
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %126

27:                                               ; preds = %21
  %28 = load i32, i32* %1
  %29 = add i32 %28, 0
  %30 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 %29
  %31 = load i32, i32* %30
  store i32 %31, i32* %19
  %32 = load i32, i32* %19
  %33 = icmp eq i32 %32, 62
  br i1 %33, label %34, label %37

34:                                               ; preds = %27
  %35 = load i32, i32* @ptr
  %36 = add i32 %35, 1
  store i32 %36, i32* @ptr
  br label %123

37:                                               ; preds = %27
  %38 = load i32, i32* %19
  %39 = icmp eq i32 %38, 60
  br i1 %39, label %40, label %43

40:                                               ; preds = %37
  %41 = load i32, i32* @ptr
  %42 = sub i32 %41, 1
  store i32 %42, i32* @ptr
  br label %122

43:                                               ; preds = %37
  %44 = load i32, i32* %19
  %45 = icmp eq i32 %44, 43
  br i1 %45, label %46, label %55

46:                                               ; preds = %43
  %47 = load i32, i32* @ptr
  %48 = add i32 %47, 0
  %49 = load i32, i32* @ptr
  %50 = add i32 %49, 0
  %51 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %50
  %52 = load i32, i32* %51
  %53 = add i32 %52, 1
  %54 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %48
  store i32 %53, i32* %54
  br label %121

55:                                               ; preds = %43
  %56 = load i32, i32* %19
  %57 = icmp eq i32 %56, 45
  br i1 %57, label %58, label %67

58:                                               ; preds = %55
  %59 = load i32, i32* @ptr
  %60 = add i32 %59, 0
  %61 = load i32, i32* @ptr
  %62 = add i32 %61, 0
  %63 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %62
  %64 = load i32, i32* %63
  %65 = sub i32 %64, 1
  %66 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %60
  store i32 %65, i32* %66
  br label %120

67:                                               ; preds = %55
  %68 = load i32, i32* %19
  %69 = icmp eq i32 %68, 46
  br i1 %69, label %70, label %75

70:                                               ; preds = %67
  %71 = load i32, i32* @ptr
  %72 = add i32 %71, 0
  %73 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %72
  %74 = load i32, i32* %73
  call void @putch(i32 %74)
  br label %119

75:                                               ; preds = %67
  %76 = load i32, i32* %19
  %77 = icmp eq i32 %76, 44
  br i1 %77, label %78, label %83

78:                                               ; preds = %75
  %79 = load i32, i32* @ptr
  %80 = add i32 %79, 0
  %81 = call i32 @getch()
  %82 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %80
  store i32 %81, i32* %82
  br label %118

83:                                               ; preds = %75
  %84 = load i32, i32* %19
  %85 = icmp eq i32 %84, 93
  %86 = load i32, i32* @ptr
  %87 = add i32 %86, 0
  %88 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %87
  %89 = load i32, i32* %88
  %90 = icmp ne i32 %89, 0
  %91 = and i1 %85, %90
  br i1 %91, label %92, label %117

92:                                               ; preds = %83
  store i32 1, i32* %20
  br label %93

93:                                               ; preds = %115, %92
  %94 = load i32, i32* %20
  %95 = icmp sgt i32 %94, 0
  br i1 %95, label %96, label %116

96:                                               ; preds = %93
  %97 = load i32, i32* %1
  %98 = sub i32 %97, 1
  store i32 %98, i32* %1
  %99 = load i32, i32* %1
  %100 = add i32 %99, 0
  %101 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 %100
  %102 = load i32, i32* %101
  store i32 %102, i32* %19
  %103 = load i32, i32* %19
  %104 = icmp eq i32 %103, 91
  br i1 %104, label %105, label %108

105:                                              ; preds = %96
  %106 = load i32, i32* %20
  %107 = sub i32 %106, 1
  store i32 %107, i32* %20
  br label %115

108:                                              ; preds = %96
  %109 = load i32, i32* %19
  %110 = icmp eq i32 %109, 93
  br i1 %110, label %111, label %114

111:                                              ; preds = %108
  %112 = load i32, i32* %20
  %113 = add i32 %112, 1
  store i32 %113, i32* %20
  br label %114

114:                                              ; preds = %111, %108
  br label %115

115:                                              ; preds = %114, %105
  br label %93

116:                                              ; preds = %93
  br label %117

117:                                              ; preds = %116, %83
  br label %118

118:                                              ; preds = %117, %78
  br label %119

119:                                              ; preds = %118, %70
  br label %120

120:                                              ; preds = %119, %58
  br label %121

121:                                              ; preds = %120, %46
  br label %122

122:                                              ; preds = %121, %40
  br label %123

123:                                              ; preds = %122, %34
  %124 = load i32, i32* %1
  %125 = add i32 %124, 1
  store i32 %125, i32* %1
  br label %21

126:                                              ; preds = %21
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
