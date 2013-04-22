require 'formula'

class Libsensorpacket < Formula
  homepage 'http://redmine.incas3.nl/projects/universal-logger'
  head 'git@git.incas3.nl:softwarelibraries/loggingplatform/libsensorpacket.git'

  # depends_on 'cmake' => :build

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake", ".", *std_cmake_args
    system "make install"
  end
  def patches
    # fixes something small
    DATA
  end
end

__END__
diff --git a/BigSPOT/libsensorpacket-2.0/src/Makefile.am b/BigSPOT/libsensorpacket-2.0/src/Makefile.am
index 2dfb050..1994392 100644
--- a/BigSPOT/libsensorpacket-2.0/src/Makefile.am
+++ b/BigSPOT/libsensorpacket-2.0/src/Makefile.am
@@ -4,7 +4,7 @@ lib_LTLIBRARIES=libsensorpacket-@LIBSENSORPACKET_API_VERSION@.la
 libsensorpacket_@LIBSENSORPACKET_API_VERSION@_la_SOURCES=SensorPacket.cpp SensorPacketCommunicator.cpp
 libsensorpacket_@LIBSENSORPACKET_API_VERSION@_la_CPPFLAGS=$(BOOST_CPPFLAGS) $(PTHREAD_CFLAGS)
 libsensorpacket_@LIBSENSORPACKET_API_VERSION@_la_LDFLAGS = -version-info $(LIBSENSORPACKET_SO_VERSION) $(BOOST_SYSTEM_LDFLAGS)
-libsensorpacket_@LIBSENSORPACKET_API_VERSION@_la_LIBADD=$(BOOST_SYSTEM_LIBS) $(PTHREAD_LIBS) -lboost_system
+libsensorpacket_@LIBSENSORPACKET_API_VERSION@_la_LIBADD=$(BOOST_SYSTEM_LIBS) $(PTHREAD_LIBS)
 libsensorpacket_@LIBSENSORPACKET_API_VERSION@_la_includedir = $(includedir)/libsensorpacket-@LIBSENSORPACKET_API_VERSION@/
 libsensorpacket_@LIBSENSORPACKET_API_VERSION@_la_include_HEADERS = $(top_srcdir)/include/libsensorpacket-@LIBSENSORPACKET_API_VERSION@/SensorPacket.h $(top_srcdir)/include/libsensorpacket-@LIBSENSORPACKET_API_VERSION@/SensorPacketException.h $(top_srcdir)/include/libsensorpacket-@LIBSENSORPACKET_API_VERSION@/SensorPacketPrivate.h $(top_srcdir)/include/libsensorpacket-@LIBSENSORPACKET_API_VERSION@/SensorPacketCommunicatorPrivate.h
 
@@ -18,12 +18,12 @@ testSensorpacket_@LIBSENSORPACKET_API_VERSION@_SOURCES=main.cpp
 testSensorpacket_@LIBSENSORPACKET_API_VERSION@_CPPFLAGS=$(PTHREAD_CFLAGS)
 # for some reason -lpthread does not get included in _LIBS variable... 
 # the program needs boost_system when including boost asio headers (and headers only, no code yet)
-testSensorpacket_@LIBSENSORPACKET_API_VERSION@_LDFLAGS=$(BOOST_SYSTEM_LDFLAGS) $(PTHREAD_LIBS) -lpthread -lboost_system
+testSensorpacket_@LIBSENSORPACKET_API_VERSION@_LDFLAGS=$(BOOST_SYSTEM_LDFLAGS) $(PTHREAD_LIBS) -lpthread
 testSensorpacket_@LIBSENSORPACKET_API_VERSION@_LDADD=$(BOOST_SYSTEM_LIBS) libsensorpacket-@LIBSENSORPACKET_API_VERSION@.la
 
 irc_logger_@LIBSENSORPACKET_API_VERSION@_SOURCES=irc_logger.cpp
 irc_logger_@LIBSENSORPACKET_API_VERSION@_CPPFLAGS=$(PTHREAD_CFLAGS)
-irc_logger_@LIBSENSORPACKET_API_VERSION@_LDFLAGS=$(PTHREAD_LIBS) -lpthread -lboost_system -lircclient -largtable2
+irc_logger_@LIBSENSORPACKET_API_VERSION@_LDFLAGS=$(PTHREAD_LIBS) -lpthread -lircclient -largtable2
 irc_logger_@LIBSENSORPACKET_API_VERSION@_LDADD=libsensorpacket-@LIBSENSORPACKET_API_VERSION@.la

