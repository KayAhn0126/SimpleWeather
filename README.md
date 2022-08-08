# SimpleWeather


# 📖 코드 관련 사항
## 🍎 Int 자료형의 타입메서드 .random()

```swift=
func randomTemperatureGenerator() -> String {
    return String(Int.random(in: 15..<35)) + "°"
}
```

---
## 🍎 .withRenderingMode 함수

```swift=
func randomWeatherImageGenerator() -> UIImage {
    let imageName = weathers.randomElement()!
    let image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
    return image!
}
```

### 원형은 이렇게 생겼다.
```swift=
@available(iOS 7.0, *)
    open func withRenderingMode(_ renderingMode: UIImage.RenderingMode) -> UIImage
```

- 이미지 렌더링모드는 이미지를 렌더링하는데 있어 해당 이미지의 컬러모드에 대한 값을 지정해주는 메서드이다.
- 3가지 옵션이 있는데 automatic, alwaysOriginal, alwaysTemplate가 있다.
    - automatic
        - default
    - alwaysTemplate
        - 원본 이미지의 컬러 정보를 포함시키지 않고 불투명한 부분을 틴트컬러로 대체
    - alwaysOriginal
        - 원본 이미지에서 컬러 정보를 모두 포함시킨다

---
# 📖 UI 관련 사항 (스토리보드)

## 🍎 스토리보드에서 button 양쪽의 padding.
- button의 양쪽이 화면의 가장자리로 부터 일정하게 띄워져있다.
- 지금은 View를 생성하고 그 안에 버튼을 view의 x,y축으로 고정시킨후 leading값을 20정도 주었다.
- 이 방법(view를 사용해 button을 가장자리로 부터 띄우는 방법)이 아닌 다른 방법이 있는지 생각해보자.

![](https://i.imgur.com/byzsxQK.png)
