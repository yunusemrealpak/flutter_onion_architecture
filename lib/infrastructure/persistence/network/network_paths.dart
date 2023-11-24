class NetworkPaths {
  static const String getConfig = '/api/ApplicationConfig/Get';

  // Auth
  static const String login = '/api/auth/login';
  static const String register = '/api/auth/register';
  static const String verify = '/api/auth/verifyCode';
  static const String resendSms = '/api/auth/tekrarSmsGonder';
  static const String deleteAccount = '/api/auth/hesabimiSil';
  static const String profileUpdate = '/api/auth/profilDuzenle';

  static const String forgotPassword = '/api/Auth/ForgotPassword';
  static const String changePassword = '/api/auth/sifreDegistir';
  static const String logout = '/api/Auth/Logout';
  static const String checkToken = '/api/auth/me';
  static const String updatePushToken = '/api/auth/pushToken';
  static const String removePushToken = '/api/auth/pushTokenOut';

  // Home
  static const String getFeed = '/api/anasayfa';

  //Announcement
  static const String getAnnouncementDetails = '/api/slider/detay';

  // Fair
  static const String getFairs = '/api/fuarlar/listele';
  static const String getUpcomingFairs = '/api/fuarlar/yaklasanFuarlar';
  static const String getFair = '/api/fuarlar/fuar-detay';
  static const String getSectors = '/api/other/sektorler';
  static const String getEventTypes = '/api/EventTypes/GetList';
  static const String getLocations = '/api/other/lokasyonlar';
  static const String getSalons = '/api/other/salonlar';
  static const String getDepartments = '/api/other/departmanlar';
  static const String getCountries = '/api/other/ulkeler';
  static const String getCities = '/api/other/sehirler';
  static const String getFairActivities = '/api/fuarlar/faaliyetler';
  static const String getFairProductGroups = '/api/fuarlar/fuar-urunleri';
  static const String getFairFavories = '/api/fuarlar/fuar-planim';
  static const String getShareInvitation = '/api/davetiye/gonder';
  static const String submitInvitation = '/api/davetiye/olustur';
  static const String submitExhibitorForm = '/api/fuarKatilim/save';
  static const String getFairEvents = '/api/fuarlar/etkinlikler';
  static const String getFairSignatures = '/api/other/imzaGunleri';
  static const String getFairBookEvents = '/api/other/kitapEtkinlik';

  // Company
  static const String getCompanies = '/api/firmalar/listele';
  static const String getCompany = '/api/firmalar/firma-detay';
  static const String searchCompanies = '/api/Company/Search';
  static const String getCompanyTypes = '/api/CompanyTypes/GetList';
  static const String getCompanyRepresentative = '/api/temsilciler/listele';
  static const String getCompanyBrands = '/api/markalar/listele';

  // Product
  static const String getCompanyProducts = '/api/urunler/firma-urunleri';
  static const String getFairProductList = '/api/urunler/listele';
  static const String getProduct = '/api/urunler/detay';
  static const String searchProducts = '/api/Products/Search';
  static const String getFavoriteProducts = '/api/Products/GetFavorites';
  static const String setFavoriteProduct = '/api/Products/SetFavorite';

  // Event
  static const String getEvents = '/api/fuarlar/etkinlikler';
  static const String getEventDetails = '/api/fuarlar/etkinlik-detay';
  static const String searchEvents = '/api/Events/Search';

  // Meeting
  static const String getFairsHasMeetings = '/api/toplanti/hangiFuarlarToplanti';
  static const String getCompaniesHasMeetings = '/api/toplanti/hangiFirmalarToplanti';
  static const String getMeetings = '/api/toplanti/listele';
  static const String getMeeting = '/api/Meetings/Get';
  static const String searchMeetings = '/api/Meetings/Search';
  static const String getMeetingRequests = '/api/toplanti/listele';
  static const String createMeetingRequest = '/api/toplanti/olustur';
  static const String acceptMeetingRequest = '/api/Meetings/AcceptMeetingRequest';
  static const String rejectMeetingRequest = '/api/Meetings/RejectMeetingRequest';
  static const String suggestNewDateForMeetingRequest = '/api/Meetings/SuggestNewDateForMeetingRequest';
  static const String getMeetingDateAndTimes = '/api/toplanti/saatler';

  // Product Group
  static const String getProductGroups = '/api/urunler/urun-gruplari';
  static const String getCompanyProductGroups = '/api/firmalar/urun-gruplari';

  static const String getProductGroup = '/api/ProductGroups/Get';
  static const String searchProductGroups = '/api/ProductGroups/Search';

  // News
  static const String getNews = '/api/haberler/listele';
  static const String getNewsDetails = '/api/haberler/detay';

  // Messages
  static const String getMessagedFairs = '/api/mesaj/hangi-fuarlarda-konustum';
  static const String getMessagedCompanies = '/api/mesaj/hangi-firmalarla-konustum';
  static const String getMessage = '/api/mesaj/ne-konustum';
  static const String createMessage = '/api/mesaj/gonder';

  // Profile
  static const String getNameBadges = '/api/yakakarti/listele';
  static const String getMyJoinedFairs = '/api/fuarlar/kayitli-fuarlar';
  static const String getMyFavoriteFairs = '/api/favori/favoriFuarlarim';
  static const String getMyFavoriteCompanies = '/api/favori/favoriFirmalar';
  static const String getMyFavoriteProducts = '/api/favori/favoriUrunler';

  static const String getMyFavorites = '/api/favori/favoriList';

  // Special
  static const String getSpecial = '/api/onerilen/listele';

  // Main
  static const String addFavorite = '/api/favori/favoriye-ekle';
  static const String getPositions = '/api/other/pozisyonlar';
  static const String getJobs = '/api/other/meslek-gruplari';
  static const String getVisitorPurposes = '/api/other/ziyaret-amaci';
  static const String getEmployeeCounts = '/api/other/calisanSayisi';
  static const String getActivityTypes = '/api/other/faaliyetTur';
  static const String checkVersion = '/api/other/checkVersion';

  // Other
  static const String validateFormUser = '/api/auth/checkProfil';
}
