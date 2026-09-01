class Resinsight < Formula
  desc "3D viewer and post processing of reservoir models"
  homepage "https://resinsight.org"
  url "https://github.com/OPM/ResInsight",
    using:    :git,
    tag:      "v2026.09.0",
    revision: "197d58a750dd0bc243025b3939ab2a8a01a2c709"
  license "GPL-3.0-or-later"
  depends_on "pkg-config" => :build
  depends_on "cmake" => :build
  depends_on "apache-arrow"
  depends_on "fast_float"
  depends_on "nanoflann"
  depends_on "type-lite"
  depends_on "clipper2"
  depends_on "pugixml"
  depends_on "spdlog"
  depends_on "libomp"
  depends_on "boost"
  depends_on "eigen"
  depends_on "fmt"
  depends_on "qt"

  def install
    ENV["CC"] = "/usr/bin/clang"
    ENV["CXX"] = "/usr/bin/clang++"
    items = Dir[".[!.]*"] + Dir["*"]
    tmp = buildpath/"tmp"
    mkdir tmp
    FileUtils.mv(items, tmp)
    system "git", "-C", tmp, "submodule", "update", "--init", "--recursive"
    system "cmake", "-S", tmp, *std_cmake_args,
       "-DRESINSIGHT_USE_OPENMP=0",
       "-DRESINSIGHT_ENABLE_OPENVDS=0",
       "-DHOMEBREW_ALLOW_FETCHCONTENT=1",
       "-DCMAKE_POLICY_VERSION_MINIMUM=3.10",
       "-DCMAKE_DISABLE_FIND_PACKAGE_OpenMP=1"

    system "make"
    prefix.install "ResInsight.app"
    bin.write_exec_script "#{prefix}/ResInsight.app/Contents/MacOS/resinsight"
    Dir["Thirdparty/Ert/lib/*.dylib"].each do |dylib|
      lib.install dylib
    end
    lib.install "ThirdParty/Ert/lib/"
    system "install_name_tool", "-add_rpath", "#{lib}", "#{prefix}/ResInsight.app/Contents/MacOS/ResInsight"
    system "install_name_tool", "-change", "@rpath/libresdata.2.dylib", "#{lib}/libresdata.2.dylib", "#{prefix}/ResInsight.app/Contents/MacOS/ResInsight"
  end

end
