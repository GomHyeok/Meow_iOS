// swift-tools-version: 5.9
@preconcurrency import PackageDescription

#if TUIST
//패키지 내부 모듈의 product xkdlq qusrud
@preconcurrency import ProjectDescription

let packageSetting = PackageSettings(
    productTypes : [
        "Alamofire" : .framework
    ]
)
#endif

let package = Package(
    name : "Meow",
    dependencies : [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.4")
    ]
)
