let
  rootgin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINSzPSW/Olc9kDiCyEyGE7lAEmR3ml/V57oUfTapON/v rootgin@Laptop";
  users = [ rootgin ];
in
{
  "weatherAPI.age".publicKeys = users;
  "playit-secret.age".publicKeys = users;
}
