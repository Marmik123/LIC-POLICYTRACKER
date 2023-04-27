import 'package:flutter/material.dart';


class SBPolicyDetails extends StatefulWidget {
  final dynamic policyItem;

  const SBPolicyDetails({super.key, required this.policyItem});

  @override
  State<SBPolicyDetails> createState() => _SBPolicyDetailsState();
}

class _SBPolicyDetailsState extends State<SBPolicyDetails> {
  @override
  Widget build(BuildContext context) {
    // Convert the QueryRow objects into an iterable type

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff41436A),
        title: const Center(
          child: Text('SB Policy Details',
            style: TextStyle(
                fontSize: 25,
                color: Color(0xffFDE0D9),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold
            ),
            // textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      field(ctx: context,value: 'Policy No.', fieldStyle: fieldTextStyle()),
                      field(ctx: context,value: 'Member ID', fieldStyle: fieldTextStyle()),
                      field(ctx: context,value: 'Member Name', fieldStyle: fieldTextStyle()),
                      field(ctx: context,value: 'DOB', fieldStyle: fieldTextStyle()),
                      field(ctx: context,value: 'Group ID', fieldStyle: fieldTextStyle()),
                      field(ctx: context,value: 'Group Name', fieldStyle: fieldTextStyle()),
                      field(ctx: context,value: 'Address', fieldStyle: fieldTextStyle()),
                      field(
                        ctx: context,
                        value: 'Commencement Date',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value: 'Due Date',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value: 'Type',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ), field(
                        ctx: context,
                        value: 'Plan',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ), field(
                        ctx: context,
                        value: 'Term',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ), field(
                        ctx: context,
                        value: 'PPT',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ), field(
                        ctx: context,
                        value: 'Sum',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value: 'FUP Date',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value: 'Amt Receivable',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value: 'Group Mobile',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value: 'Memb Mobile',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value: 'Status',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value: 'Branch No',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value: 'Agency',
                        fieldStyle: fieldTextStyle(),
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 5,
                  // margin: const EdgeInsets.only(left: 3,right: 3),
                  // height: MediaQuery.of(context).size.height,
                  color:const Color(0xffFDE0D9) ,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      field(
                        ctx:context,
                        value:widget.policyItem['PolicyNo'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),
                      field(
                        ctx: context,
                        value: widget.policyItem['MembID'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),
                      field(
                        ctx: context,
                        value: widget.policyItem['MembName'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value:widget.policyItem['DOBActual']==''? widget.policyItem['DOBRec'].toString():widget.policyItem['DOBActual'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),

                      field(
                        ctx: context,
                        value: widget.policyItem['GroupID'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),
                      field(
                        ctx: context,
                        value: widget.policyItem['GroupName'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),
                      field(
                        ctx: context,
                        value: widget.policyItem['AddressResi'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),
                      field(
                        ctx: context,
                        value:widget.policyItem['ComDate'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),
                      field(
                        ctx: context,
                        value:widget.policyItem['DueDate'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value:widget.policyItem['Type'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),
                      field(
                        ctx: context,
                        value:widget.policyItem['Plan'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ), field(
                        ctx: context,
                        value:widget.policyItem['Term'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ), field(
                        ctx: context,
                        value:widget.policyItem['PPT'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ), field(
                        ctx: context,
                        value:widget.policyItem['Sum'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value:widget.policyItem['FUPDate'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value:widget.policyItem['AmtReceivable'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value:widget.policyItem['GroupMobile'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value:widget.policyItem['MembMobile'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value:widget.policyItem['Status'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value:widget.policyItem['BranchNo'].toString(),
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),field(
                        ctx: context,
                        value:widget.policyItem['Agency'].toString()=='1'?
                        'Shailesh Shah':widget.policyItem['Agency'].toString()=='2'?'Chintan Shah':
                        widget.policyItem['Agency'].toString()=='3'?'Mansi Shah'
                            :'Other Agency',
                        fieldStyle: valueTextStyle(),
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


fieldTextStyle (){
  return const TextStyle(
      fontSize: 20,
      color: Colors.blueGrey,//Color(0xffF984063),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.bold
  );
}
valueTextStyle (){
  return  const TextStyle(
      fontSize: 20,
      color: Color(0xffF41436A),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis
  );
}

field({required BuildContext ctx,required String value,required TextStyle fieldStyle}){
  return Container(
    color: const Color(0xffFDE0D9),
    padding: const EdgeInsets.only(top:10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
            alignment: Alignment.centerLeft,

            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 5),
              child: SelectableText(value,
                maxLines: 1,
                style: fieldStyle,
                textAlign: TextAlign.left,),
            )),
        Container(height:2 ,width: MediaQuery.of(ctx).size.width/2,color: Colors.blueGrey,),
      ],
    ),
  );
}


