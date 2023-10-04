import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:likeminds_feed/likeminds_feed.dart';

import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:lm_feed_ui_example/utils/constants/ui_constants.dart';
import 'package:lm_feed_ui_example/utils/local_preference/user_local_preference.dart';
import 'package:lm_feed_ui_example/views/new_post/new_post/new_post_bloc.dart';

// /* key is mediatype, contains all asset button data
// related to a particular media type */
// const Map<int, dynamic> assetButtonData = {
//   1: {
//     'title': 'Add Photo',
//     'svg_icon': 'packages/feed_sx/assets/icons/add_photo.svg',
//   },
//   2: {
//     'title': 'Add Video',
//     'svg_icon': 'packages/feed_sx/assets/icons/add_video.svg',
//   },
//   3: {
//     'title': 'Attach Files',
//     'svg_icon': 'packages/feed_sx/assets/icons/add_attachment.svg',
//   },
// };

class NewPostScreen extends StatefulWidget {
  final String? populatePostText;
  final List<MediaModel>? populatePostMedia;

  const NewPostScreen({
    super.key,
    this.populatePostText,
    this.populatePostMedia,
  });

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final TextEditingController _controller = TextEditingController();
  NewPostBloc? newPostBloc;
  // final ImagePicker _picker = ImagePicker();
  // final FilePicker _filePicker = FilePicker.platform;
  // Size? screenSize;
  // bool isUploading = false;
  late final User user;
  // List<MediaModel> postMedia = [];
  // List<FeedRoom> feedRoomIds = []; // list of feedroom for post
  // ValueNotifier<bool> rebuildFeedRoomSelectTab = ValueNotifier(false);

  List<UserTag> userTags = [];
  String? result;
  bool isDocumentPost = false; // flag for document or media post
  bool isMediaPost = false;
  String previewLink = '';
  MediaModel? linkModel;
  bool showLinkPreview =
      true; // if set to false link preview should not be displayed
  Timer? _debounce;

  @override
  void dispose() {
    _controller.dispose();
    // rebuildFeedRoomSelectTab.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    user = UserLocalPreference.instance.fetchUserData();
    // if (widget.populatePostMedia != null &&
    //     widget.populatePostMedia!.isNotEmpty) {
    //   postMedia.addAll(widget.populatePostMedia!.map((e) => e));
    //   if (postMedia[0].mediaType == MediaType.document) {
    //     isDocumentPost = true;
    //     isMediaPost = false;
    //   } else {
    //     isDocumentPost = false;
    //     isMediaPost = true;
    //   }
    // }
    // if (widget.populatePostText != null &&
    //     widget.populatePostText!.isNotEmpty) {
    //   _controller?.value = TextEditingValue(text: widget.populatePostText!);
    // }
  }

  // void removeAttachmenetAtIndex(int index) {
  //   if (postMedia.isNotEmpty) {
  //     postMedia.removeAt(index);
  //     if (postMedia.isEmpty) {
  //       isDocumentPost = false;
  //       isMediaPost = false;
  //       showLinkPreview = true;
  //     }
  //     setState(() {});
  //   }
  // }

  // // this function initiliases postMedia list
  // // with photos/videos picked by the user
  // void setPickedMediaFiles(List<MediaModel> pickedMediaFiles) {
  //   if (postMedia.isEmpty) {
  //     postMedia = <MediaModel>[...pickedMediaFiles];
  //   } else {
  //     postMedia.addAll(pickedMediaFiles);
  //   }
  // }

  // /* Changes state to uploading
  // for showing a circular loader while the user is
  // picking files */
  // void onUploading() {
  //   setState(() {
  //     isUploading = true;
  //   });
  // }

  // /* Changes state to uploaded
  // for showing the picked files */
  // void onUploadedMedia(bool uploadResponse) {
  //   if (uploadResponse) {
  //     isMediaPost = true;
  //     showLinkPreview = false;
  //     setState(() {
  //       isUploading = false;
  //     });
  //   } else {
  //     if (postMedia.isEmpty) {
  //       isMediaPost = false;
  //       showLinkPreview = true;
  //     }
  //     setState(() {
  //       isUploading = false;
  //     });
  //   }
  // }

