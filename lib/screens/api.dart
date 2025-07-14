import '../imports.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  bool _isLoading = false;

  Future<void> _fetchData(ApiProvider apiProvider) async {
    setState(() {
      _isLoading = true;
    });
    await apiProvider.getData(context);
    setState(() {
      _isLoading = false;
    });

    // Print emails and JSON representation for all items
    for (var item in apiProvider.apiList) {
      print('Email: ${item.email}');
      print('As JSON: ${item.toJson()}');
    }
  }

  void _onItemTap(Api item) {
    // Convert to JSON and print
    final jsonMap = item.toJson();
    print('Selected item as JSON: $jsonMap');

    // You can also do other things here, e.g., send JSON to API, save locally, etc.
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('API Data')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _fetchData(apiProvider),
              child: const Text('Fetch Data'),
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : apiProvider.apiList.isEmpty
                    ? Center(child: Text(apiProvider.errorMessage ?? 'No data'))
                    : ListView.builder(
                        itemCount: apiProvider.apiList.length,
                        itemBuilder: (context, index) {
                          final item = apiProvider.apiList[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: ListTile(
                              title: Text(item.email),
                              onTap: () => _onItemTap(item),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
