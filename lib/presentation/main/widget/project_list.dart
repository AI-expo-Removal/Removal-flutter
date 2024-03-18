import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({Key? key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {

  void _BottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 214,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
          decoration: BoxDecoration(
            color: RemovalColor.gray90,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '20240315-01',
                style: RemovalTextStyle.body1(color: RemovalColor.gray300),
              ),
              Text(
                '2024.03.15 오후 3:08',
                style: RemovalTextStyle.caption2(color: RemovalColor.gray300),
              ),
              Divider(
                color: RemovalColor.gray70,
                thickness: 1,
              ),
              Row(
                children: [
                  Image.asset('assets/images/icon/main/title_edit.svg'),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: (){
                    },
                    child: Text(
                      '제목 수정',
                      style: RemovalTextStyle.body1(color: RemovalColor.white),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset('assets/images/icon/main/delete.svg'),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: (){

                    },
                    child: Text(
                      '삭제',
                      style: RemovalTextStyle.body1(color: RemovalColor.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/icon/main/project.png'),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '20240315-01',
                    style: RemovalTextStyle.subTitle3(color: RemovalColor.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '2024.3.10 오후 3:08',
                    style: RemovalTextStyle.body3(color: RemovalColor.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '00 : 20',
                    style: RemovalTextStyle.body3(color: RemovalColor.white),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: (){
                _BottomSheet(context);
              },
                icon: const Icon(Icons.more_vert), iconSize: 24, color: RemovalColor.white,)
            ],
          ),
        ),
      ],
    );
  }
}
