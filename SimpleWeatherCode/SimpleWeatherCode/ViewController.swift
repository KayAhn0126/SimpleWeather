//
//  ViewController.swift
//  SimpleWeatherCode
//
//  Created by Kay on 2022/08/10.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Data Collection
    let locations: [String] = ["Seoul", "Tokyo", "Newyork", "Manchester"]
    let weathers: [String] = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.rain.fill"]
    
    static func createUnitStack(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: Int, contentMode: UIView.ContentMode) -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = axis
        stack.alignment = alignment
        stack.distribution = distribution
        stack.spacing = CGFloat(spacing)
        stack.contentMode = contentMode
        return stack
    }
    
    static func createLabel(font: UIFont, textAlignment: NSTextAlignment, numberOfLines: Int, text: String = "", backgroundColor: UIColor = .clear, textColor: UIColor = .black) -> UILabel {
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
    
    static func createImage(image: UIImage, renderingMode: UIImage.RenderingMode, size: CGSize = CGSize(width: 0, height: 0), contentMode: UIView.ContentMode) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        imageView.image?.withRenderingMode(renderingMode)
        imageView.contentMode = .scaleAspectFit

        return imageView
    }
    
    // MARK: 전체를 담는 세로 스택뷰
    let verticalStack: UIStackView = {
        createUnitStack(axis: .vertical, alignment: .fill, distribution: .fill, spacing: 20, contentMode: .scaleToFill)
    }()
    
    // MARK: 위치를 알려주는 레이블
    let locationLabel: UILabel = {
        createLabel(font: UIFont.preferredFont(forTextStyle: .largeTitle), textAlignment: .center, numberOfLines: 1, text: "LocationLabel", textColor: .white)
    }()
    
    // MARK: 날씨를 보여주는 이미지뷰
    let weatherImageView: UIImageView = {
        createImage(image: UIImage(systemName: "sun.max.fill")!, renderingMode: .alwaysOriginal, contentMode: .scaleAspectFit)
    }()
    
    // MARK: 위치의 온도를 알려주는 레이블
    let temperatureLabel: UILabel = {
        createLabel(font: UIFont.systemFont(ofSize: 70, weight: .medium), textAlignment: .center, numberOfLines: 0, text: "temp°", textColor: .white)
    }()
    
    // MARK: 좌우에 패딩을 주기 위해, 가로 스택뷰를 담는 뷰
    let horizontalView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    // MARK: 월,화,수,목,금을 담는 가로 스택뷰
    let horizontalStack: UIStackView = {
        createUnitStack(axis: .horizontal, alignment: .fill, distribution: .fillEqually, spacing: 20, contentMode: .scaleToFill)
    }()

    // MARK: 요일별 관련된 내용을 담는 스택뷰
    let mondayVerticalStackInHorizontalStack: UIStackView = {
        createUnitStack(axis: .vertical, alignment: .fill, distribution: .fill, spacing: 0, contentMode: .scaleToFill)
    }()
    
    let tuesdayVerticalStackInHorizontalStack: UIStackView = {
        createUnitStack(axis: .vertical, alignment: .fill, distribution: .fill, spacing: 0, contentMode: .scaleToFill)
    }()
    
    let wednesdayVerticalStackInHorizontalStack: UIStackView = {
        createUnitStack(axis: .vertical, alignment: .fill, distribution: .fill, spacing: 0, contentMode: .scaleToFill)
    }()
    
    let thursdayVerticalStackInHorizontalStack: UIStackView = {
        createUnitStack(axis: .vertical, alignment: .fill, distribution: .fill, spacing: 0, contentMode: .scaleToFill)
    }()
    
    let fridayVerticalStackInHorizontalStack: UIStackView = {
        createUnitStack(axis: .vertical, alignment: .fill, distribution: .fill, spacing: 0, contentMode: .scaleToFill)
    }()
    
    // MARK: 요일별 레이블
    let mondayLabel: UILabel = {
        createLabel(font: UIFont.systemFont(ofSize: 20, weight: .regular), textAlignment: .center, numberOfLines: 1, text: "Mon", textColor: .white)
    }()
    
    let tuesdayLabel: UILabel = {
        createLabel(font: UIFont.systemFont(ofSize: 20, weight: .regular), textAlignment: .center, numberOfLines: 1, text: "Tue", textColor: .white)
    }()
    
    let wednesdayLabel: UILabel = {
        createLabel(font: UIFont.systemFont(ofSize: 20, weight: .regular), textAlignment: .center, numberOfLines: 1, text: "Wed", textColor: .white)
    }()
    
    let thursdayLabel: UILabel = {
        createLabel(font: UIFont.systemFont(ofSize: 20, weight: .regular), textAlignment: .center, numberOfLines: 1, text: "Thu", textColor: .white)
    }()
    
    let fridayLabel: UILabel = {
        createLabel(font: UIFont.systemFont(ofSize: 20, weight: .regular), textAlignment: .center, numberOfLines: 1, text: "Fri", textColor: .white)
    }()
    
    // MARK: 요일별 날씨 이미지뷰
    let mondayImageView: UIImageView = {
        createImage(image: UIImage(systemName: "sun.max.fill")!, renderingMode: .alwaysOriginal, size: CGSize(width: 50, height: 50), contentMode: .scaleAspectFit)
    }()
    
    let tuesdayImageView: UIImageView = {
        createImage(image: UIImage(systemName: "sun.max.fill")!, renderingMode: .alwaysOriginal, size: CGSize(width: 50, height: 50), contentMode: .scaleAspectFit)
    }()
    
    let wednesdayImageView: UIImageView = {
        createImage(image: UIImage(systemName: "sun.max.fill")!, renderingMode: .alwaysOriginal, size: CGSize(width: 50, height: 50), contentMode: .scaleAspectFit)
    }()
    
    let thursdayImageView: UIImageView = {
        createImage(image: UIImage(systemName: "sun.max.fill")!, renderingMode: .alwaysOriginal, size: CGSize(width: 50, height: 50), contentMode: .scaleAspectFit)
    }()
    
    let fridayImageView: UIImageView = {
        createImage(image: UIImage(systemName: "sun.max.fill")!, renderingMode: .alwaysOriginal, size: CGSize(width: 50, height: 50), contentMode: .scaleAspectFit)
    }()
    
    
    // MARK: 요일별 온도 레이블
    let mondayTemperatureLabel: UILabel = {
        createLabel(font: UIFont.systemFont(ofSize: 24, weight: .regular), textAlignment: .center, numberOfLines: 1, text: "27°", textColor: .white)
    }()
    
    let tuesdayTemperatureLabel: UILabel = {
        createLabel(font: UIFont.systemFont(ofSize: 24, weight: .regular), textAlignment: .center, numberOfLines: 1, text: "27°", textColor: .white)
    }()
    
    let wednesdayTemperatureLabel: UILabel = {
        createLabel(font: UIFont.systemFont(ofSize: 24, weight: .regular), textAlignment: .center, numberOfLines: 1, text: "27°", textColor: .white)
    }()
    
    let thursdayTemperatureLabel: UILabel = {
        createLabel(font: UIFont.systemFont(ofSize: 24, weight: .regular), textAlignment: .center, numberOfLines: 1, text: "27°", textColor: .white)
    }()
    
    let fridayTemperatureLabel: UILabel = {
        createLabel(font: UIFont.systemFont(ofSize: 24, weight: .regular), textAlignment: .center, numberOfLines: 1, text: "27°", textColor: .white)
    }()
    
    // MARK: 좌우 패딩을 주기위해 버튼을 담을 뷰
    let changeButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    // MARK: 클릭시 위치 변경하는 버튼
    let changeButton: UIButton = {
        let changeButton = UIButton(configuration: UIButton.Configuration.filled())
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        changeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        changeButton.setTitle("Change City!", for: .normal)
        changeButton.setTitleColor(.systemTeal, for: .normal)
        
        changeButton.tintColor = .white
        changeButton.backgroundColor = .systemTeal
        changeButton.configuration?.cornerStyle = .capsule
        changeButton.addTarget(self, action: #selector(changeWeather), for: .touchUpInside)
        return changeButton
    }()
    
    func randomTemperatureGenerator() -> String {
        return String(Int.random(in: 15..<35)) + "°"
    }
    
    func randomWeatherImageGenerator() -> UIImage {
        let imageName = weathers.randomElement()!
        let image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
        return image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        view.addSubview(verticalStack)
        verticalStackAutoLayout()
        
        verticalStack.addArrangedSubview(locationLabel)
        verticalStack.addArrangedSubview(weatherImageView)
        verticalStack.addArrangedSubview(temperatureLabel)
        verticalStack.addArrangedSubview(horizontalView)
        verticalStack.addArrangedSubview(changeButtonView)
        
        horizontalView.addSubview(horizontalStack)
        changeButtonView.addSubview(changeButton)
 
        horizontalStack.addArrangedSubview(mondayVerticalStackInHorizontalStack)
        horizontalStack.addArrangedSubview(tuesdayVerticalStackInHorizontalStack)
        horizontalStack.addArrangedSubview(wednesdayVerticalStackInHorizontalStack)
        horizontalStack.addArrangedSubview(thursdayVerticalStackInHorizontalStack)
        horizontalStack.addArrangedSubview(fridayVerticalStackInHorizontalStack)
        
        mondayVerticalStackInHorizontalStack.addArrangedSubview(mondayLabel)
        mondayVerticalStackInHorizontalStack.addArrangedSubview(mondayImageView)
        mondayVerticalStackInHorizontalStack.addArrangedSubview(mondayTemperatureLabel)
        
        tuesdayVerticalStackInHorizontalStack.addArrangedSubview(tuesdayLabel)
        tuesdayVerticalStackInHorizontalStack.addArrangedSubview(tuesdayImageView)
        tuesdayVerticalStackInHorizontalStack.addArrangedSubview(tuesdayTemperatureLabel)
        
        wednesdayVerticalStackInHorizontalStack.addArrangedSubview(wednesdayLabel)
        wednesdayVerticalStackInHorizontalStack.addArrangedSubview(wednesdayImageView)
        wednesdayVerticalStackInHorizontalStack.addArrangedSubview(wednesdayTemperatureLabel)
        
        
        thursdayVerticalStackInHorizontalStack.addArrangedSubview(thursdayLabel)
        thursdayVerticalStackInHorizontalStack.addArrangedSubview(thursdayImageView)
        thursdayVerticalStackInHorizontalStack.addArrangedSubview(thursdayTemperatureLabel)
        
        
        fridayVerticalStackInHorizontalStack.addArrangedSubview(fridayLabel)
        fridayVerticalStackInHorizontalStack.addArrangedSubview(fridayImageView)
        fridayVerticalStackInHorizontalStack.addArrangedSubview(fridayTemperatureLabel)
        
        
        labelAutoLayout()
        weatherImageViewAutoLayout()
        temperatureLabelAutoLayout()
        horizontalStackAutoLayout()
        changeButtonAutoLayout()
    }
}

