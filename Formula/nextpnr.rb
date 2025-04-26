class Nextpnr < Formula
  desc "Portable FPGA place and route tool"
  homepage "https://github.com/YosysHQ/nextpnr"
  url "https://github.com/YosysHQ/nextpnr.git", tag: "nextpnr-0.8"
  license "ISC"
  head "https://github.com/YosysHQ/nextpnr.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "Apycula"
  depends_on "boost"
  depends_on "eigen"
  depends_on "python@3.13"

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    ENV.append_path "PYTHONPATH", Formula["Apycula"].opt_libexec/Language::Python.site_packages("python3.13")
    system "cmake", "-S", ".",
                    "-B", "build",
                    "-G", "Ninja",
                    "-DARCH=himbaechel",
                    "-DHIMBAECHEL_UARCH=gowin",
                    *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test nextpnr`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
