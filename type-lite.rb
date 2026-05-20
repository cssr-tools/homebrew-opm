class TypeLite < Formula
  desc "Strong types for C++98, C++11 and later (header-only)"
  homepage "https://github.com/nonstd-lite/type-lite"
  url "https://github.com/nonstd-lite/type-lite",
    using:    :git,
    tag:      "v0.2.0",
    revision: "edce3fb26f53ef9b2f8a35b8825d10c5f5e8443f"
  license "BSL-1.0"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

end
