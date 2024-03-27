import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/71159005?v=4'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          ),
          IconButton(
            onPressed: () {}, 
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                  color: Colors.grey[300],
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 115.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildStoryItem(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(), 
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15.0,
                ), 
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
            children: [
              const Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/71159005?v=4'),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      bottom: 3.0,
                      end: 3.0,
                    ),
                    child: CircleAvatar(
                      radius: 7.0,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mazen Batrawi',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Hi, this is a test to see how the message fits',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Container(
                            width: 7.0,
                            height: 7.0,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const Text(
                          '02:13 pm',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ); 

  Widget buildStoryItem() => Container(
                    width: 60.0,
                    child: const Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/71159005?v=4'),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                bottom: 3.0,
                                end: 3.0,
                              ),
                              child: CircleAvatar(
                                radius: 7.0,
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Mazen Batrawi',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                    
}