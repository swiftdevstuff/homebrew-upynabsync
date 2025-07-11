class UpYnabSync < Formula
  desc "Sync Up Banking transactions to YNAB"
  homepage "https://github.com/swiftdevstuff/UpYNABSync"
  url "https://github.com/swiftdevstuff/UpYNABSync/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "dae3ed60df7ec2b0d40efe0c736a4638d5fde6fc550cddd5f36a25c80fb16eac"
  license "MIT"
  version "1.1.1"

  depends_on :macos
  depends_on xcode: ["12.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/up-ynab-sync"
  end

  test do
    system "#{bin}/up-ynab-sync", "--help"
  end
end
