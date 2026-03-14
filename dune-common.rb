class DuneCommon < Formula
  desc "Core module of the DUNE framework"
  homepage "https://www.dune-project.org"
  url "https://gitlab.dune-project.org/core/dune-common",
    using:    :git,
    tag:      "v2.11.0",
    revision: "16498181dbadc34bdaf2f424458aa5201e6a95ce"
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
