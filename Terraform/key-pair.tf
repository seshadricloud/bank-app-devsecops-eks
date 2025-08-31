# Creating Key Pair

resource "aws_key_pair" "deployer" {
  key_name   = "bankapp-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBsJe6O4+s5nqKXz5oDfzUzf/gX4DIVcWKEb4fSdNNHr madhup@DESKTOP-FR8TKPV"
}