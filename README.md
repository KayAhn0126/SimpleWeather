# SimpleWeather

|              작동 화면                 |
|:------------------------------------:|
| ![](https://i.imgur.com/nrY5mBg.gif) |


# 📖 발견한 점
## 1. 코드로 UI를 작성하면서 반복되는 내용이 많았다. -> 타입 메서드를 만들어 재사용 되는 부분에 사용하였다.
```swift
static func createUnitStack(axis: NSLayoutConstraint.Axis,
                            alignment: UIStackView.Alignment,
                            distribution: UIStackView.Distribution,
                            spacing: Int,
                            contentMode: UIView.ContentMode) -> UIStackView {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = axis
    stack.alignment = alignment
    stack.distribution = distribution
    stack.spacing = CGFloat(spacing)
    stack.contentMode = contentMode
    return stack
}
```

- 매개변수 타입을 어떻게 넣어줄지 몰라서 해당 값에 오른쪽 마우스 클릭 후 jump to definition로 들어가서 확인 후 정해주었다.
- ex) stack.axis = .vertical -> .vertical 부분에 오른쪽 마우스 오른쪽 마우스 클릭 후 jump to definition로 들어가서 확인

## 2. 함수를 사용할 때 선택적 매개변수를 이용해서 유연한 함수를 만들었다.
```swift
static func createLabel(font: UIFont,
                        textAlignment: NSTextAlignment,
                        numberOfLines: Int,
                        text: String = "",
                        backgroundColor: UIColor = .clear,
                        textColor: UIColor = .black) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = font
    label.textAlignment = textAlignment
    label.numberOfLines = numberOfLines
    label.text = text
    label.backgroundColor = backgroundColor
    label.textColor = textColor
    return label
}
```
- 매개변수 자리의 text와 backgroundColor, textColor를 보면 기본값이 정해져있다. 저 함수를 어떻게 사용하는지 보자!
```swift
let mondayLabel: UILabel = {
    createLabel(font: UIFont.systemFont(ofSize: 20, weight: .regular),
                textAlignment: .center,
                numberOfLines: 1,
                text: "Mon",
                textColor: .white)
}()
```
- 위와 같이 동일한 함수를 이용해서 label을 생성 해주었다. 넣어주고 싶지 않은 값은 사용하지 않아도 생성할 수 있었다!

## 3. 제약 조건을 하나의 방법으로만 걸어 왔었는데 아래와 같이 다양하게 걸 수 있다.
```swift
    // 기본적인 제약
    temperatureLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor)

    // constant를 이용한 제약
    changeButtonView.heightAnchor.constraint(equalToConstant: 220)

    // Anchor와 constant를 이용한 제약
    changeButton.leadingAnchor.constraint(equalTo: changeButtonView.leadingAnchor, constant: 20)
```
- 더 쉽고 세세하게 제약을 걸 수 있다.

## 궁금해서 찾아본 부분. 
- translatesAutoresizingMaskIntoConstraints와 adjustsImageSizeForAccessibilityContentSizeCategory이 정확히 무엇인지 모르고 사용했다.
    - 비교 후 업데이트
- 스토리보드로 UI를 구성할 땐 버튼에 IBAction function을 연결해 버튼이 클릭 될 때 마다 특정 행동을 하게 해주었다. 하지만 전부 코드로 구현하니 버튼을 클릭 할 때 처리를 어떻게 해줘야 하는지 몰라서 찾아보았다.
    - #selector와 @objc func 사용법






# 📖 코드 관련 사항
## 🍎 Int 자료형의 타입메서드 .random()

```swift=
func randomTemperatureGenerator() -> String {
    return String(Int.random(in: 15..<35)) + "°"
}
```

---
## 🍎 .withRenderingMode 함수

```swift
func randomWeatherImageGenerator() -> UIImage {
    let imageName = weathers.randomElement()!
    let image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
    return image!
}
```

### 원형은 이렇게 생겼다.
```swift
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
# 📖 UI 관련 사항

## 🍎 스토리보드에서 button 양쪽의 padding을 주기.
- button의 양쪽이 화면의 가장자리로 부터 일정하게 띄워져있다.
- 지금은 View를 생성하고 그 안에 버튼을 view의 x,y축으로 고정시킨후 leading값을 20정도 주었다.
- 이 방법(view를 사용해 button을 가장자리로 부터 띄우는 방법)이 아닌 다른 방법이 있는지 생각해보자.

![](https://i.imgur.com/byzsxQK.png)

