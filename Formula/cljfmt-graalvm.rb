class CljfmtGraalvm < Formula

  desc "A Clojure code formatter using cljfmt built with graalvm."
  homepage "https://gitlab.com/konrad.mrozek/cljfmt-graalvm/"
  version "0.6.0"

  url "https://gitlab.com/konrad.mrozek/cljfmt-graalvm/-/archive/0.6.0/cljfmt-graalvm-0.6.0.zip"
  sha256 "ff15d4b3803c79edac1f57f936170de88f2c30bb0add00017bb174a8168eed02"

  bottle :unneeded

  def caveats
    <<~EOS
      This formula can only be built on macOS, you need the graal binaries and
      paths set up correctly before installing, for example:

        export JAVA_HOME=~/Downloads/graalvm-1.0.0-rc1/Contents/Home
        export PATH=$PATH:~/Downloads/graalvm-1.0.0-rc1/Contents/Home/bin
    EOS
  end

  def install
    system "lein", "uberjar"
    system "native-image", "-jar", "target/cljfmt-graalvm-0.1.0-SNAPSHOT-standalone.jar" "-H:Name=\"cljfmt\""

    bin.install "cljfmt"
  end

end
