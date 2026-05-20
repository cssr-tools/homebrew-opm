class OpmCommon < Formula
  desc "Common utilities for the Open Porous Media (OPM) project"
  homepage "https://opm-project.org"
  url "https://github.com/OPM/opm-common",
    using:    :git,
    tag:      "release/2026.04/final",
    revision: "0ea62974f24d70fc2b3e30d6aae8b76ef000dac1"
  license "GPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "boost"
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
