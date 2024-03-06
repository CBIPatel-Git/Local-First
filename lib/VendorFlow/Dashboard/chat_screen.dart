import '../../Utility/utility_export.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: commonStructure(
          context: context,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              commonAppBar(
                  preFix: appBarButton(
                      image: iconsBackIcon,
                      callBack: () {
                        Get.back();
                      }),
                  sufFix: Row(
                    children: [
                      InkWell(
                        splashColor: white,
                        highlightColor: white,
                        onTap: () {},
                        child: Image(
                          image: iconsChatCall,
                          height: 24,
                          width: 24,
                          fit: BoxFit.cover,
                        ).marginAll(5),
                      ),
                      width05,
                      InkWell(
                        splashColor: white,
                        highlightColor: white,
                        onTap: () {},
                        child: Image(
                          image: iconsVideo,
                          height: 24,
                          width: 24,
                          fit: BoxFit.cover,
                        ).marginAll(5),
                      ),
                    ],
                  ),
                  title: Expanded(
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image(
                                  image: imagesUserProfile,
                                  height: 45,
                                  fit: BoxFit.cover,
                                  width: 45,
                                )),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    color: onlineGreen,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: white, width: 2)),
                              ),
                            )
                          ],
                        ).marginOnly(right: 10, left: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Esther Howard',
                              style: AppFontStyle.blackOpenSans16W600,
                            ),
                            Text(
                              'Esther Howard',
                              style: AppFontStyle.greyOpenSans12W500,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(
                child: Container(
                  color: orangeFFE5C1,
                ),
              ),
              Container(
                height: 90,
                width: getScreenWidth(context),
                decoration: const BoxDecoration(
                    color: white, border: Border(top: BorderSide(color: skyBlue, width: 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text Field and Send Button
                    Container(
                      width: 240,
                      decoration: BoxDecoration(
                          color: colorE3E3E3.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 40,
                            child: TextFormField(
                              maxLines: 1,
                              controller: messageController,
                              cursorColor: textGrey,
                              onChanged: (val) {
                                // On Change
                              },
                              onFieldSubmitted: (val) {
                                // On Submit
                              },
                              decoration: InputDecoration(
                                  hintText: 'Write your message',
                                  contentPadding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
                                  hintStyle: AppFontStyle.greyOpenSans16W500,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.transparent, width: 1),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.transparent, width: 1),
                                    borderRadius: BorderRadius.circular(100),
                                  )),
                            ),
                          ),
                          InkWell(
                            highlightColor: colorPrimary,
                            splashColor: colorPrimary,
                            onTap: () {},
                            child: Container(
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                  color: colorPrimary, borderRadius: BorderRadius.circular(100)),
                              child: Image(
                                image: iconsSend,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    width12,
                    InkWell(
                      highlightColor: white,
                      splashColor: white,
                      onTap: () {},
                      child: Image(
                        image: iconsAttachment,
                      ),
                    ),
                    width12,
                    InkWell(
                      highlightColor: white,
                      splashColor: white,
                      onTap: () {},
                      child: Image(
                        image: iconsChatCamera,
                      ),
                    ),
                    width12,
                    InkWell(
                      highlightColor: white,
                      splashColor: white,
                      onTap: () {},
                      child: Image(
                        image: iconsMicrophone,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
