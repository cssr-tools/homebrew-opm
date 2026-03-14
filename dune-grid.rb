class DuneGrid < Formula
  desc "Grid module of the DUNE framework"
  homepage "https://www.dune-project.org"
  url "https://gitlab.dune-project.org/core/dune-grid",
    using:    :git,
    tag:      "v2.11.0",
    revision: "360045cbc742b79b29ec4c583dbe5560eb066ac0"
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
