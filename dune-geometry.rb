class DuneGeometry < Formula
  desc "Geometry module of the DUNE framework"
  homepage "https://www.dune-project.org"
  url "https://gitlab.dune-project.org/core/dune-geometry",
    using:    :git,
    tag:      "v2.11.0",
    revision: "7e8ec771779653f7f39962767adf4114e7378d10"
  license "GPL-2.0-or-later"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "suite-sparse"
  depends_on "open-mpi"
  depends_on "metis"
  depends_on "dune-common"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

end
