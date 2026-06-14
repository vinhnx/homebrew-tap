class Vtcode < Formula
  desc "A Rust-based terminal coding agent with modular architecture supporting multiple LLM providers"
  homepage "https://github.com/vinhnx/vtcode"
  version "0.131.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vinhnx/VTCode/releases/download/0.131.0/vtcode-0.131.0-aarch64-apple-darwin.tar.gz"
      sha256 "401e2d61183d0041ffe8795078df49b556df7a78408fbda1e5bb676d16cc5c94"
    else
      url "https://github.com/vinhnx/VTCode/releases/download/0.131.0/vtcode-0.131.0-x86_64-apple-darwin.tar.gz"
      sha256 "a79c8d46bc25e99320ffbb515e5a743c24aa3f510cb9adc798207ff807e41384"
    end
  end

  def install
    bin.install "vtcode"
  end

  test do
    system "#{bin}/vtcode", "--version"
  end
end
