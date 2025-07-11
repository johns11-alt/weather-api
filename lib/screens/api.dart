import '../imports.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('API Data')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              apiProvider.getData(context);
            },
            child: const Text('Fetch Data'),
          ),
          Expanded(
            child: apiProvider.apiList.isEmpty
                ? Center(child: Text(apiProvider.errorMessage ?? 'No data'))
                : ListView.builder(
                    itemCount: apiProvider.apiList.length,
                    itemBuilder: (context, index) {
                      final item = apiProvider.apiList[index];
                      return Card(
                        // margin: const EdgeInsets.all(8),
                        // child: ListTile(
                        //   title: Text(item['name'] ?? 'No name'),
                        //   subtitle: Text(item['email'] ?? 'No email'),
                        //   isThreeLine: true,
                        //   trailing: Text(item['id'].toString()),
                        // ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
