import 'package:flutter/material.dart';
import 'package:investment_keeper/src/features/make_money_bank/data/remote_data_source/bank.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: BanksDataScreen(),
      ),
    );
  }
}

class BanksDataScreen extends StatefulWidget {
  const BanksDataScreen({super.key});

  @override
  _BanksDataScreenState createState() => _BanksDataScreenState();
}

class _BanksDataScreenState extends State<BanksDataScreen> {
  final BanksRemoteDioDataSource _dataSource = BanksRemoteDioDataSource();
  late Future<List<Map<String, dynamic>>?> _banksFuture;

  @override
  void initState() {
    super.initState();
    _banksFuture = _dataSource.getBanks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>?>(
        future: _banksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final banks = snapshot.data!;

            return ListView.builder(
              itemCount: banks.length,
              itemBuilder: (context, index) {
                final bank = banks[index];
                return ListTile(
                  title: Text('${bank['name']}'),
                  subtitle: Text(
                      'End Promotion: ${bank['end_promotion']}, No Account Since: ${bank['no_account_since']}'),
                );
              },
            );
          } else {
            return const Text('No data');
          }
        });
  }
}
