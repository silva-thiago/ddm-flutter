import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:to_you_do/app/data/model_todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<TodoStarted>(_onStarted);
    on<AddTodo>(_onAddTodo);
    on<RemoveTodo>(_onRemoveTodo);
    on<AlterTodo>(_onAlterTodo);
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toJson();
  }

  FutureOr<void> _onStarted(TodoStarted event, Emitter<TodoState> emit) {
    if (state.status == TodoStatus.success) {
      return ('' as Map<String, dynamic>)["Esse todo já existe!"];
    }

    emit(
      state.copyWith(
        todos: state.todos,
        status: TodoStatus.success,
      ),
    );
  }

  FutureOr<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    emit(
      state.copyWith(
        todos: state.todos,
        status: TodoStatus.success,
      ),
    );

    try {
      List<Todo> temporary = [];
      temporary.addAll(state.todos);
      temporary.insert(0, event.todo);

      emit(
        state.copyWith(
          todos: temporary,
          status: TodoStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
        ),
      );
    }
  }

  FutureOr<void> _onRemoveTodo(RemoveTodo event, Emitter<TodoState> emit) {
    emit(
      state.copyWith(
        status: TodoStatus.loading,
      ),
    );

    try {
      state.todos.remove(event.todo);

      emit(
        state.copyWith(
          todos: state.todos,
          status: TodoStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
        ),
      );
    }
  }

  FutureOr<void> _onAlterTodo(AlterTodo event, Emitter<TodoState> emit) {
    emit(
      state.copyWith(
        status: TodoStatus.loading,
      ),
    );

    try {
      state.todos[event.index].done = !state.todos[event.index].done;

      emit(
        state.copyWith(
          todos: state.todos,
          status: TodoStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
        ),
      );
    }
  }
}
