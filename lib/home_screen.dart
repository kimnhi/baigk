import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _tenSPController = TextEditingController();
  final TextEditingController _loaiController = TextEditingController();
  final TextEditingController _giaController = TextEditingController();

  final CollectionReference _sanpham = FirebaseFirestore.instance.collection("sanpham");

  void _addSanpham() {
    _sanpham.add({
      'TenSP': _tenSPController.text,
      'Gia': _giaController.text,
      'Loai': _loaiController.text,
    });
    _tenSPController.clear();
    _giaController.clear();
    _loaiController.clear();
  }

  void _delSanpham(String id) {
    _sanpham.doc(id).delete();
  }

void updateSanpham(String id) {
    _sanpham.doc(id).update({
      'TenSP': _tenSPController.text,
      'Gia': _giaController.text,
      'Loai': _loaiController.text,
    });
     _tenSPController.clear();
    _giaController.clear();
    _loaiController.clear();
}
  void _editSanpham(sanpham) {
    _tenSPController.text = sanpham['TenSP'];
    _giaController.text = sanpham['Gia'];
    _loaiController.text = sanpham['Loai'];

    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit San Pham"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _tenSPController,
                decoration: const InputDecoration(labelText: "TenSP"),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _giaController,
                decoration: const InputDecoration(labelText: "Gia"),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _loaiController,
                decoration: const InputDecoration(labelText: "Loai"),
              ),
              const SizedBox(height: 8),

            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
            },
            child: const Text("Cancel")),
            ElevatedButton(
              onPressed: (){
                updateSanpham(sanpham.id);
            }, child: const Text("Update"))
          ],
        );
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text(
             "Dữ Liệu Sản Phẩm",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _tenSPController,
              decoration: const InputDecoration(hintText: "Nhập tên sản phẩm", hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _loaiController,
              decoration: const InputDecoration(hintText: "Nhập loại sản phẩm", hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _giaController,
              decoration: const InputDecoration(hintText: "Nhập giá sản phẩm", hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 16,
            ),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
              onPressed: (){
                _addSanpham();

              }, child: const Text("Thêm Sản Phẩm"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(child: StreamBuilder(
              stream: _sanpham.snapshots(), 
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var sanpham = snapshot.data!.docs[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu-USWmqDNectQQjbg3TQS8VQgd-H0YcCK2g&s")),
                                ),
                                width: 100,
                                height: 100,
                                ),
                                ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 3,
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  'Tên sản phẩm: ${sanpham['TenSP']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Loại: ${sanpham['Loai']}',
                                  style: const TextStyle(fontWeight: FontWeight.bold,),
                                ),
                                Text(
                                  'giá sản phẩm: ${sanpham['Gia'].toString()}',
                                  style: const TextStyle(fontWeight: FontWeight.bold,),
                                ),
                              ],
                            )),
                            Expanded(
                              flex: 1,
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                onPressed: () {
                                   _delSanpham(sanpham.id);
                                },
                                icon: const Icon(Icons.delete), color: Colors.red,),
                              IconButton(
                                onPressed: () {
                                  _editSanpham(sanpham);
                                }, 
                                icon: const Icon(Icons.edit), color: Colors.yellow,),
                              ],
                              ),
                            )
                          ],
                        ),
                      ),    
                    );
                  },
                );
              }
            )),
          ],
        ),
      ),
    );
  }
}
