class DuneGrid < Formula
  desc "Grid module of the DUNE framework"
  homepage "https://gitlab.dune-project.org/core/dune-grid"
  url "http://www.dune-project.org/download/2.10.0/dune-grid-2.10.0.tar.gz"
  sha256 "2feb7c16d75048a80c570773431c587f6d14a4f9fabf7f1ad0a3fbacc7330056"
  license "GPL-2.0-or-later"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "suite-sparse"
  depends_on "open-mpi"
  depends_on "metis"
  depends_on "dune-common"
  depends_on "dune-geometry"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

end
