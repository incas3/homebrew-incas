require 'formula'

class Aubio < Formula
  homepage 'http://aubio.org/'
  url 'http://aubio.org/pub/aubio-0.3.2.tar.gz'
  sha1 '8ef7ccbf18a4fa6db712a9192acafc9c8d080978'
  head 'git://git.aubio.org/git/aubio/'

  depends_on 'pkg-config' => :build
  depends_on 'fftw' => :recommended
  depends_on 'libsndfile' => :optional
  depends_on 'libsamplerate' => :optional
  depends_on 'jack' => :optional
  depends_on 'swig' => :optional

  def install
    if build.head?
      system "./waf configure"
      system "./waf"
      system "./waf install"
    else
      system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
      system "make"
      ENV.j1
      system "make install"
    end
  end
end