// MARK: layout을 잡아주는 익스텐션
extension ViewController {
    func verticalStackAutoLayout() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            verticalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func labelAutoLayout() {
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: verticalStack.topAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor)
        ])
    }
    
    func weatherImageViewAutoLayout() {
        NSLayoutConstraint.activate([
            weatherImageView.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
            weatherImageView.trailingAnchor.constraint(equalTo: locationLabel.trailingAnchor),
            weatherImageView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    func temperatureLabelAutoLayout() {
        NSLayoutConstraint.activate([
            temperatureLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor)
            
        ])
    }
    
    func horizontalStackAutoLayout() {
        NSLayoutConstraint.activate([
            horizontalStack.centerXAnchor.constraint(equalTo: horizontalView.centerXAnchor),
            horizontalStack.centerYAnchor.constraint(equalTo: horizontalView.centerYAnchor, constant: 20),
            mondayImageView.heightAnchor.constraint(equalToConstant: 50),
            tuesdayImageView.heightAnchor.constraint(equalToConstant: 50),
            wednesdayImageView.heightAnchor.constraint(equalToConstant: 50),
            thursdayImageView.heightAnchor.constraint(equalToConstant: 50),
            fridayImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func changeButtonAutoLayout() {
        NSLayoutConstraint.activate([
            changeButtonView.heightAnchor.constraint(equalToConstant: 220),
            changeButton.leadingAnchor.constraint(equalTo: changeButtonView.leadingAnchor, constant: 20),
            changeButton.centerXAnchor.constraint(equalTo: changeButtonView.centerXAnchor),
            changeButton.centerYAnchor.constraint(equalTo: changeButtonView.centerYAnchor),
            changeButton.heightAnchor.constraint(equalToConstant: 80),
            
        ])
    }
}

extension ViewController {
    @objc func changeWeather() {
        locationLabel.text = locations.randomElement()!
        weatherImageView.image = randomWeatherImageGenerator()
        temperatureLabel.text = randomTemperatureGenerator()
        
        mondayImageView.image = randomWeatherImageGenerator()
        tuesdayImageView.image = randomWeatherImageGenerator()
        wednesdayImageView.image = randomWeatherImageGenerator()
        thursdayImageView.image = randomWeatherImageGenerator()
        fridayImageView.image = randomWeatherImageGenerator()
        
        mondayTemperatureLabel.text = randomTemperatureGenerator()
        tuesdayTemperatureLabel.text = randomTemperatureGenerator()
        wednesdayTemperatureLabel.text = randomTemperatureGenerator()
        thursdayTemperatureLabel.text = randomTemperatureGenerator()
        fridayTemperatureLabel.text = randomTemperatureGenerator()
    }
}
