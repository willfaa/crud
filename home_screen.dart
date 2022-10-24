import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simple_crud/integration.dart';
import 'package:simple_crud/taskscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController dialController = TextEditingController();
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  List<Member> memberList = [];
  bool updateMember = false;
  @override
  void initState() {
    super.initState();
    takeMemberData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: RichText(
            text: TextSpan(
                text: "PAGARNUSA SEDATI",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.green.shade900))),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.green.shade900,
            child: ListView(
              children: const [
                SizedBox(
                  height: 150,
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TaskScreen()));
        }),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.green.shade900,
        child: const Icon(Icons.add),
      ),
    );
  }

// mengambil dari database
  void takeMemberData() {
    dbRef.child('member').onChildAdded.listen((data) {
      MemberData memberData = MemberData.fromJson(data.snapshot.value as Map);
      Member member = Member(key: data.snapshot.key, memberData: memberData);
      memberList.add(member);
      setState(() {});
    });
  }

  Widget memberWidget(Member memberList) {
    return InkWell(
      onTap: () {
        nameController.text = memberList.memberData!.name!;
        ageController.text = memberList.memberData!.age!;
        dialController.text = memberList.memberData!.dial!;
        updateMember = true;
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(memberList.memberData!.name!),
                Text(memberList.memberData!.age!),
                Text(memberList.memberData!.dial!),
              ],
            ),
            const Icon(
              Icons.delete,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
