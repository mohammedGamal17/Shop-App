import '../search/dataX.dart';

class Data {
    List<DataX> ?data;
   late int currentPage;
   late String firstPageUrl;
   late int from;
   late int lastPage;
   late String lastPageUrl;
   late String path;
   late int perPage;
   late int to;
    dynamic total;

    Data({this.data, required this.currentPage, required this.firstPageUrl, required this.from, required this.lastPage, required this.lastPageUrl, required this.path, required this.perPage, required this.to, this.total});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            data: json['data'] != null ? (json['data'] as List).map((i) => DataX.fromJson(i)).toList() : null,
            currentPage: json['current_page'],
            firstPageUrl: json['first_page_url'],
            from: json['from'],
            lastPage: json['last_page'],
            lastPageUrl: json['last_page_url'],
            path: json['path'],
            perPage: json['per_page'],
            to: json['to'], 
            total: json['total'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> dataX = <String, dynamic>{};
        dataX['current_page'] = currentPage;
        dataX['first_page_url'] = firstPageUrl;
        dataX['from'] = from;
        dataX['last_page'] = lastPage;
        dataX['last_page_url'] = lastPageUrl;
        dataX['path'] = path;
        dataX['per_page'] = perPage;
        dataX['to'] = to;
        dataX['total'] = total;
        final data = this.data;
        if (data != null) {
            dataX['data'] = data.map((v) => v.toJson()).toList();
        }
        return dataX;
    }
}