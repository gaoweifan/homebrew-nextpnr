class Apycula < Formula
  include Language::Python::Virtualenv

  desc "Bitstream documentation for Gowin FPGAs"
  homepage "https://github.com/YosysHQ/apicula"
  url "https://files.pythonhosted.org/packages/2e/40/ffe1f18c548e2598ffb419352ca691b236d0fe6613e4ec1db858926192b4/Apycula-0.18.tar.gz"
  sha256 "9d46979f1e3114d1f9c0a6516855edd2e2c080b9b9fdd4d22a189942848bf298"
  license "MIT"
  head "https://github.com/YosysHQ/apicula.git", branch: "master"

  depends_on "python@3.13"

  resource "crc" do
    url "https://files.pythonhosted.org/packages/7e/e6/c3488c35ecae290751466252e5ea01ef50fc67bfc1a9aba43983329b7025/crc-7.1.0.tar.gz"
    sha256 "99dd540909a37ae4f62c65441df8ecb4e7f9af014fecaf4f331052a41d66c07d"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test Apycula`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
