class BurpSuiteFreeEdition < Formula
  desc "provides a platform for security testing of web apps"
  homepage "https://portswigger.net/burp/"
  url "https://portswigger.net/Burp/Releases/Download?productId=100&version=1.7.13&type=Jar", :using => :nounzip
  version "1.7.13"
  sha256 "2f704124384bb8fe81ea6dc2e2a15a97dd349dbcee66d7f6999a8720bc657f3e"

  bottle :unneeded

  depends_on :java => "1.6+"

  def install
    libexec.install "Download"

    mv libexec/"Download", libexec/"burpsuite_free_v#{version}.jar"

    bin.write_jar_script libexec/"burpsuite_free_v#{version}.jar", "burp-suite"
  end

  test do
    system "#{bin}/burp-suite", "--help"
  end
end
