; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@n = dso_local global i32 0
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define dso_local i32 @main() {
  %1 = add i32 0, 5
  store i32 %1, i32* @n
  %2 = alloca i32
  %3 = add i32 0, 3
  store i32 %3, i32* %2
  %4 = alloca [5 x i32]
  %5 = add i32 0, 3
  %6 = add i32 0, 4
  %7 = add i32 0, 5
  %8 = add i32 0, 6
  %9 = add i32 0, 7
  %10 = getelementptr [5 x i32], [5 x i32]* %4, i32 0, i32 0
  %11 = getelementptr i32, i32* %10, i32 0
  store i32 %5, i32* %11
  %12 = getelementptr i32, i32* %10, i32 1
  store i32 %6, i32* %12
  %13 = getelementptr i32, i32* %10, i32 2
  store i32 %7, i32* %13
  %14 = getelementptr i32, i32* %10, i32 3
  store i32 %8, i32* %14
  %15 = getelementptr i32, i32* %10, i32 4
  store i32 %9, i32* %15
  %16 = alloca i32
  %17 = alloca i32
  %18 = add i32 0, 0
  store i32 %18, i32* %17
  %19 = add i32 0, 0
  store i32 %19, i32* %16
  %20 = alloca i32
  br label %pym1

pym1:                                             ; preds = %pym4, %0
  %21 = load i32, i32* %17
  %22 = load i32, i32* @n
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %pym2, label %pym3

pym2:                                             ; preds = %pym1
  %24 = load i32, i32* %17
  %25 = load i32, i32* %2
  %26 = add i32 0, 1
  %27 = sub i32 %25, %26
  %28 = icmp slt i32 %24, %27
  br i1 %28, label %pym5, label %pym6

pym5:                                             ; preds = %pym2
  %29 = load i32, i32* %16
  %30 = load i32, i32* %17
  %31 = mul i32 %30, 1
  %32 = add i32 0, %31
  %33 = getelementptr [5 x i32], [5 x i32]* %4, i32 0, i32 %32
  %34 = load i32, i32* %33
  %35 = add i32 %29, %34
  store i32 %35, i32* %16
  br label %pym4

pym6:                                             ; preds = %pym2
  %36 = load i32, i32* %17
  %37 = load i32, i32* %2
  %38 = add i32 0, 1
  %39 = sub i32 %37, %38
  %40 = icmp eq i32 %36, %39
  br i1 %40, label %pym7, label %pym8

pym7:                                             ; preds = %pym6
  %41 = add i32 0, 0
  %42 = mul i32 %41, 1
  %43 = add i32 0, %42
  %44 = getelementptr [5 x i32], [5 x i32]* %4, i32 0, i32 %43
  %45 = load i32, i32* %44
  store i32 %45, i32* %20
  %46 = add i32 0, 0
  %47 = mul i32 %46, 1
  %48 = add i32 0, %47
  %49 = getelementptr [5 x i32], [5 x i32]* %4, i32 0, i32 %48
  %50 = load i32, i32* %16
  %51 = load i32, i32* %2
  %52 = sdiv i32 %50, %51
  store i32 %52, i32* %49
  br label %pym4

pym8:                                             ; preds = %pym6
  %53 = load i32, i32* %16
  %54 = load i32, i32* %17
  %55 = mul i32 %54, 1
  %56 = add i32 0, %55
  %57 = getelementptr [5 x i32], [5 x i32]* %4, i32 0, i32 %56
  %58 = load i32, i32* %57
  %59 = add i32 %53, %58
  %60 = load i32, i32* %20
  %61 = sub i32 %59, %60
  store i32 %61, i32* %16
  %62 = load i32, i32* %17
  %63 = load i32, i32* %2
  %64 = sub i32 %62, %63
  %65 = add i32 0, 1
  %66 = add i32 %64, %65
  %67 = mul i32 %66, 1
  %68 = add i32 0, %67
  %69 = getelementptr [5 x i32], [5 x i32]* %4, i32 0, i32 %68
  %70 = load i32, i32* %69
  store i32 %70, i32* %20
  %71 = load i32, i32* %17
  %72 = load i32, i32* %2
  %73 = sub i32 %71, %72
  %74 = add i32 0, 1
  %75 = add i32 %73, %74
  %76 = mul i32 %75, 1
  %77 = add i32 0, %76
  %78 = getelementptr [5 x i32], [5 x i32]* %4, i32 0, i32 %77
  %79 = load i32, i32* %16
  %80 = load i32, i32* %2
  %81 = sdiv i32 %79, %80
  store i32 %81, i32* %78
  br label %pym4

pym4:                                             ; preds = %pym8, %pym7, %pym5
  %82 = load i32, i32* %17
  %83 = add i32 0, 1
  %84 = add i32 %82, %83
  store i32 %84, i32* %17
  br label %pym1

pym3:                                             ; preds = %pym1
  %85 = load i32, i32* @n
  %86 = load i32, i32* %2
  %87 = sub i32 %85, %86
  %88 = add i32 0, 1
  %89 = add i32 %87, %88
  store i32 %89, i32* %17
  br label %pym9

pym9:                                             ; preds = %pym10, %pym3
  %90 = load i32, i32* %17
  %91 = load i32, i32* @n
  %92 = icmp slt i32 %90, %91
  br i1 %92, label %pym10, label %pym11

pym10:                                            ; preds = %pym9
  %93 = load i32, i32* %17
  %94 = mul i32 %93, 1
  %95 = add i32 0, %94
  %96 = getelementptr [5 x i32], [5 x i32]* %4, i32 0, i32 %95
  %97 = add i32 0, 0
  store i32 %97, i32* %96
  %98 = load i32, i32* %17
  %99 = add i32 0, 1
  %100 = add i32 %98, %99
  store i32 %100, i32* %17
  br label %pym9

pym11:                                            ; preds = %pym9
  %101 = add i32 0, 0
  store i32 %101, i32* %17
  %102 = alloca i32
  %103 = add i32 0, 0
  store i32 %103, i32* %102
  br label %pym12

pym12:                                            ; preds = %pym13, %pym11
  %104 = load i32, i32* %17
  %105 = add i32 0, 5
  %106 = icmp slt i32 %104, %105
  br i1 %106, label %pym13, label %pym14

pym13:                                            ; preds = %pym12
  %107 = load i32, i32* %17
  %108 = mul i32 %107, 1
  %109 = add i32 0, %108
  %110 = getelementptr [5 x i32], [5 x i32]* %4, i32 0, i32 %109
  %111 = load i32, i32* %110
  call void @putint(i32 %111)
  %112 = load i32, i32* %17
  %113 = add i32 0, 1
  %114 = add i32 %112, %113
  store i32 %114, i32* %17
  br label %pym12

pym14:                                            ; preds = %pym12
  %115 = add i32 0, 0
  ret i32 %115
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
