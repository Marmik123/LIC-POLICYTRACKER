import 'package:flutter/material.dart';
import 'package:lic_policies_clone/controller/retrieve_data.dart';
import 'package:lic_policies_clone/view/policy_details.dart';
import 'package:lic_policies_clone/view/sb__policy_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
class Policies extends StatefulWidget {
  const Policies({Key? key}) : super(key: key);

  @override
  State<Policies> createState() => _PoliciesState();
}
enum Option { policyNo, groupName, policyHolderName }
Option? selectedOption;
class _PoliciesState extends State<Policies> {
  bool isSearchPressed =false;
  bool isLoading =false;
  bool policyNoChecked =false;
  bool groupNameChecked =false;
  bool isSBPressed=false;
  bool policyHolderChecked =false;

  TextEditingController policyNo=TextEditingController();
  TextEditingController groupName=TextEditingController();
  TextEditingController policyHolderName=TextEditingController();
  List<Map<String, dynamic>> _data = [];
  List<Map<String, dynamic>> _searchedData = [];
  dynamic searchedData = [];

  @override
  void initState() {
    super.initState();
    initializeDb();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 130,
        actions: [
          TextButton(

            onPressed: (){
              setState(() {
                isSBPressed=true;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>SBView()),
                );
              });

            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),

            ),
            child: Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
               border: Border.all(color: Color(0xffFDE0D9),width: 2)
              ),

              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('SB',
                    style: TextStyle(
                         fontSize:10,
                        color: Color(0xffFDE0D9),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold
                    ),
                  ))),
          ),
          isSearchPressed?AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 10),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23)
            ),
            height: 15,
            width: MediaQuery.of(context).size.width/2,
            child:  TextFormField(
              controller: policyNoChecked?policyNo:groupNameChecked?groupName:policyHolderName,
              onFieldSubmitted:(_)=> search(
                  searchArg: policyNoChecked?policyNo.text:groupNameChecked?groupName.text:policyHolderName.text,ctx: context,isSBPolicy: isSBPressed),
              cursorColor: Colors.blueGrey,
              textInputAction:TextInputAction.search,

              keyboardType: selectedOption==Option.policyNo?TextInputType.number:TextInputType.text,
              style: const TextStyle(
                color: Colors.blueGrey,
              ),
              decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  suffixIconConstraints: const BoxConstraints(
                      maxHeight: 35,
                      maxWidth: 35
                  ),
                  suffixIcon: TextButton(
                    child:  Icon(Icons.clear,
                      color: Colors.blueGrey,
                      size: 20,
                    ) ,
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      alignment: Alignment.center,
                    ),
                    onPressed: (){
                      // search(searchItem.text);
                      setState(() {
                        isSearchPressed=false;
                        policyHolderName.clear();
                        policyNo.clear();
                        groupName.clear();
                        searchedData.clear();

                      });
                    },),

                  contentPadding: const EdgeInsets.only(top:6,left: 10),
                  hintText: selectedOption==Option.policyNo?
                  "Enter Policy No.":selectedOption==Option.groupName?"Enter Group Name":"Enter Policy Holder Name",
                  hintTextDirection: TextDirection.ltr,
                  // helperText: "Enter Policy No:",//Text("Enter Policy No:"),
                  hintStyle:const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ) ) ,
            ),
          ):const SizedBox.shrink(),
          TextButton(
            onPressed: () {
              setState(() {
                isSearchPressed=true;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      groupNameChecked: groupNameChecked,
                      policyHolderChecked: policyHolderChecked,
                      policyNoChecked:policyNoChecked ,
                      isSearched: isSearchPressed,
                    );
                  },
                );              });
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),

            ),
            child: const Icon(Icons.arrow_drop_down_circle_outlined,color: Color(0xffFDE0D9)),
          ),
          TextButton(
              onPressed: (){
            setState(() {
              isSearchPressed=!isSearchPressed;
            });

          },
              style: ButtonStyle(
                               padding: MaterialStateProperty.all(EdgeInsets.zero),

          ),
              child: const Icon(Icons.search,color: Color(0xffFDE0D9),))],
        backgroundColor: Colors.blueGrey,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('Policies',
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0,right: 10),
        child: FloatingActionButton(
          onPressed:
              (){
            print("FLOATING PRESED");
            getDataOnRefresh();
          },
          elevation: 20,
          child: const Icon(Icons.refresh,color: Color(0xffFDE0D9)),

        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:searchedData.length==0 && isSearchPressed==true?Center(child: Text("NO DATA EXIST",
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),)
              : GridView.builder(
              itemCount:isSearchPressed?searchedData.length: _data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context,index){
                var sr_no=index+1;
                final item = isSearchPressed?searchedData[index]: _data[index];
                return
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xffFDE0D9),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10,bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.blueGrey)
                            ),
                            height: 20,
                            width: 20,
                            child: Center(child: FittedBox(fit:BoxFit.scaleDown,child:  Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(sr_no.toString(),),
                            ),),),
                            alignment: Alignment.centerRight,
                          ),
                          ListTile(
                            trailing: RichText(text:
                            TextSpan(children: [
                              const TextSpan(text: "GroupID",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                              TextSpan(text: "\n${item['GroupID'].toString()}",style:const TextStyle(
                                color: Colors.black,
                              ) ),
                            ])),
                            // trailing: Text(item['GroupID'].toString()),
                            // title: TextButton(onPressed: (){}, child: Text('View Details')),
                            leading: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Policy No.',style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold
                                )),
                                SelectableText(item['PolicyNo'].toString()),

                              ],
                            ),
                            //isThreeLine: true,

                          ),
                          ListTile(
                            // title: TextButton(onPressed: (){}, child: Text('View Details')),
                            leading: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Name',style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold
                                )),
                                Text(item['MembName'].toString()),

                              ],
                            ),
                            //isThreeLine: true,

                          ),
                          Center(
                            child: ElevatedButton(

                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(10),
                                foregroundColor: MaterialStateProperty.all(const Color(0xffFDE0D9)),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),),
                              ),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=>PolicyDetails(policyItem: item,)),
                                );
                              },
                              child: const Text("View Details"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
              }),
        ),
      ),
    );
  }

  search({required String searchArg,required BuildContext ctx,bool? isSBPolicy}){
    setState(() {
      isLoading=true;
      if(searchArg.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:selectedOption== Option.groupName? Text('Please enter group name'):selectedOption== Option.policyNo?Text('Please enter Policy No'):Text('Please enter policy holder name'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      } else {
          DbConfiguration().searchPolicy(searchArg: searchArg,option: selectedOption??Option.policyHolderName).then((data) {
          setState(() {
            _searchedData=data;
            searchedData=List.from(_searchedData);
            isLoading=false;
          });
        });

      }

    });
  }

  hideSearchedData(){
    setState(() {
      isSearchPressed=false;
    });
  }

  Future<void> initializeDb () async{
    await DbConfiguration().initializeDatabase();
    getDataOnRefresh();
    FlutterNativeSplash.remove();
  }

  getDataOnRefresh() {
      DbConfiguration().getData().then((data) {
      setState(() {
        isSearchPressed = false;
        _data = data;
        print(_data);/**/
      });
    },
    );

  }

  getSBData(){
    DbConfiguration().getSBData().then((data) {
      setState(() {
        isSearchPressed=false;
        _data = data;
        print(_data);/**/
      });
    },
    );

  }


}


