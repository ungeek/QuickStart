import { BannerClass } from '../model/BannerClass';
import { bufferToString } from '../util/BufferUtil';

//@Preview
@Component
export struct Banner {
  @State bannerList: BannerClass[] = [];

  aboutToAppear(): void {
    this.getBannerDataFromJSON();

  }

  getBannerDataFromJSON() {
    this.getUIContext().getHostContext()?.resourceManager.getRawFileContent('BannerData.json').then(value => {
      // // Get the buffer content and convert it to a string.
      // let res: string = bufferToString(value);
      // // Parse into data structures
      // this.bannerList = JSON.parse(res) as BannerClass[];

      //以上四行代码可以合并为下方1行代码

      this.bannerList = JSON.parse(bufferToString(value)) as BannerClass[];
    });
  }

  build() {
    Swiper(){
      ForEach(this.bannerList, (item: BannerClass) => {
        Image($r(item.imageSrc))
          .objectFit(ImageFit.Contain)
          .width('100%')
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16)
      }, (item: BannerClass, index: number) => item.id)
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7'))
  }
}