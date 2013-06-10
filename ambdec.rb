require 'formula'

class Ambdec < Formula
  homepage 'http://kokkinizita.linuxaudio.org/linuxaudio/index.html'
  url 'http://kokkinizita.linuxaudio.org/linuxaudio/downloads/ambdec-0.5.1.tar.bz2'
  sha1 'e0a925c76d2a46bb5b2838e249ee7a86638b335a'

  depends_on 'clthreads'
	depends_in 'clxclient'

  def install
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test ambdec`.
    system "false"
  end
end
