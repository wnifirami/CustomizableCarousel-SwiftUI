enum ConfigurationPreset: String, CaseIterable {
    case `default` = "Default"
    case minimal   = "Minimal"
    case hero      = "Hero"
    case compact   = "Compact"
    case autoPlay  = "Auto Play"

    var configuration: CarouselConfiguration {
        switch self {
        case .default:  return .default
        case .minimal:  return .minimal
        case .hero:     return .hero
        case .compact:  return .compact
        case .autoPlay: return .autoPlay
        }
    }
}
