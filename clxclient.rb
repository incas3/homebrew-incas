require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Clxclient < Formula
  homepage 'http://http://kokkinizita.linuxaudio.org/linuxaudio/'
  url 'http://kokkinizita.linuxaudio.org/linuxaudio/downloads/clxclient-3.6.1.tar.bz2'
  sha1 'eb4669459be696082adfb5ed7ed6061150fbd802'

  depends_on "clthreads"
  depends_on :x11

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    inreplace 'Makefile-osx', '/usr/local', "#{prefix}"

    system "make -f Makefile-osx" # if this fails, try separate make/make install steps
    system "make -f Makefile-osx install"
  end

  def patches
    DATA
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test clxclient`.
    system "false"
  end
end

__END__
--- a/Makefile-osx	2013-05-07 11:48:19.000000000 +0200
+++ b/Makefile-osx	2013-05-07 11:37:37.000000000 +0200
@@ -19,7 +19,7 @@
 # Modify as required.
 #
 PREFIX = /usr/local
-SUFFIX := $(shell uname -m | sed -e 's/^unknown/$//' -e 's/^i.86/$//' -e 's/^x86_64/$/64/')
+#SUFFIX := $(shell uname -m | sed -e 's/^unknown/$//' -e 's/^i.86/$//' -e 's/^x86_64/$/64/')
 LIBDIR = lib$(SUFFIX)


@@ -29,8 +29,8 @@
 DISTDIR = clxclient-$(VERSION)


-CPPFLAGS += -Wall -I. -I/usr/X11R6/include `freetype-config --cflags` -dynamic -DVERSION=\"$(VERSION)\" -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -O2
-LDFLAGS += -L$(PREFIX)/$(LIBDIR) -L/usr/X11R6/$(LIBDIR) `freetype-config --libs`
+CPPFLAGS += -Wall -I. -I/opt/X11/include `freetype-config --cflags` -dynamic -DVERSION=\"$(VERSION)\" -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -O2
+LDFLAGS += -L$(PREFIX)/$(LIBDIR) -L/opt/X11/$(LIBDIR) `freetype-config --libs`
 LDLIBS +=
