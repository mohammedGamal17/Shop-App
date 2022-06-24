class ChangeFavouriteModel
{
  bool? status;
  String? message ;

  ChangeFavouriteModel.fromJson(Map<String , dynamic> json)
  {
    status = json['status'];
    message = json['message'];
  }
}