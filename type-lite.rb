class TypeLite < Formula
  desc "Strong types for C++98, C++11 and later (header-only)"
  homepage "https://github.com/nonstd-lite/type-lite"
  url "https://github.com/nonstd-lite/type-lite/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "47d6f78c3e8588f0a63e86c357d0d9e83543d754334df9dece7a4242047aea37"
  license "BSL-1.0"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

end
