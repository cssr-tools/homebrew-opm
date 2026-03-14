class DuneIstl < Formula
  desc "Iterative Solver Template Library (ISTL) module of the DUNE framework"
  homepage "https://www.dune-project.org"
  url "https://gitlab.dune-project.org/core/dune-istl",
    using:    :git,
    tag:      "v2.11.0",
    revision: "2e4db0b47b7adae3b824d36709b947b867e730a6"
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
