class YoutubeModal {
  String publishedAt;
  String id;
  String channelId;
  String title;
  String description;
  Map thumbnail;
  String channelTitle;
  // List tags;
  // String categoryId;
  String liveBroadcastContent;
  // Map localized;
  // String defaultAudioLanguage;

  YoutubeModal(
    this.publishedAt,
    this.id,
    this.channelId,
    this.title,
    this.description,
    this.thumbnail,
    this.channelTitle,
    // this.tags,
    // this.categoryId,
    this.liveBroadcastContent,
    // this.localized,
    // this.defaultAudioLanguage,
  );

  factory YoutubeModal.fromMap(
      {required Map snippet, required String id_video}) {
    return YoutubeModal(
      snippet['publishedAt'],
      id_video,
      snippet['channelId'],
      snippet['title'],
      snippet['description'],
      snippet['thumbnails'],
      snippet['channelTitle'],
      // snippet['tags'],
      // snippet['categoryId'],
      snippet['liveBroadcastContent'],
      // snippet['localized'],
      // snippet['defaultAudioLanguage'],
    );
  }
}
