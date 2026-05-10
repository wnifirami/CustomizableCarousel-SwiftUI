enum CarouselMath {
    static func nextIndex(from currentIndex: Int, count: Int, loopsInfinitely: Bool) -> Int {
        guard count > 0 else { return 0 }
        if loopsInfinitely { return (currentIndex + 1) % count }
        return min(currentIndex + 1, count - 1)
    }

    static func previousIndex(from currentIndex: Int, count: Int, loopsInfinitely: Bool) -> Int {
        guard count > 0 else { return 0 }
        if loopsInfinitely { return (currentIndex - 1 + count) % count }
        return max(currentIndex - 1, 0)
    }
}