  // void onUploadedDocument(bool uploadResponse) {
  //   if (uploadResponse) {
  //     isDocumentPost = true;
  //     showLinkPreview = false;
  //     setState(() {
  //       isUploading = false;
  //     });
  //   } else {
  //     if (postMedia.isEmpty) {
  //       isDocumentPost = false;
  //       showLinkPreview = true;
  //     }
  //     setState(() {
  //       isUploading = false;
  //     });
  //   }
  // }

  // Widget getPostDocument(double width) {
  //   return ListView.builder(
  //     itemCount: postMedia.length,
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     itemBuilder: (context, index) => PostDocument(
  //       size: getFileSizeString(bytes: postMedia[index].size!),
  //       type: postMedia[index].format!,
  //       docFile: postMedia[index].mediaFile,
  //       removeAttachment: (index) => removeAttachmenetAtIndex(index),
  //       index: index,
  //     ),
  //   );
  // }

  // void _onTextChanged(String p0) {
  //   if (_debounce?.isActive ?? false) {
  //     _debounce?.cancel();
  //   }
  //   _debounce = Timer(const Duration(milliseconds: 500), () {
  //     handleTextLinks(p0);
  //   });
  // }

  // void handleTextLinks(String text) async {
  //   String link = getFirstValidLinkFromString(text);
  //   if (link.isNotEmpty) {
  //     previewLink = link;
  //     DecodeUrlRequest request =
  //         (DecodeUrlRequestBuilder()..url(previewLink)).build();
  //     DecodeUrlResponse response =
  //         await locator<LikeMindsService>().decodeUrl(request);
  //     if (response.success == true) {
  //       OgTags? responseTags = response.ogTags;
  //       linkModel = MediaModel(
  //         mediaType: MediaType.link,
  //         link: previewLink,
  //         ogTags: AttachmentMetaOgTags(
  //           description: responseTags!.description,
  //           image: responseTags.image,
  //           title: responseTags.title,
  //           url: responseTags.url,
  //         ),
  //       );
  //       LMAnalytics.get().logEvent(
  //         AnalyticsKeys.linkAttachedInPost,
  //         {
  //           'link': previewLink,
  //         },
  //       );
  //       if (postMedia.isEmpty) {
  //         setState(() {});
  //       }
  //     }
  //   } else if (link.isEmpty) {
  //     linkModel = null;
  //     setState(() {});
  //   }
  // }

  // void checkTextLinks() {
  //   String link = getFirstValidLinkFromString(_controller!.text);
  //   if (link.isEmpty) {
  //     linkModel = null;
  //   } else if (linkModel != null && postMedia.isEmpty && showLinkPreview) {
  //     postMedia.add(linkModel!);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final screenSize = MediaQuery.of(context).size;
    newPostBloc = BlocProvider.of<NewPostBloc>(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
        // if (postMedia.isNotEmpty ||
        //     (_controller != null && _controller!.text.isNotEmpty)) {
        //   showDialog(
        //       context: context,
        //       builder: (context) => AlertDialog(
        //             title: const Text('Discard Post'),
        //             content: const Text(
        //                 'Are you sure want to discard the current post?'),
        //             actions: <Widget>[
        //               TextButton(
        //                 child: const Text(
        //                   'NO',
        //                   style: TextStyle(fontSize: 14),
        //                 ),
        //                 onPressed: () {
        //                   Navigator.of(context).pop();
        //                 },
        //               ),
        //               TextButton(
        //                 child: const Text('Yes'),
        //                 onPressed: () {
        //                   Navigator.of(context).pop();
        //                   locator<NavigationService>().goBack(
        //                     result: {
        //                       "feedroomId": feedRoomId,
        //                       "isBack": false,
        //                       "feedRoomIds": feedRoomIds.isEmpty,
        //                     },
        //                   );
        //                 },
        //               ),
        //             ],
        //           ));
        // } else {
        //   locator<NavigationService>().goBack(
        //     result: {
        //       "feedroomId": feedRoomId,
        //       "isBack": false,
        //       "feedRoomIds": feedRoomIds,
        //     },
        //   );
        // }
        // return Future(() => false);
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: kWhiteColor,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 4.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LMIconButton(
                          icon: LMIcon(
                            type: LMIconType.icon,
                            icon: Icons.chevron_left,
                            color: Theme.of(context).primaryColor,
                            size: 42,
                          ),
                          containerSize: 42,
                          onTap: (active) {
                            Navigator.pop(context);
                          },
                        ),
                        const Spacer(),
                        const LMTextView(
                          text: 'Create a Post',
                          textStyle:
                              TextStyle(fontSize: 18, color: kGrey1Color),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () async {
                            // if (_controller != null &&
                            //     (_controller!.text.isNotEmpty ||
                            //         postMedia.isNotEmpty)) {
                            //   checkTextLinks();
                            //   userTags = TaggingHelper.matchTags(
                            //       _controller!.text, userTags);
                            //   result = TaggingHelper.encodeString(
                            //       _controller!.text, userTags);
                            //   newPostBloc?.add(
                            //     CreateNewPost(
                            //       postText: result ?? '',
                            //       feedRoomId: feedRoomId,
                            //       postMedia: postMedia,
                            //     ),
                            //   );
                            //   locator<NavigationService>().goBack(
                            //     result: {
                            //       "isBack": true,
                            //     },
                            //   );
                            // } else {
                            //   toast(
                            //     "Can't create a post without text or attachments",
                            //     duration: Toast.LENGTH_LONG,
                            //   );
                            // }
                          },
                          child: Text(
                            'Post',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                kVerticalPaddingLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  child: Row(
                    children: [
                      LMProfilePicture(
                        fallbackText: user.name,
                        imageUrl: user.imageUrl,
                      ),
                      kHorizontalPaddingLarge,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 16,
                              color: kGrey1Color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // Multi Channel Post Upload Support
                          // Uncomment below code to user
                          // widget.isCm
                          //     ? kVerticalPaddingSmall
                          //     : const SizedBox.shrink(),
                          // widget.isCm
                          //     ? Row(
                          //         children: [
                          //           const Text(
                          //             'Post in:',
                          //             style: TextStyle(
                          //               color: kGrey3Color,
                          //               fontSize: kFontSmall,
                          //             ),
                          //           ),
                          //           kHorizontalPaddingMedium,
                          //           GestureDetector(
                          //             onTap: () async {
                          //               var response =
                          //                   await locator<NavigationService>()
                          //                       .navigateTo(
                          //                 FeedRoomSelect.route,
                          //                 arguments: FeedRoomSelectArguments(
                          //                     user: user,
                          //                     feedRoomIds: feedRoomIds),
                          //               );
                          //               feedRoomIds = response['feedRoomIds'];
                          //               rebuildFeedRoomSelectTab.value =
                          //                   !rebuildFeedRoomSelectTab.value;
                          //             },
                          //             child: Container(
                          //               padding: const EdgeInsets.symmetric(
                          //                 horizontal: 5,
                          //                 vertical: 2,
                          //               ),
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.circular(4),
                          //                 border: Border.all(
                          //                   color: kPrimaryColor,
                          //                   width: 1.0,
                          //                 ),
                          //               ),
                          //               child: Row(
                          //                 children: [
                          //                   ValueListenableBuilder(
                          //                       valueListenable:
                          //                           rebuildFeedRoomSelectTab,
                          //                       builder: (context, _, __) {
                          //                         return Text(
                          //                           feedRoomIds.isEmpty
                          //                               ? widget.feedRoomTitle
                          //                               : feedRoomIds.length == 1
                          //                                   ? feedRoomIds[0].title
                          //                                   : '${feedRoomIds.length} Groups',
                          //                           style: const TextStyle(
                          //                             color: kPrimaryColor,
                          //                           ),
                          //                         );
                          //                       }),
                          //                   kHorizontalPaddingSmall,
                          //                   const Icon(
                          //                     CupertinoIcons.chevron_down,
                          //                     color: kPrimaryColor,
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       )
                          //     : const SizedBox.shrink()
                        ],
                      ),
                    ],
                  ),
                ),
                kVerticalPaddingMedium,
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            minHeight: 72,
                          ),
                          decoration: const BoxDecoration(
                            color: kWhiteColor,
                          ),
                          child: const LMTextInput(
                            // fieldColor: kGrey3Color.withOpacity(0.3),
                            borderRadius: 12,
                            backgroundColor: Colors.white,
                            externalPadding: 0,
                            // profilePicture: LMProfilePicture(
                            //   fallbackText: user.name,
                            //   size: 48,
                            // ),
                            // sendButton: LMIconButton(
                            //   icon: LMIcon(
                            //     icon: Icons.send,
                            //     color:
                            //         Theme.of(context).primaryIconTheme.color,
                            //     size: 24,
                            //   ),
                            //   onTap: () {
                            //     debugPrint('send');
                            //   },
                            //   containerSize: 48,
                            //   borderRadius: 24,
                            //   backgroundColor: Theme.of(context).primaryColor,
                            // ),
                          ),
                        ),
                        kVerticalPaddingXLarge,
                        // if (isUploading)
                        //   const Padding(
                        //     padding: EdgeInsets.only(
                        //       top: kPaddingMedium,
                        //       bottom: kPaddingLarge,
                        //     ),
                        //     child: Loader(),
                        //   ),
                        // if (postMedia.isEmpty &&
                        //     linkModel != null &&
                        //     showLinkPreview)
                        //   Stack(
                        //     children: [
                        //       PostLinkView(
                        //           screenSize: screenSize, linkModel: linkModel),
                        //       Positioned(
                        //         top: 5,
                        //         right: 5,
                        //         child: GestureDetector(
                        //           onTap: () {
                        //             showLinkPreview = false;
                        //             setState(() {});
                        //           },
                        //           child: const CloseIcon(),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // if (postMedia.isNotEmpty)
                        //   postMedia.first.mediaType == MediaType.document
                        //       ? getPostDocument(screenSize!.width)
                        //       : Container(
                        //           padding: const EdgeInsets.only(
                        //             top: kPaddingSmall,
                        //           ),
                        //           alignment: Alignment.center,
                        //           child: PostMedia(
                        //             height: screenSize!.width,
                        //             removeAttachment: removeAttachmenetAtIndex,
                        //             //min(constraints.maxHeight, screenSize!.width),
                        //             mediaFiles: postMedia,
                        //             postId: '',
                        //           ),
                        //         ),
                        // kVerticalPaddingMedium,
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: kGrey3Color.withOpacity(0.2),
                        offset: const Offset(0.0, -1.0),
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                    ],
                  ),
                  //   child: Column(
                  //     children: [
                  //       isDocumentPost
                  //           ? const SizedBox.shrink()
                  //           : AddAssetsButton(
                  //               mediaType: 1, // 1 for photos
                  //               picker: _picker,
                  //               filePicker: _filePicker,
                  //               uploading: onUploading,
                  //               onUploaded: onUploadedMedia,
                  //               postMedia: setPickedMediaFiles,
                  //               mediaListLength: postMedia.length,
                  //               preUploadCheck: () {
                  //                 if (postMedia.length >= 10) {
                  //                   return false;
                  //                 }
                  //                 return true;
                  //               },
                  //             ),
                  //       isDocumentPost
                  //           ? const SizedBox.shrink()
                  //           : AddAssetsButton(
                  //               mediaType: 2, // 2 for videos
                  //               picker: _picker,
                  //               filePicker: _filePicker,
                  //               uploading: onUploading,
                  //               onUploaded: onUploadedMedia,
                  //               postMedia: setPickedMediaFiles,
                  //               mediaListLength: postMedia.length,
                  //               preUploadCheck: () {
                  //                 if (postMedia.length >= 10) {
                  //                   return false;
                  //                 }
                  //                 return true;
                  //               },
                  //             ),
                  //       isMediaPost
                  //           ? const SizedBox.shrink()
                  //           : AddAssetsButton(
                  //               mediaType: 3, // 2 for videos
                  //               picker: _picker,
                  //               filePicker: _filePicker,
                  //               uploading: onUploading,
                  //               onUploaded: onUploadedDocument,
                  //               postMedia: setPickedMediaFiles,
                  //               mediaListLength: postMedia.length,
                  //               preUploadCheck: () {
                  //                 if (postMedia.length >= 10) {
                  //                   return false;
                  //                 }
                  //                 return true;
                  //               },
                  //             ),
                  //     ],
                  //   ),
                  // )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class AddAssetsButton extends StatelessWidget {
