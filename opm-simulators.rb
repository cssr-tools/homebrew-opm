class OpmSimulators < Formula
  desc "Reservoir simulation suite of the Open Porous Media (OPM) project"
  homepage "https://github.com/OPM/opm-simulators"
  url "https://github.com/OPM/opm-simulators/archive/refs/tags/release/2025.10/final.tar.gz"
  sha256 "b64fcd186a82ca0c73ed16219b4d0eea187f0b19f30abaf479a2ab953c55d1bd"
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
  depends_on "opm-grid"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
             "-DWITH_NDEBUG=1",
             "-DCMAKE_BUILD_TYPE=Release",
             "-DPYTHON_EXECUTABLE=#{HOMEBREW_PREFIX}/bin/python3",
             "-DOPM_ENABLE_PYTHON=ON",
             "-DOPM_ENABLE_EMBEDDED_PYTHON=ON"
      system "make", "flow"
      system "make", "install"
    end
  end

end
