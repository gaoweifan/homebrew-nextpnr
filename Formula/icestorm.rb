class Icestorm < Formula
  desc "Lattice iCE40 FPGAs Bitstream Documentation (Reverse Engineered)"
  homepage "https://github.com/YosysHQ/icestorm"
  license "ISC"
  head "https://github.com/YosysHQ/icestorm.git"

  depends_on "make" => :build

  def install
    system "make", "-j#{Hardware::CPU.cores}"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system bin/"icepll"
  end
end
