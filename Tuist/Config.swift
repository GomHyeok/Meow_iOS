@preconcurrency import ProjectDescription

let config = Config(
    plugins : [ //tuist에서 사용할 플로그인 목록, 빌드전 처리, 관리, 분석에 사용
        //플로그인 = 프로젝트를 자동, 확장하는데 사용하는 스크립트
        //local의 경우 path 사용
        //원경의 경우 .git(url : "", tag : "")사용
        .local(path: .relativeToRoot("Plugins/DependencyPlugin")),
        .local(path: .relativeToRoot("Plugins/ConfigurationPlugin")),
    ]
)