//   final ImagePicker picker;
//   final FilePicker filePicker;
//   final int mediaListLength;
//   final int mediaType; // 1 for photo 2 for video
//   final Function(bool uploadResponse) onUploaded;
//   final Function() uploading;
//   final Function() preUploadCheck;
//   final Function(List<MediaModel>)
//       postMedia; // only return in List<File> format

//   const AddAssetsButton({
//     super.key,
//     required this.mediaType,
//     required this.filePicker,
//     required this.mediaListLength,
//     required this.picker,
//     required this.onUploaded,
//     required this.uploading,
//     required this.postMedia,
//     required this.preUploadCheck,
//   });

//   Future<bool> handlePermissions(BuildContext context) async {
//     if (Platform.isAndroid) {
//       PermissionStatus permissionStatus;

//       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       if (androidInfo.version.sdkInt >= 33) {
//         if (mediaType == 1) {
//           permissionStatus = await Permission.photos.status;
//           if (permissionStatus == PermissionStatus.granted) {
//             return true;
//           } else if (permissionStatus == PermissionStatus.denied) {
//             permissionStatus = await Permission.photos.request();
//             if (permissionStatus == PermissionStatus.permanentlyDenied) {
//               toast(
//                 'Permissions denied, change app settings',
//                 duration: Toast.LENGTH_LONG,
//               );
//               return false;
//             } else if (permissionStatus == PermissionStatus.granted) {
//               return true;
//             } else {
//               return false;
//             }
//           }
//         } else {
//           permissionStatus = await Permission.videos.status;
//           if (permissionStatus == PermissionStatus.granted) {
//             return true;
//           } else if (permissionStatus == PermissionStatus.denied) {
//             permissionStatus = await Permission.videos.request();
//             if (permissionStatus == PermissionStatus.permanentlyDenied) {
//               toast(
//                 'Permissions denied, change app settings',
//                 duration: Toast.LENGTH_LONG,
//               );
//               return false;
//             } else if (permissionStatus == PermissionStatus.granted) {
//               return true;
//             } else {
//               return false;
//             }
//           }
//         }
//       } else {
//         permissionStatus = await Permission.storage.status;
//         if (permissionStatus == PermissionStatus.granted) {
//           return true;
//         } else {
//           permissionStatus = await Permission.storage.request();
//           if (permissionStatus == PermissionStatus.granted) {
//             return true;
//           } else if (permissionStatus == PermissionStatus.denied) {
//             return false;
//           } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
//             toast(
//               'Permissions denied, change app settings',
//               duration: Toast.LENGTH_LONG,
//             );
//             return false;
//           }
//         }
//       }
//     }
//     return true;
//   }

