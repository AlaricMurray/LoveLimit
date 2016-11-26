//
//  Header.h
//  FreeDemo
//
//

#ifndef FreeDemo_Header_h
#define FreeDemo_Header_h

//限免
#define k_LIMIT_URL @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%d"
//降价
#define k_SALES_URL @"http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&page=%d"
//免费
#define k_FREE_URL @"http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=%d"
//专题
#define k_SPECIAL_URL @"http://iappfree.candou.com:8080/free/special?page=%d&limit=5"
#define n_SPECIAL_URL @"http://10.0.8.10/app/qfts/iappfree/api/topic.php?page=%d&number=5"
//热榜
#define k_HOSTLIST_URL @"http://open.candou.com/mobile/hot/page/%d"
#define n_HOSTLIST_URL @"http://10.0.8.10/app/qfts/iappfree/api/hot.php?page=%d&number=10"

//详情
#define k_DETAIL_URL @"http://iappfree.candou.com:8080/free/applications/%@?currency=rmb"
//附近的人在用
#define k_RECOMMEND_URL @"http://iappfree.candou.com:8080/free/applications/recommend?longitude=116.344539&latitude=40.034346"


//分类
#define k_SORTLIST_LIMITED_URL @"http://iappfree.candou.com:8080/free/categories/limited"
#define k_SORTLIST_SALES_URL @"http://iappfree.candou.com:8080/free/categories/sales"
#define k_SORTLIST_FREE_URL @"http://iappfree.candou.com:8080/free/categories/free"
#define k_SORTLIST_URL @"http://10.0.8.10/app/qfts/iappfree/api/appcate.php"

//分类的内容（id为0或者不加这个参数代表全部）
//限免分类
#define k_LIST_LIMITED_URL @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%d&category_id="
//降价分类
#define k_LIST_SALES_URL @"http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&page=%d&category_id="
//免费分类
#define k_LIST_FREE_URL @"http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=%d&category_id="
//热榜分类
#define k_LIST_HOST_URL @"http://open.candou.com/mobile/hot/page/%d&category_id="
#define n_LIST_HOST_URL @"http://10.0.8.10/app/qfts/iappfree/api/hot.php?page=%d&number=10&cate_id="


#define k_CANDOU_URL @"http://open.candou.com/mobile/candou"

//屏幕高度
#define k_screen_height [UIScreen mainScreen].bounds.size.height

#endif

