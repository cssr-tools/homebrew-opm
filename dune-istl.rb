class DuneIstl < Formula
  desc "Iterative Solver Template Library (ISTL) module of DUNE"
  homepage "https://gitlab.dune-project.org/core/dune-istl"
  url "http://www.dune-project.org/download/2.10.0/dune-istl-2.10.0.tar.gz"
  sha256 "6c39e9fcf97fcd54c158e61d0b67a7422f9fc528540262df58f71d24672e6966"
  license "GPL-2.0-or-later"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "suite-sparse"
  depends_on "open-mpi"
  depends_on "metis"
  depends_on "dune-common"
  depends_on "dune-geometry"
  depends_on "dune-grid"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

end
