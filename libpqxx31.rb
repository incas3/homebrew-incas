require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Libpqxx31 < Formula
  homepage 'http://pqxx.org/development/libpqxx/'
  url 'http://pqxx.org/download/software/libpqxx/libpqxx-3.1.1.tar.gz'
  sha1 'b8942164495310894cab39e5882c42f092570fc5'

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make"
    ENV.j1  # if your formula's build system can't parallelize
    system "make install" # if this fails, try separate make/make install steps
  end

end
