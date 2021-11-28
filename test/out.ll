; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define dso_local i32 @func1(i32 %0, i32 %1, i32 %2) {
  %4 = alloca i32
  store i32 %0, i32* %4
  %5 = alloca i32
  store i32 %1, i32* %5
  %6 = alloca i32
  store i32 %2, i32* %6
  %7 = load i32, i32* %6
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %14

9:                                                ; preds = %3
  %10 = load i32, i32* %4
  %11 = load i32, i32* %5
  %12 = mul i32 %10, %11
  ret i32 %12

13:                                               ; No predecessors!
  br label %21

14:                                               ; preds = %3
  %15 = load i32, i32* %4
  %16 = load i32, i32* %5
  %17 = load i32, i32* %6
  %18 = sub i32 %16, %17
  %19 = call i32 @func1(i32 %15, i32 %18, i32 0)
  ret i32 %19

20:                                               ; No predecessors!
  br label %21

21:                                               ; preds = %20, %13
  ret i32 0
}

define dso_local i32 @func2(i32 %0, i32 %1) {
  %3 = alloca i32
  store i32 %0, i32* %3
  %4 = alloca i32
  store i32 %1, i32* %4
  %5 = load i32, i32* %4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %13

7:                                                ; preds = %2
  %8 = load i32, i32* %3
  %9 = load i32, i32* %4
  %10 = srem i32 %8, %9
  %11 = call i32 @func2(i32 %10, i32 0)
  ret i32 %11

12:                                               ; No predecessors!
  br label %16

13:                                               ; preds = %2
  %14 = load i32, i32* %3
  ret i32 %14

15:                                               ; No predecessors!
  br label %16

16:                                               ; preds = %15, %12
  ret i32 0
}

define dso_local i32 @func3(i32 %0, i32 %1) {
  %3 = alloca i32
  store i32 %0, i32* %3
  %4 = alloca i32
  store i32 %1, i32* %4
  %5 = load i32, i32* %4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = load i32, i32* %3
  %9 = add i32 %8, 1
  ret i32 %9

10:                                               ; No predecessors!
  br label %17

11:                                               ; preds = %2
  %12 = load i32, i32* %3
  %13 = load i32, i32* %4
  %14 = add i32 %12, %13
  %15 = call i32 @func3(i32 %14, i32 0)
  ret i32 %15

16:                                               ; No predecessors!
  br label %17

17:                                               ; preds = %16, %10
  ret i32 0
}

define dso_local i32 @func4(i32 %0, i32 %1, i32 %2) {
  %4 = alloca i32
  store i32 %0, i32* %4
  %5 = alloca i32
  store i32 %1, i32* %5
  %6 = alloca i32
  store i32 %2, i32* %6
  %7 = load i32, i32* %4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %3
  %10 = load i32, i32* %5
  ret i32 %10

11:                                               ; No predecessors!
  br label %15

12:                                               ; preds = %3
  %13 = load i32, i32* %6
  ret i32 %13

14:                                               ; No predecessors!
  br label %15

15:                                               ; preds = %14, %11
  ret i32 0
}

define dso_local i32 @func5(i32 %0) {
  %2 = alloca i32
  store i32 %0, i32* %2
  %3 = load i32, i32* %2
  %4 = mul i32 %3, -1
  ret i32 %4
}

define dso_local i32 @func6(i32 %0, i32 %1) {
  %3 = alloca i32
  store i32 %0, i32* %3
  %4 = alloca i32
  store i32 %1, i32* %4
  %5 = load i32, i32* %3
  %6 = load i32, i32* %4
  %7 = icmp ne i32 %5, 0
  %8 = icmp ne i32 %6, 0
  %9 = and i1 %7, %8
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  ret i32 1

11:                                               ; No predecessors!
  br label %14

12:                                               ; preds = %2
  ret i32 0

13:                                               ; No predecessors!
  br label %14

14:                                               ; preds = %13, %11
  ret i32 0
}

define dso_local i32 @func7(i32 %0) {
  %2 = alloca i32
  store i32 %0, i32* %2
  %3 = load i32, i32* %2
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  ret i32 1

6:                                                ; No predecessors!
  br label %9

7:                                                ; preds = %1
  ret i32 0

8:                                                ; No predecessors!
  br label %9

9:                                                ; preds = %8, %6
  ret i32 0
}