//   void pickImages(BuildContext context) async {
//     uploading();
//     try {
//       final List<XFile> list = await picker.pickMultiImage();

//       if (list.isNotEmpty) {
//         if (mediaListLength + list.length > 10) {
//           toast(
//             'A total of 10 attachments can be added to a post',
//             duration: Toast.LENGTH_LONG,
//           );
//           onUploaded(false);
//           return;
//         }
//         for (XFile image in list) {
//           int fileBytes = await image.length();
//           double fileSize = getFileSizeInDouble(fileBytes);
//           if (fileSize > 100) {
//             toast(
//               'File size should be smaller than 100MB',
//               duration: Toast.LENGTH_LONG,
//             );
//             onUploaded(false);
//             return;
//           }
//         }
//         MultiImageCrop.startCropping(
//           context: context,
//           activeColor: kWhiteColor,
//           aspectRatio: 1,
//           files: list.map((e) => File(e.path)).toList(),
//           callBack: (List<File> images) {
//             List<MediaModel> mediaFiles = images
//                 .map((e) => MediaModel(
//                     mediaFile: File(e.path), mediaType: MediaType.image))
//                 .toList();
//             postMedia(mediaFiles);
//             onUploaded(true);
//           },
//         );
//       } else {
//         onUploaded(false);
//       }
//     } catch (e) {
//       toast(
//         'An error occurred',
//         duration: Toast.LENGTH_LONG,
//       );
//       onUploaded(false);
//       print(e.toString());
//     }
//   }

