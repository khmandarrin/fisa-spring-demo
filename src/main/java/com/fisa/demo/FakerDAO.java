package com.fisa.demo;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class FakerDAO {
    private final List<String> imageUrl;

    public FakerDAO() {
        this.imageUrl = new ArrayList<>();
        this.imageUrl.add("https://i.namu.wiki/i/yOlWMmQqNyH85vgnZkyKHjEb0tLiWZB6PsXx4JGQRztJ3xKvAnrY_8Uan1MVbjx4gOzOomy3aRauptZcfpAKGg.webp");
        this.imageUrl.add("https://img.hankyung.com/photo/202312/01.35159006.1.jpg");
        this.imageUrl.add("https://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2023/12/30/c84a8fc0-0507-4f38-ba6c-aa7656d81211.jpg");
        this.imageUrl.add("https://i.namu.wiki/i/lXk-QGwNN1SozkiftTC4o-hyHa9TFic6zqSKOU_Pr0zm03WnqwNiV7a29-RRSK5NzizWKxkUlh5pQ0fxDjU3OA.webp");
        this.imageUrl.add("https://img.kbs.co.kr/kbs/620/news.kbs.co.kr/data/fckeditor/new/image/2023/12/05/334011701766870580.jpg");
        this.imageUrl.add("https://sports.hankooki.com/news/photo/202411/6879766_1108716_4258.jpg");
        this.imageUrl.add("https://cdn.sisain.co.kr/news/photo/202312/51736_96184_1701362196.jpg");
        this.imageUrl.add("https://image.fmkorea.com/files/attach/new5/20260211/9480247244_14339012_b592708f350cf468cb7b7d08e0ad664c.jpg.webp");
        this.imageUrl.add("https://m.kukinews.com/data/kuk/image/2024/09/13/kuk20240913000238.jpg");
        this.imageUrl.add("https://img.hankyung.com/photo/202212/01.32007777.1.jpg");
        this.imageUrl.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAJY5p2wFd_ZIlBHIAvuBBLxhdr9M8e4IGgw&s");
        this.imageUrl.add("https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202511/10/SPORTSSEOUL/20251110154325630odxa.jpg");
        this.imageUrl.add("https://image.ajunews.com/content/image/2023/11/19/20231119204928204734.jpg");
        this.imageUrl.add("https://pimg.mk.co.kr/news/cms/202411/03/news-p.v1.20241103.e3f5e2dd424d499ead9b0a6932486394_P1.jpg");
        this.imageUrl.add("https://img0.yna.co.kr/photo/yna/YH/2023/09/29/PYH2023092911700001300_P4.jpg");
    }

    public String getRandomFakerImage() {
        int index = (int) (Math.random() * imageUrl.size());
        return imageUrl.get(index);
    }
}