define dso_local i32 @main() {
  %1 = call i32 @getint()
  %2 = alloca i32
  store i32 %1, i32* %2
  %3 = call i32 @getint()
  %4 = alloca i32
  store i32 %3, i32* %4
  %5 = call i32 @getint()
  %6 = alloca i32
  store i32 %5, i32* %6
  %7 = call i32 @getint()
  %8 = alloca i32
  store i32 %7, i32* %8
  %9 = alloca [10 x i32]
  %10 = alloca i32
  store i32 0, i32* %10
  br label %11

11:                                               ; preds = %14, %0
  %12 = load i32, i32* %10
  %13 = icmp slt i32 %12, 10
  br i1 %13, label %14, label %21

14:                                               ; preds = %11
  %15 = load i32, i32* %10
  %16 = add i32 %15, 0
  %17 = call i32 @getint()
  %18 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 %16
  store i32 %17, i32* %18
  %19 = load i32, i32* %10
  %20 = add i32 %19, 1
  store i32 %20, i32* %10
  br label %11

21:                                               ; preds = %11
  %22 = load i32, i32* %2
  %23 = call i32 @func7(i32 %22)
  %24 = load i32, i32* %4
  %25 = call i32 @func5(i32 %24)
  %26 = call i32 @func6(i32 %23, i32 %25)
  %27 = load i32, i32* %6
  %28 = call i32 @func2(i32 %26, i32 %27)
  %29 = load i32, i32* %8
  %30 = call i32 @func3(i32 %28, i32 %29)
  %31 = call i32 @func5(i32 %30)
  %32 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 0
  %33 = load i32, i32* %32
  %34 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 1
  %35 = load i32, i32* %34
  %36 = call i32 @func5(i32 %35)
  %37 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 2
  %38 = load i32, i32* %37
  %39 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 3
  %40 = load i32, i32* %39
  %41 = call i32 @func7(i32 %40)
  %42 = call i32 @func6(i32 %38, i32 %41)
  %43 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 4
  %44 = load i32, i32* %43
  %45 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 5
  %46 = load i32, i32* %45
  %47 = call i32 @func7(i32 %46)
  %48 = call i32 @func2(i32 %44, i32 %47)
  %49 = call i32 @func4(i32 %36, i32 %42, i32 %48)
  %50 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 6
  %51 = load i32, i32* %50
  %52 = call i32 @func3(i32 %49, i32 %51)
  %53 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 7
  %54 = load i32, i32* %53
  %55 = call i32 @func2(i32 %52, i32 %54)
  %56 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 8
  %57 = load i32, i32* %56
  %58 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 9
  %59 = load i32, i32* %58
  %60 = call i32 @func7(i32 %59)
  %61 = call i32 @func3(i32 %57, i32 %60)
  %62 = load i32, i32* %2
  %63 = call i32 @func1(i32 %55, i32 %61, i32 %62)
  %64 = call i32 @func4(i32 %31, i32 %33, i32 %63)
  %65 = load i32, i32* %4
  %66 = load i32, i32* %6
  %67 = call i32 @func7(i32 %66)
  %68 = load i32, i32* %8
  %69 = call i32 @func3(i32 %67, i32 %68)
  %70 = call i32 @func2(i32 %65, i32 %69)
  %71 = call i32 @func3(i32 %64, i32 %70)
  %72 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 0
  %73 = load i32, i32* %72
  %74 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 1
  %75 = load i32, i32* %74
  %76 = call i32 @func1(i32 %71, i32 %73, i32 %75)
  %77 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 2
  %78 = load i32, i32* %77
  %79 = call i32 @func2(i32 %76, i32 %78)
  %80 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 3
  %81 = load i32, i32* %80
  %82 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 4
  %83 = load i32, i32* %82
  %84 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 5
  %85 = load i32, i32* %84
  %86 = call i32 @func5(i32 %85)
  %87 = call i32 @func3(i32 %83, i32 %86)
  %88 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 6
  %89 = load i32, i32* %88
  %90 = call i32 @func5(i32 %89)
  %91 = call i32 @func2(i32 %87, i32 %90)
  %92 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 7
  %93 = load i32, i32* %92
  %94 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 8
  %95 = load i32, i32* %94
  %96 = call i32 @func7(i32 %95)
  %97 = call i32 @func1(i32 %91, i32 %93, i32 %96)
  %98 = getelementptr [10 x i32], [10 x i32]* %9, i32 0, i32 9
  %99 = load i32, i32* %98
  %100 = call i32 @func5(i32 %99)
  %101 = call i32 @func2(i32 %97, i32 %100)
  %102 = load i32, i32* %2
  %103 = call i32 @func3(i32 %101, i32 %102)
  %104 = call i32 @func1(i32 %79, i32 %81, i32 %103)
  %105 = alloca i32
  store i32 %104, i32* %105
  %106 = load i32, i32* %105
  call void @putint(i32 %106)
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
