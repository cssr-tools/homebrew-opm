class DuneGeometry < Formula
  desc "Geometry module of the DUNE framework"
  homepage "https://gitlab.dune-project.org/core/dune-geometry"
  url "http://www.dune-project.org/download/2.10.0/dune-geometry-2.10.0.tar.gz"
  sha256 "28e98ac930477e0c93e41d0bec74c472e48b9e9f11f16a07befb8791568b7303"
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
