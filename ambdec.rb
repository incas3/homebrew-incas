require 'formula'

class Ambdec < Formula
  homepage 'http://kokkinizita.linuxaudio.org/linuxaudio/index.html'
  url 'http://kokkinizita.linuxaudio.org/linuxaudio/downloads/ambdec-0.5.1.tar.bz2'
  sha1 'e0a925c76d2a46bb5b2838e249ee7a86638b335a'

  depends_on 'clthreads'
	depends_on 'clxclient'

  def install
		
		inreplace 'source/Makefile', '/usr/local', "#{prefix}"
		
		system "cd source"
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
    # were more thorough. Run the test with `brew test ambdec`.
    system "false"
  end
end

__END__
diff --git a/source/Makefile b/source/Makefile
index 36f7898..22af5d5 100644
--- a/source/Makefile
+++ b/source/Makefile
@@ -36,7 +36,7 @@ AMBDEC_O = ambdec.o styles.o mainwin.o confwin.o radbut.o filewin.o \
            png2img.o meter.o
 
 ambdec:	CPPFLAGS += -I/usr/X11R6/include `freetype-config --cflags`
-ambdec:	LDLIBS += -lclxclient -lclthreads -ljack -lpng -lXft -lX11 -lrt
+ambdec:	LDLIBS += -lclxclient -lclthreads -ljack -lpng -lXft -lX11
 ambdec:	LDFLAGS += -L/usr/X11R6/lib
 ambdec:	$(AMBDEC_O)
 	g++ $(LDFLAGS) -o $@ $(AMBDEC_O) $(LDLIBS)
@@ -48,7 +48,7 @@ $(AMBDEC_O):
 
 AMBDEC_CLI_O = ambdec_cli.o jclient.o nffilt.o xover2.o decoder.o adconf.o sstring.o
 
-ambdec_cli:	LDLIBS += -lclthreads -ljack -lrt
+ambdec_cli:	LDLIBS += -lclthreads -ljack
 ambdec_cli:	$(AMBDEC_CLI_O)
 	g++ $(LDFLAGS) -o $@ $(AMBDEC_CLI_O) $(LDLIBS)
 
