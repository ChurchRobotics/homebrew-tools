# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

cask "watchman" do
  version "v2021.08.23.00"
  sha256 "f5ad03f7cdd6f406bd03d77c8cba3a9578b87cf54c34e72295f9340fe5fe0a60"

  url "https://github.com/facebook/watchman/releases/download/#{version}/watchman-#{version}-macos.zip"
  name "Watchman"
  desc "Watch files and take action when they change"
  homepage "https://facebook.github.io/watchman/"

  binray "watchman-#{version}-macos/bin/watchman"

  postflight do
    set_permissions "/usr/local/var/run/watchman", "2777"
  end

  zap trash: "/usr/local/var/run/watchman"

  caveats <<~EOS
    If you plan to use watchman on more than one user, run `chmod g+s /usr/local/var/run/watchman`.
    We cannot do this for you.  See https://github.com/Homebrew/brew/issues/6019.
  EOS
end
