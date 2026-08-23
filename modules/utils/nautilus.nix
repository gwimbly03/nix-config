{ pkgs, ... }:
{
  services.gvfs.enable = true;            
  services.udisks2.enable = true;         

  environment.systemPackages = with pkgs; [
    nautilus
    nautilus-open-any-terminal   
    sushi                        
    ffmpegthumbnailer
  ];
}
