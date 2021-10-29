; ModuleID = './lab03/main.c'
source_filename = "./lab03/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 5, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %3, align 4
  %6 = load i32, i32* %3, align 4
  %7 = load i32, i32* %2, align 4
  %8 = sub nsw i32 %6, %7
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %8)
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = load i32, i32* %2
ret i32 %2
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = load i32, i32* %2
ret i32 %2
}
define dso_local i32
@main
()
{
%1 = alloca i32
%-99997 = sub i32 %-99999, %-99998
store i32 %1, i32* %1
%2 = load i32, i32* %2
ret i32 %2
}
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = sub i32 %-99999, %-99998
store i32 %2, i32* %1
%3 = load i32, i32* %3
ret i32 %3
}
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = sub i32 123, 122
store i32 %2, i32* %1
%3 = load i32, i32* %3
ret i32 %3
}
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = sub i32 123, 122
store i32 %2, i32* %1
%3 = load i32, i32* %1
ret i32 %1
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
store i32 %2, i32* %2
%3 = alloca i32
%4 = load i32, i32* %2
%5 = load i32, i32* %1
%6 = sub i32 %2, %1
%7 = sdiv i32 %6, 1000
%8 = sub i32 %7, 8
store i32 %8, i32* %3
%9 = alloca i32
store i32 %9, i32* %9
%10 = load i32, i32* %3
%11 = load i32, i32* %9
%12 = add i32 %3, %9
store i32 %12, i32* %3
%13 = load i32, i32* %3
%14 = load i32, i32* %9
%15 = sub i32 %3, %9
%16 = add i32 %15, 0
ret i32 %16
}
define dso_local i32
@main
()
{
%1 = alloca i32
store i32 %1, i32* %1
%2 = alloca i32
store i32 %2, i32* %2
%3 = mul i32 5, 5
%4 = sub i32 25, 20
%5 = load i32, i32* %2
%6 = sdiv i32 %2, 5
%7 = mul i32 %6, 0
%8 = sub i32 5, %7
store i32 %8, i32* %1
ret i32 0
}
declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = call i32 @getint()
store i32 %2, i32* %1
ret i32 0
}
declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = call i32 @getint()
store i32 %2, i32* %1
ret i32 0
}
declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = add i32 1, 4
ret i32 0
}
declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
ret i32 0
}
declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = add i32 1, 4
ret i32 0
}
declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = add i32 1, 4
ret i32 0
}
declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = call i32 @getint()
store i32 %2, i32* %1
%3 = add i32 1, 4
ret i32 0
}
declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = call i32 @getint()
store i32 %2, i32* %1
%3 = load i32, i32* %1
%4 = add i32 %1, 4
ret i32 0
}
declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define dso_local i32
@main
()
{
%1 = alloca i32
%2 = call i32 @getint()
store i32 %2, i32* %1
%3 = load i32, i32* %1
%4 = add i32 %1, 4
ret i32 0
}
