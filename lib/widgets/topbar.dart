import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDesktop;

  const CustomAppBar({Key? key, required this.isDesktop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar( elevation: 9,
      automaticallyImplyLeading: !isDesktop, // Remove o ícone de menu no desktop
      backgroundColor:  Colors.transparent,
      title: isDesktop
          ? Row(
        children: [
          SizedBox(
            width: 250, // Largura fixa para o menu lateral no desktop
            child:  Text(
              "Dashboard",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Search something...",
                  icon: Icon(CupertinoIcons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              "https://th.bing.com/th/id/R.eac537535b49a9435c85bfbcb27d5df4?rik=UhU2SBuQZBGxZg&riu=http%3a%2f%2fsguru.org%2fwp-content%2fuploads%2f2017%2f04%2fgirl-profile-picture-for-facebook-1-1.jpg&ehk=ljp7c7VeiobwFr9Aa6sva46wvsKsjYGH6pCOwfF019w%3d&risl=&pid=ImgRaw&r=0",
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "Emily Smith",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      )
          : Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 26,
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Search something...",
                      icon: Icon(CupertinoIcons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/R.eac537535b49a9435c85bfbcb27d5df4?rik=UhU2SBuQZBGxZg&riu=http%3a%2f%2fsguru.org%2fwp-content%2fuploads%2f2017%2f04%2fgirl-profile-picture-for-facebook-1-1.jpg&ehk=ljp7c7VeiobwFr9Aa6sva46wvsKsjYGH6pCOwfF019w%3d&risl=&pid=ImgRaw&r=0",
                    ),
                  ),
                   Text(
                    "Emily Smith",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56); // Altura padrão da AppBar
}
