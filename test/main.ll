; ModuleID = './test/main.c'
source_filename = "./test/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global [4 x [2 x i32]] zeroinitializer, align 16
@b = dso_local global [8 x i32] [i32 9, i32 2, i32 3, i32 4, i32 1, i32 5, i32 4, i32 0], align 16
@c = dso_local global [4 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4], [2 x i32] [i32 6, i32 3], [2 x i32] [i32 7, i32 8]], align 16
@e = dso_local global [4 x [2 x i32]] [[2 x i32] [i32 6, i32 7], [2 x i32] [i32 4, i32 5], [2 x i32] [i32 5, i32 6], [2 x i32] [i32 9, i32 10]], align 16
@__const.main.b = private unnamed_addr constant [8 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8], align 16
@__const.main.c = private unnamed_addr constant [4 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4], [2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [4 x [2 x i32]], align 16
  %3 = alloca [8 x i32], align 16
  %4 = alloca [4 x [2 x i32]], align 16
  %5 = alloca [4 x [2 x i32]], align 16
  store i32 0, i32* %1, align 4
  %6 = bitcast [4 x [2 x i32]]* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 32, i1 false)
  %7 = bitcast [8 x i32]* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([8 x i32]* @__const.main.b to i8*), i64 32, i1 false)
  %8 = bitcast [4 x [2 x i32]]* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([4 x [2 x i32]]* @__const.main.c to i8*), i64 32, i1 false)
  %9 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %5, i64 0, i64 0
  %10 = getelementptr inbounds [2 x i32], [2 x i32]* %9, i64 0, i64 0
  %11 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 6
  %12 = load i32, i32* %11, align 8
  store i32 %12, i32* %10, align 4
  %13 = getelementptr inbounds i32, i32* %10, i64 1
  %14 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 7
  %15 = load i32, i32* %14, align 4
  store i32 %15, i32* %13, align 4
  %16 = getelementptr inbounds [2 x i32], [2 x i32]* %9, i64 1
  %17 = getelementptr inbounds [2 x i32], [2 x i32]* %16, i64 0, i64 0
  store i32 3, i32* %17, align 4
  %18 = getelementptr inbounds i32, i32* %17, i64 1
  store i32 4, i32* %18, align 4
  %19 = getelementptr inbounds [2 x i32], [2 x i32]* %16, i64 1
  %20 = getelementptr inbounds [2 x i32], [2 x i32]* %19, i64 0, i64 0
  store i32 5, i32* %20, align 4
  %21 = getelementptr inbounds i32, i32* %20, i64 1
  store i32 6, i32* %21, align 4
  %22 = getelementptr inbounds [2 x i32], [2 x i32]* %19, i64 1
  %23 = getelementptr inbounds [2 x i32], [2 x i32]* %22, i64 0, i64 0
  store i32 7, i32* %23, align 4
  %24 = getelementptr inbounds i32, i32* %23, i64 1
  store i32 8, i32* %24, align 4
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
