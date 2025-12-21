class OpmCommon < Formula
  desc "Common utilities for the Open Porous Media (OPM) project"
  homepage "https://github.com/OPM/opm-common"
  url "https://github.com/OPM/opm-common/archive/refs/tags/release/2025.10/final.tar.gz"
  sha256 "adb94a59e73d494cdf3c757171b309d0e19b87e482363ac095a1da2b51263342"
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
  depends_on "trilinos"
  depends_on "python3"
  depends_on "pybind11"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
             "-DWITH_NDEBUG=1",
             "-DCMAKE_BUILD_TYPE=Release",
             "-DPYTHON_EXECUTABLE=#{HOMEBREW_PREFIX}/bin/python3",
             "-DOPM_ENABLE_PYTHON=ON",
             "-DOPM_ENABLE_EMBEDDED_PYTHON=ON"
      system "make", "opmcommon"
      system "make", "install"
    end
  end

end
