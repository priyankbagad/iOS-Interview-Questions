import Foundation

class LRUCache {

    var cache : [Int : Int] = [:]
    var recentTrack : [Int] = []
    var capacity : Int

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        if let cached = cache[key] {
            recentTrack.removeAll{$0 == key}
            recentTrack.append(key)
            return cached
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        if let cached = cache[key]{
            cache[key] = value
            recentTrack.removeAll{$0 == key}
            recentTrack.append(key)
        } else {
            if cache.count >= capacity {
                let recent = recentTrack.removeFirst()
                cache.removeValue(forKey: recent)
            }
            cache[key] = value
            recentTrack.append(key)
        }
    }
}

let lru = LRUCache(2)
lru.put(1, 10)
lru.put(2, 20)
print(lru.get(1))    // should print 10
lru.put(3, 30)
print(lru.get(2))    // should print -1 (evicted)
print(lru.get(3))    // should print 30
