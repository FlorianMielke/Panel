<p align="center">
    <img src="Logo.png" width="400" max-width="90%" alt="Panel" />
</p>

<p align="center">
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <a href="https://twitter.com/florianmielke">
        <img src="https://img.shields.io/badge/twitter-@florianmielke-blue.svg?style=flat" alt="Twitter: @florianmielke" />
    </a>
</p>

Panel is a SwiftUI implementation of the known Maps Panel on iOS.

## Usage

First define a state property for the panel anchor.

```swift
@State private var panelAnchor = PanelAnchor.medium
```

## Installation

Panel is distributed using the [Swift Package Manager](https://swift.org/package-manager). To install it into a project, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/florianmielke/panel.git", from: "0.0.2")
    ],
    ...
)
```

Then import Panel wherever you’d like to use it:

```swift
import Panel
```

For more information on how to use the Swift Package Manager, check out [its official documentation](https://swift.org/package-manager).


## Acknowledgements

This library is inspired by the awesome work of. 


## Contributions and support

This project does not come with GitHub Issues-based support, and users are instead encouraged to become active participants in its continued development — by fixing any bugs that they encounter, or by improving the documentation wherever it’s found to be lacking.

If you wish to make a change, [open a Pull Request](https://github.com/FlorianMielke/Panel/pull/new) — even if it just contains a draft of the changes you’re planning, or a test that reproduces an issue — and we can discuss it further from there.

—Florian
