import 'package:flutter/material.dart';
import 'package:rent/demo/pages/home/domain/entity/cases_model.dart';
import 'package:rent/net/HttpManager.dart';
import 'package:rent/net/net/http.dart';
import 'package:rent/net/oauth_type.dart';
import 'package:rent/plugin/getx/get_connect/connect.dart';

///
/// @author: maker
/// @date: 2021/5/20 10:14
/// description:
/// 
class Centers extends StatefulWidget {
  const Centers({Key? key}) : super(key: key);

  @override
  _CentersState createState() => _CentersState();
}

class _CentersState extends State<Centers> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doNet();
  }

  doNet()async{
    // httpManager.httpManager.httpClient.defaultDecoder =
    //     (val) => CasesModel.fromJson(val as Map<String, dynamic>);
    // var eee = await httpManager.httpManager.get<Response<CasesModel>>("https://api.covid19api.com/summary",);
    // print("eeee${eee.statusCode}");
    var test = await Http.get("https://www.baidu.com");
    print("test${test.toString()}");
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("center",style: TextStyle(fontSize: 32.0,color: Colors.blue),),));
  }
}