//DIALOG WIDGET CODE
class Dialog extends StatefulWidget {
  bool policyNoChecked;
   bool groupNameChecked;
   bool policyHolderChecked;
   bool isSearched;

  Dialog({required this.policyNoChecked,  required this.groupNameChecked, required this.policyHolderChecked,required this.isSearched});


  @override
  State<Dialog> createState() => _DialogState();
}

class _DialogState extends State<Dialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Search Criteria'),
      content: Container(
        height: MediaQuery.of(context).size.height/5,
        child: Column(
          children: [
            RadioListTile<Option>(
              title: const Text('Policy No'),
              value: Option.policyNo,
              groupValue: selectedOption,
              onChanged: (Option? value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            RadioListTile<Option>(
              title: const Text('Group Name'),
              value: Option.groupName,
              groupValue: selectedOption,
              onChanged: (Option? value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            RadioListTile<Option>(
              title: const Text('Policy Holder Name'),
              value: Option.policyHolderName,
              groupValue: selectedOption,
              onChanged: (Option? value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
          ],
        ),
      ),

      actions: <Widget>[
        TextButton(
          onPressed: () {
            setState(() {
              widget.isSearched=false;
            });
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            setState(() {

            Navigator.of(context).pop();
            });

          },
          child: const Text('OK'),
        )
      ],
    );
  }
}


