require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Tetraproc < Formula
  homepage 'http://kokkinizita.linuxaudio.org/linuxaudio/index.html'
  url 'git://git.debian.org/git/pkg-multimedia/tetraproc.git'
  sha1 ''
	version '0.8.2'
  # depends_on 'cmake' => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'clthreads'
	depends_on 'clxclient'

  def install
		inreplace 'source/Makefile', '/usr/local', "#{prefix}"

    system "cd source; make"
		system "cd source; make install" # if this fails, try separate make/make install steps
  end

  def patches
    DATA
  end
	
  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test tetraproc`.
    system "false"
  end
end


__END__
diff --git a/source/Makefile b/source/Makefile
index 5ab418d..019ba58 100644
--- a/source/Makefile
+++ b/source/Makefile
@@ -36,7 +36,7 @@ hpfilt.o pmfilt.o textmat.o confwin.o abconfig.o abprocess.o oscform.o impdata.o
 kmeterdsp.o png2img.o
 
 tetraproc:	CPPFLAGS += -I/usr/X11R6/include `freetype-config --cflags`
-tetraproc:	LDLIBS += -lsndfile -lfftw3f -lclxclient -lclthreads -ljack -lpng -lXft -lX11 -lrt 
+tetraproc:	LDLIBS += -lsndfile -lfftw3f -lclxclient -lclthreads -ljack -lpng -lXft -lX11
 tetraproc:	LDFLAGS += -L/usr/X11R6/lib
 tetraproc:	$(TETRAPROC_O)
 	g++ $(LDFLAGS) -o $@ $(TETRAPROC_O) $(LDLIBS)
@@ -48,7 +48,7 @@ $(TETRAPROC_O):
 TETRAFILE_O = tetrafile.o convol44.o hpfilt.o pmfilt.o abconfig.o abprocess.o oscform.o \
 impdata.o audiofile.o dither.o
 
-tetrafile:	LDLIBS += -lsndfile -lfftw3f -lrt 
+tetrafile:	LDLIBS += -lsndfile -lfftw3f
 tetrafile:	$(TETRAFILE_O)
 	g++ $(LDFLAGS) -o $@ $(TETRAFILE_O) $(LDLIBS)
 
