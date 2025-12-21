class OpmGrid < Formula
  desc "Grid handling module of the Open Porous Media (OPM) project"
  homepage "https://github.com/OPM/opm-grid"
  url "https://github.com/OPM/opm-grid/archive/refs/tags/release/2025.10/final.tar.gz"
  sha256 "2c45180351df688d27326d1532cab391e2c61054a877d9c9de1ea8eff61ea526"
  license "GPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "boost@1.85"
  depends_on "suite-sparse"
  depends_on "open-mpi"
  depends_on "metis"
  depends_on "openblas"
  depends_on "cjson"
  depends_on "dune-common"
  depends_on "dune-geometry"
  depends_on "dune-grid"
  depends_on "dune-istl"
  depends_on "pybind11"
  depends_on "opm-common"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
             "-DWITH_NDEBUG=1",
             "-DCMAKE_BUILD_TYPE=Release",
             "-DPYTHON_EXECUTABLE=#{HOMEBREW_PREFIX}/bin/python3",
             "-DOPM_ENABLE_PYTHON=ON",
             "-DOPM_ENABLE_EMBEDDED_PYTHON=ON"
      system "make", "opmgrid"
      system "make", "install"
    end
  end

end
