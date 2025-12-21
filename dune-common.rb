class DuneCommon < Formula
  desc "Core module of the DUNE framework"
  homepage "https://gitlab.dune-project.org/core/dune-common"
  url "http://www.dune-project.org/download/2.10.0/dune-common-2.10.0.tar.gz"
  sha256 "94c0dc8ccbb870a17b308368f0cc939f071cc74afb8759f5a90e9cb23aedafdd"
  license "GPL-2.0-or-later"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "doxygen" => :build
  depends_on "suite-sparse"
  depends_on "open-mpi"
  depends_on "metis"

  def install
    mkdir "build-cmake" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

end