//   void pickVideos() async {
//     uploading();
//     try {
//       final pickedFiles = await filePicker.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         dialogTitle: 'Select files',
//         allowedExtensions: [
//           '3gp',
//           'mp4',
//         ],
//       );
//       if (pickedFiles != null) {
//         if (mediaListLength + pickedFiles.files.length > 10) {
//           toast(
//             'A total of 10 attachments can be added to a post',
//             duration: Toast.LENGTH_LONG,
//           );
//           onUploaded(false);
//           return;
//         }
//         List<MediaModel> videoFiles = [];
//         for (var pickedFile in pickedFiles.files) {
//           if (getFileSizeInDouble(pickedFile.size) > 100) {
//             toast(
//               'File size should be smaller than 100MB',
//               duration: Toast.LENGTH_LONG,
//             );
//             onUploaded(false);
//             return;
//           } else {
//             File video = File(pickedFile.path!);
//             VideoPlayerController controller =
//                 VideoPlayerController.file(video);
//             await controller.initialize();
//             Duration videoDuration = controller.value.duration;
//             MediaModel videoFile = MediaModel(
//                 mediaType: MediaType.video,
//                 mediaFile: video,
//                 duration: videoDuration.inSeconds);

//             videoFiles.add(videoFile);
//           }
//         }
//         postMedia(videoFiles);
//         onUploaded(true);
//         return;
//       } else {
//         onUploaded(false);
//         return;
//       }
//     } catch (e) {
//       onUploaded(false);
//       toast(
//         'An error occurred',
//         duration: Toast.LENGTH_LONG,
//       );
//       print(e.toString());
//       return;
//     }
//   }

