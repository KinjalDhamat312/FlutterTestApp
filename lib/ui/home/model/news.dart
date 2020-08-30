import '../../../utils/images.dart';

class News {
  String newsHeadLine;
  String newsImage;
  String newsUrl;

  News(this.newsHeadLine, this.newsImage, this.newsUrl);

  static List<News> getNewsList() {
    List<News> newsList = [];
    newsList.add(News(
      "PM Modi pays tributes to Major Dhyan Chand on National Sports Day",
      icNew1,
      "https://www.dnaindia.com/india/report-pm-modi-pays-tribute-to-major-dhyan-chand-on-national-sports-day-2839995#:~:text=Prime%20Minister%20Narendra%20Modi%20on,of%20hockey%20wizard%20Dhyan%20Chand.",
    ));
    newsList.add(News(
      "Mumbai crosses 3,000 mm mark with heavy rains, there’s more coming",
      icNew2,
      "https://www.hindustantimes.com/mumbai-news/mumbai-crosses-3-000-mm-mark-with-heavy-rains-there-s-more-coming/story-RdarO1x8ww1NZ7WJIoMcCK.html",
    ));
    newsList.add(News(
      "Polluted air linked to increase in blood pressure: Study",
      icNew3,
      "https://www.hindustantimes.com/environment/polluted-air-linked-to-increase-in-blood-pressure-study/story-BpQhy7HsElZHGr8EBGleNJ.html",
    ));
    newsList.add(News(
      "Area under Kharif crop rises to record 1,082 lakh ha",
      icNew4,
      "https://indianexpress.com/article/india/area-under-kharif-crop-rises-to-record-1082-lakh-ha-6574408/",
    ));
    newsList.add(News(
      "SC backs UGC decision to hold exams, says states can seek deadline extension",
      icNew5,
      "https://indianexpress.com/article/india/supreme-court-ugc-exams-covid-19-6574261/",
    ));
    newsList.add(News(
      "PM Modi pays tributes to Major Dhyan Chand on National Sports Day",
      icNew1,
      "https://www.dnaindia.com/india/report-pm-modi-pays-tribute-to-major-dhyan-chand-on-national-sports-day-2839995#:~:text=Prime%20Minister%20Narendra%20Modi%20on,of%20hockey%20wizard%20Dhyan%20Chand.",
    ));
    newsList.add(News(
      "Mumbai crosses 3,000 mm mark with heavy rains, there’s more coming",
      icNew2,
      "https://www.hindustantimes.com/mumbai-news/mumbai-crosses-3-000-mm-mark-with-heavy-rains-there-s-more-coming/story-RdarO1x8ww1NZ7WJIoMcCK.html",
    ));
    newsList.add(News(
      "Polluted air linked to increase in blood pressure: Study",
      icNew3,
      "https://www.hindustantimes.com/environment/polluted-air-linked-to-increase-in-blood-pressure-study/story-BpQhy7HsElZHGr8EBGleNJ.html",
    ));
    newsList.add(News(
      "Area under Kharif crop rises to record 1,082 lakh ha",
      icNew4,
      "https://indianexpress.com/article/india/area-under-kharif-crop-rises-to-record-1082-lakh-ha-6574408/",
    ));
    newsList.add(News(
      "SC backs UGC decision to hold exams, says states can seek deadline extension",
      icNew5,
      "https://indianexpress.com/article/india/supreme-court-ugc-exams-covid-19-6574261/",
    ));

    return newsList;
  }
}
