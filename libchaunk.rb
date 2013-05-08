require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Libchaunk < Formula
  homepage 'http://redmine.incas3.nl/projects/libchaunk'
  url 'http://redmine.incas3.nl/attachments/download/544/libchaunk-1-0-0.0.1.tar.gz'
  sha1 'd0256f25a883c159ad84930ecc4affd46697ba31'

  head 'git@git.incas3.nl:softwarelibraries/loggingplatform/incas3-cochlea/libchaunk.git',  :using => :git

  depends_on 'swig' => :build
	depends_on 'automake' => :build
	depends_on 'libtool' => :build
	depends_on 'octave' => :build

  def install
    # ENV.j1  # if your formula's build system can't parallelize
		system "./autogen.sh || true"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
		system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test libchaunk`.
    system "false"
  end
end
