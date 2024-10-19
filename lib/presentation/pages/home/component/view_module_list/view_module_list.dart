import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/extensions.dart';
import '../../bloc/view_modules_bloc/view_module_bloc.dart';
import '../footer/footer.dart';

class ViewModuleList extends StatefulWidget {
  final int tabId;

  const ViewModuleList({super.key, required this.tabId});

  @override
  State<ViewModuleList> createState() => _ViewModuleListState();
}

class _ViewModuleListState extends State<ViewModuleList> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
  }

  void _onScroll() {
    if (_isEnd) {
      context.read<ViewModuleBloc>().add(ViewModuleFetched());
    }
  }

  bool get _isEnd {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final curScroll = scrollController.offset;
    return curScroll >= maxScroll * 0.9;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async =>
          context.read<ViewModuleBloc>().add(ViewModuleInitialized(
                tabId: widget.tabId,
                isRefresh: true,
              )),
      child: BlocBuilder<ViewModuleBloc, ViewModuleState>(
        builder: (_, state) {
          return (state.status.isInitial || state.viewModules.isEmpty)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(controller: scrollController, children: [
                  ...state.viewModules,
                  if (state.status.isLoading) const LoadingWidget(),
                  Footer(),
                ]);
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
