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

3:                                                ; preds = %19, %16, %0
  %4 = icmp ne i32 1, 0
  br i1 %4, label %5, label %20

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
  br i1 %15, label %16, label %18

16:                                               ; preds = %5
  br label %3

17:                                               ; No predecessors!
  br label %19

18:                                               ; preds = %5
  br label %19

19:                                               ; preds = %18, %17
  br label %3

20:                                               ; preds = %3
  %21 = load i32, i32* %2
  store i32 %21, i32* %1
  br label %22

22:                                               ; preds = %41, %20
  %23 = icmp ne i32 1, 0
  br i1 %23, label %24, label %42

24:                                               ; preds = %22
  %25 = call i32 @getch()
  %26 = sub i32 %25, 48
  store i32 %26, i32* %2
  %27 = load i32, i32* %2
  %28 = icmp sge i32 %27, 0
  %29 = load i32, i32* %2
  %30 = icmp sle i32 %29, 9
  %31 = zext i1 %28 to i32
  %32 = zext i1 %30 to i32
  %33 = and i32 %31, %32
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %40

35:                                               ; preds = %24
  %36 = load i32, i32* %1
  %37 = mul i32 %36, 10
  %38 = load i32, i32* %2
  %39 = add i32 %37, %38
  store i32 %39, i32* %1
  br label %41

40:                                               ; preds = %24
  br label %41

41:                                               ; preds = %40, %35
  br label %22

42:                                               ; preds = %22
  %43 = load i32, i32* %1
  call void @putint(i32 %43)
  call void @putch(i32 10)
  store i32 0, i32* %1
  br label %44

44:                                               ; preds = %60, %57, %42
  %45 = icmp ne i32 1, 0
  br i1 %45, label %46, label %61

46:                                               ; preds = %44
  %47 = call i32 @getch()
  %48 = sub i32 %47, 48
  store i32 %48, i32* %2
  %49 = load i32, i32* %2
  %50 = icmp slt i32 %49, 0
  %51 = load i32, i32* %2
  %52 = icmp sgt i32 %51, 9
  %53 = zext i1 %50 to i32
  %54 = zext i1 %52 to i32
  %55 = or i32 %53, %54
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %59

57:                                               ; preds = %46
  br label %44

58:                                               ; No predecessors!
  br label %60

59:                                               ; preds = %46
  br label %60

60:                                               ; preds = %59, %58
  br label %44

61:                                               ; preds = %44
  %62 = load i32, i32* %2
  store i32 %62, i32* %1
  br label %63

63:                                               ; preds = %82, %61
  %64 = icmp ne i32 1, 0
  br i1 %64, label %65, label %83

65:                                               ; preds = %63
  %66 = call i32 @getch()
  %67 = sub i32 %66, 48
  store i32 %67, i32* %2
  %68 = load i32, i32* %2
  %69 = icmp sge i32 %68, 0
  %70 = load i32, i32* %2
  %71 = icmp sle i32 %70, 9
  %72 = zext i1 %69 to i32
  %73 = zext i1 %71 to i32
  %74 = and i32 %72, %73
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %81

76:                                               ; preds = %65
  %77 = load i32, i32* %1
  %78 = mul i32 %77, 10
  %79 = load i32, i32* %2
  %80 = add i32 %78, %79
  store i32 %80, i32* %1
  br label %82

81:                                               ; preds = %65
  br label %82

82:                                               ; preds = %81, %76
  br label %63

83:                                               ; preds = %63
  %84 = load i32, i32* %1
  call void @putint(i32 %84)
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
