# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Kbi < Formula
  desc '"Keyboard" Instruments'
  homepage "https://github.com/MikeWalrus/kbi"
  url "https://github.com/MikeWalrus/kbi/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5479b5144811ce1b2666a9018d79bd71b8eb93683f81b95112427c063a40fffd"
  license "GPL3"
  version "0.1.0"

  depends_on "cmake" => :build
  depends_on "gtkmm4"
  depends_on "portaudio"

  bottle do
    sha256 cellar: :any, big_sur: "612a85f2aa92fcd5b12acfa8f60118b779a12914876e3ab475b21c1f8740634e"
  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"

    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test kbi`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
