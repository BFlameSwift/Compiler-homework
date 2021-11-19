; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ascii_0 = dso_local constant i32 48, align 4
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define dso_local i32 @main() {
  %1 = alloca i32
  store i32 0, i32* %1
  %2 = alloca i32
  br label %3

3:                                                ; preds = %18, %16, %0
  %4 = icmp ne i32 1, 0
  br i1 %4, label %5, label %19

5:                                                ; preds = %3
  %6 = call i32 @getch()
  %7 = sub i32 %6, 48
  store i32 %7, i32* %2
  %8 = load i32, i32* %2
  %9 = icmp slt i32 %8, 0
  %10 = load i32, i32* %2
  %11 = icmp sgt i32 %10, 9
  %12 = zext i1 %9 to i32
  %13 = zext i1 %11 to i32
  %14 = or i32 %12, %13
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %5
  br label %3

17:                                               ; preds = %5
  br label %18

18:                                               ; preds = %17
  br label %3

19:                                               ; preds = %3
  %20 = load i32, i32* %2
  store i32 %20, i32* %1
  br label %21

21:                                               ; preds = %40, %19
  %22 = icmp ne i32 1, 0
  br i1 %22, label %23, label %41

23:                                               ; preds = %21
  %24 = call i32 @getch()
  %25 = sub i32 %24, 48
  store i32 %25, i32* %2
  %26 = load i32, i32* %2
  %27 = icmp sge i32 %26, 0
  %28 = load i32, i32* %2
  %29 = icmp sle i32 %28, 9
  %30 = zext i1 %27 to i32
  %31 = zext i1 %29 to i32
  %32 = and i32 %30, %31
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %39

34:                                               ; preds = %23
  %35 = load i32, i32* %1
  %36 = mul i32 %35, 10
  %37 = load i32, i32* %2
  %38 = add i32 %36, %37
  store i32 %38, i32* %1
  br label %40

39:                                               ; preds = %23
  br label %40

40:                                               ; preds = %39, %34
  br label %21

41:                                               ; preds = %21
  %42 = load i32, i32* %1
  call void @putint(i32 %42)
  call void @putch(i32 10)
  store i32 0, i32* %1
  br label %43

43:                                               ; preds = %58, %56, %41
  %44 = icmp ne i32 1, 0
  br i1 %44, label %45, label %59

45:                                               ; preds = %43
  %46 = call i32 @getch()
  %47 = sub i32 %46, 48
  store i32 %47, i32* %2
  %48 = load i32, i32* %2
  %49 = icmp slt i32 %48, 0
  %50 = load i32, i32* %2
  %51 = icmp sgt i32 %50, 9
  %52 = zext i1 %49 to i32
  %53 = zext i1 %51 to i32
  %54 = or i32 %52, %53
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %57

56:                                               ; preds = %45
  br label %43

57:                                               ; preds = %45
  br label %58

58:                                               ; preds = %57
  br label %43

59:                                               ; preds = %43
  %60 = load i32, i32* %2
  store i32 %60, i32* %1
  br label %61

61:                                               ; preds = %80, %59
  %62 = icmp ne i32 1, 0
  br i1 %62, label %63, label %81

63:                                               ; preds = %61
  %64 = call i32 @getch()
  %65 = sub i32 %64, 48
  store i32 %65, i32* %2
  %66 = load i32, i32* %2
  %67 = icmp sge i32 %66, 0
  %68 = load i32, i32* %2
  %69 = icmp sle i32 %68, 9
  %70 = zext i1 %67 to i32
  %71 = zext i1 %69 to i32
  %72 = and i32 %70, %71
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %79

74:                                               ; preds = %63
  %75 = load i32, i32* %1
  %76 = mul i32 %75, 10
  %77 = load i32, i32* %2
  %78 = add i32 %76, %77
  store i32 %78, i32* %1
  br label %80

79:                                               ; preds = %63
  br label %80

80:                                               ; preds = %79, %74
  br label %61

81:                                               ; preds = %61
  %82 = load i32, i32* %1
  call void @putint(i32 %82)
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