//   void pickFiles() async {
//     uploading();
//     try {
//       final pickedFiles = await filePicker.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         dialogTitle: 'Select files',
//         allowedExtensions: [
//           'pdf',
//         ],
//       );

//       if (pickedFiles != null) {
//         if (mediaListLength + pickedFiles.files.length > 10) {
//           toast(
//             'A total of 10 attachments can be added to a post',
//             duration: Toast.LENGTH_LONG,
//           );
//           onUploaded(false);
//           return;
//         }
//         for (var pickedFile in pickedFiles.files) {
//           if (getFileSizeInDouble(pickedFile.size) > 100) {
//             toast(
//               'File size should be smaller than 100MB',
//               duration: Toast.LENGTH_LONG,
//             );
//             onUploaded(false);
//             return;
//           }
//         }
//         List<MediaModel> attachedFiles = [];
//         attachedFiles = pickedFiles.files
//             .map((e) => MediaModel(
//                 mediaType: MediaType.document,
//                 mediaFile: File(e.path!),
//                 format: e.extension,
//                 size: e.size))
//             .toList();
//         postMedia(attachedFiles);
//         onUploaded(true);
//       } else {
//         onUploaded(false);
//       }
//     } catch (e) {
//       onUploaded(false);
//       toast(
//         'An error occurred',
//         duration: Toast.LENGTH_LONG,
//       );
//       print(e.toString());
//       return;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: () async {
//         LMAnalytics.get().logEvent(
//           AnalyticsKeys.clickedOnAttachment,
//           {
//             'type': mediaType == 1
//                 ? 'photo'
//                 : mediaType == 2
//                     ? 'video'
//                     : 'file',
//           },
//         );
//         if (preUploadCheck()) {
//           bool permissionStatus = await handlePermissions(context);
//           if (permissionStatus) {
//             if (mediaType == 1) {
//               pickImages(context);
//             } else if (mediaType == 2) {
//               pickVideos();
//             } else if (mediaType == 3) {
//               pickFiles();
//             }
//           }
//         } else {
//           toast(
//             "A total of 10 attachments can be added to a post",
//             duration: Toast.LENGTH_LONG,
//           );
//         }
//       },
//       child: SizedBox(
//         height: 48,
//         width: screenSize.width,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 16.0,
//             vertical: 10,
//           ),
//           child: Row(
//             children: [
//               SvgPicture.asset(
//                 assetButtonData[mediaType]['svg_icon'],
//                 height: 28,
//               ),
//               kHorizontalPaddingLarge,
//               Text(
//                 assetButtonData[mediaType]['title'],
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: kGreyColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
