class Apg < Formula
  desc "Tool set for random password generation"
  homepage "http://www.adel.nursat.kz/apg/"
  url "https://github.com/sv99/apg/archive/v2.2.3.tar.gz"
  sha256 "202cfe80cb9b1902407dedfe1ba53d1c0673affa3d001a69db66c23fc84797cd"

  def install
    system "make", "standalone",
                   "CC=#{ENV.cc}",
                   "FLAGS=#{ENV.cflags}",
                   "LIBS=", "LIBM="

    bin.install "apg", "apgbfm"
    man1.install "doc/man/apg.1", "doc/man/apgbfm.1"
  end

  test do
    system bin/"apg", "-a", "1", "-M", "n", "-n", "3", "-m", "8", "-E", "23456789"
  end
end
