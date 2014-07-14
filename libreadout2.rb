require 'formula'

class Libreadout2 < Formula
  homepage 'http://redmine.incas3.nl/projects/scintillator-readout-chains/ensa/libreadout2'
  head 'ssh://git@git.incas3.nl/scintillator-readout-chains/ensa/libreadout2.git', :using => :git

  # depends_on 'cmake' => :build

  def install
    system "autoreconf -i"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end