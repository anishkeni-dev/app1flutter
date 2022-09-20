import 'package:flutter/cupertino.dart';

import '../view/Widgets/home.dart';

Widget productview(ctx,snapshot){
  if (snapshot.data == null) {
return nodata();

} else {
return  buildproducts(ctx, snapshot);
}
}