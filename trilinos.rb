class Trilinos < Formula
  desc "Collection of numerical libraries for scientific computing"
  homepage "https://github.com/trilinos/Trilinos"
  url "https://github.com/trilinos/Trilinos/archive/refs/tags/16.2.0.tar.gz"
  sha256 "a5dd61e7752b6c0c53e89495aa68e099a5f68b6b775fff49e324c3b177174488"
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
