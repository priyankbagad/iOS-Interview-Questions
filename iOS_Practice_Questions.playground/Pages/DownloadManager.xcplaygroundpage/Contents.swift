//Priority
enum Priority : Comparable {
    case high
    case medium
    case low
}

//Status Model

enum Status {
    case active
    case cancelled
    case paused
    case completed
}

//Class Download

class Download {
    
    let url : String
    let priority : Priority
    var status : Status = .active
    
    init(url: String, priority: Priority) {
        self.url = url
        self.priority = priority
    }
    
}

class DownloadManager {
    
    var downloads : [String : Download] = [:]
    
    func addDownloads(url: String, priority: Priority) {
        downloads[url] = Download(url: url, priority: priority)
    }
    
    func pauseDownload(url: String) {
        guard let download = downloads[url] else { return }
        download.status = .paused
    }
    
    func resumeDownload(url: String){
        guard let download = downloads[url] else {return}
        download.status = .active
    }
    
    func cancelDownload(url: String) {
        guard let download = downloads[url] else {return}
        download.status = .cancelled
    }
    
    func getActiveDownloads() -> [Download] {
        return downloads.values.filter { $0.status == .active }.sorted(by : { $0.priority < $1.priority})
    }
    
}

let manager = DownloadManager()

// Test 1 - Add downloads
manager.addDownloads(url: "https://file1.zip", priority: .high)
manager.addDownloads(url: "https://file2.zip", priority: .low)
manager.addDownloads(url: "https://file3.zip", priority: .medium)

// Test 2 - Get active downloads
// What should this return?
print(manager.getActiveDownloads().map { $0.url })

// Test 3 - Pause a download
manager.pauseDownload(url: "https://file1.zip")
// What should getActiveDownloads return now?
print(manager.getActiveDownloads().map { $0.url })

// Test 4 - Resume a download
manager.resumeDownload(url: "https://file1.zip")
// What should getActiveDownloads return now?
print(manager.getActiveDownloads().map { $0.url })

// Test 5 - Cancel a download
manager.cancelDownload(url: "https://file2.zip")
// What should getActiveDownloads return now?
print(manager.getActiveDownloads().map { $0.url })



