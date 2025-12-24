class Resinsight < Formula
  desc "3D viewer and post processing of reservoir models"
  homepage "https://resinsight.org"
  url "https://github.com/OPM/ResInsight.git",
    using:    :git,
    tag:      "v2025.12.0",
    revision: "57430b5c6b1099d82e722e12ff087469a8d10d65"
  license "GPL-3.0-or-later"
  depends_on "pkg-config" => :build
  depends_on "cmake" => :build
  depends_on "apache-arrow"
  depends_on "boost@1.85"
  depends_on "fast_float"
  depends_on "llvm@20"
  depends_on "spdlog"
  depends_on "libomp"
  depends_on "fmt"
  depends_on "qt"

  def install
    boost = Formula["boost@1.85"]
    libomp = Formula["libomp"]
    llvm = Formula["llvm@20"]
    fmt = Formula["fmt"]
    src = buildpath/"src"
    build = buildpath/"build"
    formula_dir = Pathname.new(__FILE__).dirname
    ENV.prepend_path "PATH", llvm.opt_bin
    items = Dir[".[!.]*"] + Dir["*"]
    mkdir src
    FileUtils.mv(items, src)

    system "git", "-C", src, "submodule", "update", "--init", "--recursive"
    system "find", "src/ThirdParty/custom-opm-common", "-type", "f", "(", "-name", "*.cpp", "-o", "-name", "*.hpp", ")", "-exec", "sed", "-i", "",
           "s|#include <fmt/|#include <#{fmt.include}/fmt/|g", "{}", "+"
    inreplace "src/ThirdParty/regression-analysis/src/Utils.cpp", "#include <Eigen/Dense>", "#include <Eigen/Dense>\n#include <assert.h>"
    system "git", "-C", src/"ThirdParty/openzgy/open-zgy", "apply", "#{formula_dir}/open-zgy.patch"
    system "git", "-C", src, "apply", "#{formula_dir}/resinsight.patch"
    system "cmake", "-S", buildpath/"src", "-B", buildpath/"build", *std_cmake_args,
           "-DRESINSIGHT_USE_OPENMP=0",
           "-DRESINSIGHT_ENABLE_OPENVDS=0",
           "-DHOMEBREW_ALLOW_FETCHCONTENT=1",
           "-DCMAKE_POLICY_VERSION_MINIMUM=3.10",
           "-DCMAKE_DISABLE_FIND_PACKAGE_OpenMP=1",
           "-DCMAKE_PREFIX_PATH='#{boost.include}'",
           "-DCMAKE_EXE_LINKER_FLAGS='-L#{libomp.lib} -lomp'",
           "-DCMAKE_SHARED_LINKER_FLAGS='-L#{libomp.lib} -lomp'",
           "-DCMAKE_CXX_FLAGS='-Xpreprocessor -fopenmp -I#{libomp.include} -DUSE_OPENMP'"
    system "cmake", "--build", build
    prefix.install build/"ResInsight.app"
    bin.write_exec_script "#{prefix}/ResInsight.app/Contents/MacOS/resinsight"
    Dir["build/Thirdparty/Ert/lib/*.dylib"].each do |dylib|
      lib.install dylib
    end
    lib.install "build/ThirdParty/Ert/lib/"
    system "install_name_tool", "-add_rpath", "#{lib}", "#{prefix}/ResInsight.app/Contents/MacOS/ResInsight"
    system "install_name_tool", "-change", "@rpath/libresdata.2.dylib", "#{lib}/libresdata.2.dylib", "#{prefix}/ResInsight.app/Contents/MacOS/ResInsight"
  end

end
