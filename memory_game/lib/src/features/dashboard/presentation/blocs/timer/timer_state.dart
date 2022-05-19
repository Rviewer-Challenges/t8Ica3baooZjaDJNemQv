part of 'timer_bloc.dart';

 abstract class TimerState extends Equatable {
 final int duration;
 
 /// current value of timer to show to the UI
 
 const TimerState(this.duration);
 @override
 
 List<Object> get props => [duration];
 }
 
 class TimerInitial extends TimerState {
 const TimerInitial(duration) : super(duration);
 }
 
 class TimerRunInProgress extends TimerState {
 const TimerRunInProgress(int duration) : super(duration);
 }
 
 class TimerRunComplete extends TimerState {
 const TimerRunComplete() : super(0);
 }
