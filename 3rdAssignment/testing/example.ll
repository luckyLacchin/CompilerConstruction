; ModuleID = 'example.bc'
source_filename = "example.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.FibState = type { i32, i32, i32, i32 }

; global variables
@state = dso_local global %struct.FibState zeroinitializer, align 4 ; Fibstate state
@n = dso_local global i32 0, align 4 ; int n

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_Z10resetStatev() #0 { ; void resetState {}
  store i32 0, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 0), align 4
  store i32 1, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 1), align 4
  store i32 0, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 2), align 4
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local noundef i32 @_Z3fibv() #0 { ; int fib{}
  %1 = alloca i32, align 4 ; allocate space
  %2 = load i32, i32* @n, align 4 ; load n into allocated space for comparison
  %3 = icmp eq i32 %2, 0 ; 
  br i1 %3, label %4, label %5 ; if then else branch

4:                                                ; preds = %0
  store i32 0, i32* %1, align 4
  br label %22

5:                                                ; preds = %0
  call void @_Z10resetStatev()
  store i32 0, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 0), align 4
  br label %6

6:                                                ; preds = %17, %5
  %7 = load i32, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 0), align 4
  %8 = load i32, i32* @n, align 4
  %9 = sub nsw i32 %8, 1
  %10 = icmp slt i32 %7, %9
  br i1 %10, label %11, label %20

11:                                               ; preds = %6
  %12 = load i32, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 1), align 4
  store i32 %12, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 3), align 4
  %13 = load i32, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 1), align 4
  %14 = load i32, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 2), align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 1), align 4
  %16 = load i32, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 3), align 4
  store i32 %16, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 2), align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 0), align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 0), align 4
  br label %6, !llvm.loop !6

20:                                               ; preds = %6
  %21 = load i32, i32* getelementptr inbounds (%struct.FibState, %struct.FibState* @state, i32 0, i32 1), align 4
  store i32 %21, i32* %1, align 4
  br label %22

22:                                               ; preds = %20, %4
  %23 = load i32, i32* %1, align 4
  ret i32 %23
}

; Function Attrs: mustprogress noinline norecurse nounwind optnone uwtable
define dso_local noundef i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 7, i32* @n, align 4
  %2 = call noundef i32 @_Z3fibv()
  ret i32 %2
}

attributes #0 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
