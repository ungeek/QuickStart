// import {BannerClass} from '../model/BannerClass';
// import {ArticleClass} from '../model/ArticleClass';

import { TutorialView } from '../view/TutorialView';
import { Banner } from '../view/Banner';
import { EnablementView } from '../view/EnablementView';

@Entry
@Component
struct Index {
  @State message: string = '快速入门';

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight('700')
        .padding({ left: '16' })
        .width('100%')
        .textAlign(TextAlign.Start)
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(33)

      Scroll() {
        Column() {
          Banner()
          EnablementView()
          TutorialView()
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}






