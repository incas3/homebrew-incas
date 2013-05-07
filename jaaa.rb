require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Jaaa < Formula
  homepage 'http://http://kokkinizita.linuxaudio.org/linuxaudio/'
  url 'http://kokkinizita.linuxaudio.org/linuxaudio/downloads/jaaa-0.6.0.tar.bz2'
  sha1 '94c82b3cbe4c9862af23c791ba48410ea8367a32'

  depends_on 'clxclient'
  depends_on 'clthreads'

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    inreplace 'Makefile-osx', '/usr/local', "#{prefix}"

#    system "make" # if this fails, try separate make/make install steps
    system "make install"
  end

  def patches
    DATA
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test jaaa`.
    system "false"
  end
end


__END__
--- jaaa-0.6.0/Makefile	2010-03-10 15:41:39.000000000 +0100
+++ jaaa-0.6.0-osx/Makefile	2012-10-05 13:23:33.000000000 +0200
@@ -25,10 +25,10 @@
 VERSION = 0.6.0
 DISTDIR = jaaa-$(VERSION)
 CPPFLAGS += -O2 -Wall -MMD -MP -DVERSION=\"$(VERSION)\" -DPREFIX=\"$(PREFIX)\" -I/usr/include/freetype2
-CPPFLAGS += -march=native
+CPPFLAGS += -march=native -I/opt/X11/include -I/opt/X11/include/freetype2/ -I/opt/local/include/ -I/usr/local/include

-LDFLAGS += -L$(PREFIX)/$(LIBDIR) -L/usr/X11R6/$(LIBDIR)
-LDLIBS += -lclalsadrv -lclthreads -lclxclient -lpthread -lfftw3f -ljack -lasound -lpthread -lXft -lX11 -lrt
+LDFLAGS += -L$(PREFIX)/$(LIBDIR) -L/usr/X11R6/$(LIBDIR) -L/opt/local/lib
+LDLIBS += -lclthreads -lclxclient -lpthread -lfftw3f -ljack -lpthread -lXft -lX11


 JAAA_O = jaaa.o styles.o spectwin.o audio.o rngen.o
@@ -40,7 +40,7 @@


 install:	jaaa
-	install -Dm 755 jaaa $(DESTDIR)$(PREFIX)/bin/jaaa
+	install -m 755 jaaa $(DESTDIR)$(PREFIX)/bin/jaaa

 clean:
 	/bin/rm -f *~ *.o *.a *.d *.so jaaa
diff -ru jaaa-0.6.0/audio.cc jaaa-0.6.0-osx/audio.cc
--- jaaa-0.6.0/audio.cc	2010-03-11 21:59:42.000000000 +0100
+++ jaaa-0.6.0-osx/audio.cc	2012-10-05 13:22:29.000000000 +0200
@@ -22,6 +22,7 @@
 #include <math.h>
 #include "audio.h"
 #include "messages.h"
+#include <string.h>


 Audio::Audio (ITC_ctrl *cmain, const char *name) :
@@ -70,6 +71,7 @@
 void Audio::init_alsa (const char *playdev, const char *captdev,
                        int fsamp, int fsize, int nfrags, int ncapt, int nplay)
 {
+/*
     _run_alsa = true;
     _alsa_handle = new Alsa_driver (playdev, captdev, 0, fsamp, fsize, nfrags);
     if (_alsa_handle->stat () < 0)
@@ -98,15 +100,17 @@
             exit (1);
 	}
     }
+*/
 }


 void Audio::close_alsa ()
 {
+/*
 //    fprintf (stderr, "Closing ALSA...\n");
     _run_alsa = false;
     get_event (1 << EV_EXIT);
-    delete _alsa_handle;
+    delete _alsa_handle;*/
 }


@@ -114,7 +118,7 @@
 {
     unsigned long b, k, m, n;
     int  i;
-
+/*
     _alsa_handle->pcm_start ();

     while (_run_alsa)
@@ -170,6 +174,7 @@
     }

     _alsa_handle->pcm_stop ();
+*/
     put_event (EV_EXIT);
 }

Only in jaaa-0.6.0-osx: audio.d
diff -ru jaaa-0.6.0/audio.h jaaa-0.6.0-osx/audio.h
--- jaaa-0.6.0/audio.h	2010-03-11 21:59:03.000000000 +0100
+++ jaaa-0.6.0-osx/audio.h	2012-10-05 13:20:38.000000000 +0200
@@ -21,9 +21,9 @@

 #include <stdlib.h>
 #include <math.h>
-#include <alsa/asoundlib.h>
+//#include <alsa/asoundlib.h>
 #include <clthreads.h>
-#include <clalsadrv.h>
+//#include <clalsadrv.h>
 #include <jack/jack.h>
 #include "rngen.h"

@@ -56,7 +56,7 @@
     ITC_ctrl       *_cmain;

     volatile bool   _run_alsa;
-    Alsa_driver    *_alsa_handle;
+//    Alsa_driver    *_alsa_handle;

     volatile bool   _run_jack;
     jack_client_t  *_jack_handle;
