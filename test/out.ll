; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ans = dso_local global [50 x i32] zeroinitializer
@sum = dso_local global i32 0, align 4
@n = common dso_local global i32 0, align 4
@row = dso_local global [50 x i32] zeroinitializer
@line1 = dso_local global [50 x i32] zeroinitializer
@line2 = dso_local global [100 x i32] zeroinitializer
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define dso_local void @printans() {
  %1 = load i32, i32* @sum
  %2 = add i32 %1, 1
  store i32 %2, i32* @sum
  %3 = alloca i32
  store i32 1, i32* %3
  br label %4

4:                                                ; preds = %18, %0
  %5 = load i32, i32* %3
  %6 = load i32, i32* @n
  %7 = icmp sle i32 %5, %6
  br i1 %7, label %8, label %21

8:                                                ; preds = %4
  %9 = load i32, i32* %3
  %10 = add i32 %9, 0
  %11 = getelementptr [50 x i32], [50 x i32]* @ans, i32 0, i32 %10
  %12 = load i32, i32* %11
  call void @putint(i32 %12)
  %13 = load i32, i32* %3
  %14 = load i32, i32* @n
  %15 = icmp eq i32 %13, %14
  br i1 %15, label %16, label %17

16:                                               ; preds = %8
  call void @putch(i32 10)
  br label %18

17:                                               ; preds = %8
  call void @putch(i32 32)
  br label %18

18:                                               ; preds = %17, %16
  %19 = load i32, i32* %3
  %20 = add i32 %19, 1
  store i32 %20, i32* %3
  br label %4

21:                                               ; preds = %4
  ret void
}

define dso_local void @f(i32 %0) {
  %2 = alloca i32
  store i32 %0, i32* %2
  %3 = alloca i32
  store i32 1, i32* %3
  br label %4

4:                                                ; preds = %73, %1
  %5 = load i32, i32* %3
  %6 = load i32, i32* @n
  %7 = icmp sle i32 %5, %6
  br i1 %7, label %8, label %76

8:                                                ; preds = %4
  %9 = load i32, i32* %3
  %10 = add i32 %9, 0
  %11 = getelementptr [50 x i32], [50 x i32]* @row, i32 0, i32 %10
  %12 = load i32, i32* %11
  %13 = icmp ne i32 %12, 1
  %14 = load i32, i32* %2
  %15 = load i32, i32* %3
  %16 = add i32 %14, %15
  %17 = add i32 %16, 0
  %18 = getelementptr [50 x i32], [50 x i32]* @line1, i32 0, i32 %17
  %19 = load i32, i32* %18
  %20 = icmp eq i32 %19, 0
  %21 = and i1 %13, %20
  %22 = load i32, i32* @n
  %23 = load i32, i32* %2
  %24 = add i32 %22, %23
  %25 = load i32, i32* %3
  %26 = sub i32 %24, %25
  %27 = add i32 %26, 0
  %28 = getelementptr [100 x i32], [100 x i32]* @line2, i32 0, i32 %27
  %29 = icmp eq i32 %27, 0
  %30 = and i1 %21, %29
  br i1 %30, label %31, label %73

31:                                               ; preds = %8
  %32 = load i32, i32* %2
  %33 = add i32 %32, 0
  %34 = load i32, i32* %3
  %35 = getelementptr [50 x i32], [50 x i32]* @ans, i32 0, i32 %33
  store i32 %34, i32* %35
  %36 = load i32, i32* %2
  %37 = load i32, i32* @n
  %38 = icmp eq i32 %36, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %31
  call void @printans()
  br label %40

40:                                               ; preds = %39, %31
  %41 = load i32, i32* %3
  %42 = add i32 %41, 0
  %43 = getelementptr [50 x i32], [50 x i32]* @row, i32 0, i32 %42
  store i32 1, i32* %43
  %44 = load i32, i32* %2
  %45 = load i32, i32* %3
  %46 = add i32 %44, %45
  %47 = add i32 %46, 0
  %48 = getelementptr [50 x i32], [50 x i32]* @line1, i32 0, i32 %47
  store i32 1, i32* %48
  %49 = load i32, i32* @n
  %50 = load i32, i32* %2
  %51 = add i32 %49, %50
  %52 = load i32, i32* %3
  %53 = sub i32 %51, %52
  %54 = add i32 %53, 0
  %55 = getelementptr [100 x i32], [100 x i32]* @line2, i32 0, i32 %54
  store i32 1, i32* %55
  %56 = load i32, i32* %2
  %57 = add i32 %56, 1
  call void @f(i32 %57)
  %58 = load i32, i32* %3
  %59 = add i32 %58, 0
  %60 = getelementptr [50 x i32], [50 x i32]* @row, i32 0, i32 %59
  store i32 0, i32* %60
  %61 = load i32, i32* %2
  %62 = load i32, i32* %3
  %63 = add i32 %61, %62
  %64 = add i32 %63, 0
  %65 = getelementptr [50 x i32], [50 x i32]* @line1, i32 0, i32 %64
  store i32 0, i32* %65
  %66 = load i32, i32* @n
  %67 = load i32, i32* %2
  %68 = add i32 %66, %67
  %69 = load i32, i32* %3
  %70 = sub i32 %68, %69
  %71 = add i32 %70, 0
  %72 = getelementptr [100 x i32], [100 x i32]* @line2, i32 0, i32 %71
  store i32 0, i32* %72
  br label %73

73:                                               ; preds = %40, %8
  %74 = load i32, i32* %3
  %75 = add i32 %74, 1
  store i32 %75, i32* %3
  br label %4

76:                                               ; preds = %4
  ret void
}

define dso_local i32 @main() {
  %1 = call i32 @getint()
  %2 = alloca i32
  store i32 %1, i32* %2
  br label %3

3:                                                ; preds = %6, %0
  %4 = load i32, i32* %2
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %10

6:                                                ; preds = %3
  %7 = call i32 @getint()
  store i32 %7, i32* @n
  call void @f(i32 1)
  %8 = load i32, i32* %2
  %9 = sub i32 %8, 1
  store i32 %9, i32* %2
  br label %3

10:                                               ; preds = %3
  ret i32 1
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
