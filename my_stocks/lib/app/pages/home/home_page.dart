import 'package:flutter/material.dart';
import 'package:my_stocks/app/constraints/app_colors.dart';
import 'package:my_stocks/app/pages/home/store/store_finance.dart';
import 'package:my_stocks/core/domain/repository/repository_finance.dart';
import 'package:my_stocks/http/http_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StoreFinance store = StoreFinance(
    repository: RepositoryFinance(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getFinance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().colorPalette050,
        foregroundColor: AppColors().colorPalette950,
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      backgroundColor: AppColors().colorPalette050,
      body: AnimatedBuilder(
        animation: Listenable.merge([
          store.loading,
          store.error,
          store.state,
        ]),
        builder: (context, child) {
          if (store.loading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (store.error.value.isNotEmpty) {
            return Center(
              child: Text(
                store.error.value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (store.state.value.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum dado encontrado.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: store.state.value.length,
              itemBuilder: (_, index) {
                final finance = store.state.value[index];

                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Text(finance.results.currencies.USD.name.toString()),
                      title:
                          Text(finance.results.currencies.USD.buy.toString()),
                      subtitle:
                          Text(finance.results.currencies.USD.sell.toString()),
                      trailing: Text(
                          finance.results.currencies.USD.variation.toString()),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
