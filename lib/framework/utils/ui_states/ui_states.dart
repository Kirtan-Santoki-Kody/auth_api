class UIState<T> {
  UIState({this.isLoading = false, this.success, this.isLoadMore = false});

  bool isLoading;
  T? success;
  bool isLoadMore;
}
