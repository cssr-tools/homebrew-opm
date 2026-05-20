class Trilinos < Formula
  desc "Collection of numerical libraries for scientific computing"
  homepage "trilinos.org/"
  url "https://github.com/trilinos/Trilinos",
    using:    :git,
    tag:      "trilinos-release-17-1-0",
    revision: "6eff987504144a20ce3e94346a689306a8230705"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "boost"
  depends_on "open-mpi"
  depends_on "suite-sparse"
  depends_on "zlib"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
             "-DBUILD_SHARED_LIBS=ON",
             "-DTPL_ENABLE_MPI=ON",
             "-DCMAKE_BUILD_TYPE=Release ",
             "-DTrilinos_ENABLE_ALL_PACKAGES=OFF",
             "-DTrilinos_ENABLE_Zoltan=ON"
      system "make", "install"
    end
  end

end
