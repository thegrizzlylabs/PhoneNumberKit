// swift-tools-version: 5.4
import PackageDescription

let package = Package(
    name: "PhoneNumberKit",
    platforms: [
        .iOS(.v12), .macOS(.v10_13), .tvOS(.v12), .watchOS(.v4)
    ],
    products: [
        .library(name: "PhoneNumberKit", targets: ["GSKPhoneNumberKit"]),
        .library(name: "PhoneNumberKit-Static", type: .static, targets: ["GSKPhoneNumberKit"]),
        .library(name: "PhoneNumberKit-Dynamic", type: .dynamic, targets: ["GSKPhoneNumberKit"])
    ],
    targets: [
        .target(name: "GSKPhoneNumberKit",
                path: "PhoneNumberKit",
                exclude: ["Resources/Original",
                          "Resources/README.md",
                          "Resources/update_metadata.sh",
                          "Info.plist"],
                resources: [
                    .process("Resources/PhoneNumberMetadata.json"),
                    .copy("Resources/PrivacyInfo.xcprivacy")
                ]),
        .testTarget(name: "PhoneNumberKitTests",
                    dependencies: ["PhoneNumberKit"],
                    path: "PhoneNumberKitTests",
                    exclude: ["Info.plist"])
    ]
)
