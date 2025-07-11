class UpYnabSync < Formula
  desc "Sync transactions from Up Banking to YNAB with smart categorization"
  homepage "https://github.com/swiftdevstuff/UpYNABSync"
  url "https://github.com/swiftdevstuff/UpYNABSync/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0b5ff000cd441a81493cf535584baa8435e70db08efe11e3d6bd679342f3a63a"
  license "MIT"
  head "https://github.com/swiftdevstuff/UpYNABSync.git", branch: "main"

  # Requirements
  depends_on :macos
  depends_on xcode: ["14.0", :build]

  def install
    # Build the Swift package
    system "swift", "build", "-c", "release", "--disable-sandbox"
    
    # Install the binary
    bin.install ".build/release/up-ynab-sync"
    
    # Install documentation
    doc.install "README.md"
    doc.install "CHANGELOG.md"
    
    # Install license
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS
      UpYNABSync has been installed successfully!
      
      To get started:
        1. Set up your API tokens:
           up-ynab-sync auth
        
        2. Configure account mappings:
           up-ynab-sync config
        
        3. Perform your first sync:
           up-ynab-sync sync
        
        4. Set up automatic syncing (optional):
           up-ynab-sync install
      
      For help: up-ynab-sync --help
      Documentation: https://github.com/swiftdevstuff/UpYNABSync
    EOS
  end

  test do
    # Test that the binary was installed and works
    assert_match "1.1.0", shell_output("#{bin}/up-ynab-sync --version")
    
    # Test help command works
    assert_match "Sync transactions from Up Banking to YNAB", 
                 shell_output("#{bin}/up-ynab-sync --help")
  end
end
