# Nushell Config File
#
# version = "0.104.1"

source ~/.config/nushell/theme.nu

$env.config.buffer_editor = 'nvim'

$env.config.shell_integration.osc133 = false

$env.config.show_banner = false

$env.APPTAINER_CACHEDIR = '/home/xuanwu/.apptainer/cache/'

$env.SINGULARITY_TMPDIR = '/home/xuanwu/temp'

$env.APPTAINER_TMPDIR = '/home/xuanwu/temp'

$env.TOPIARY_CONFIG_FILE = ($env.HOME | path join .config topiary languages.ncl)

$env.TOPIARY_LANGUAGE_DIR = ($env.HOME | path join .config topiary languages)

alias ll = ls -la

alias ty2local = rsync -arvm --delete --include="*/" --include="*.py" --include="*.log" --include="*.sh" --exclude="*" tycluster:/work/home/xuanwu/usr/ ~/cluster/

alias wz2local = rsync -arvm --delete --include="*/" --include="*.py" --include="*.log" --include="*.sh" --exclude="*" wzcluster:/work/home/xuanwu/usr/ ~/cluster/

alias hf2local = rsync -arvm --delete --include="*/" --include="*.py" --include="*.log" --include="*.sh" --exclude="*" hfcluster:/public/home/xuanwu/usr/ ~/cluster/

def local2cluster [] {

  print "sync to HF cluster"

  rsync -arvm --delete --include="*/" --include="*.py" --include="*.sh" --exclude="*" ~/cluster/ hfcluster:/public/home/xuanwu/usr/

  print "sync to TY cluster"

  rsync -arvm --delete --include="*/" --include="*.py" --include="*.sh" --exclude="*" ~/cluster/ tycluster:/work/home/xuanwu/usr/

  print "sync to WZ cluster"

  rsync -arvm --delete --include="*/" --include="*.py" --include="*.sh" --exclude="*" ~/cluster/ wzcluster:/work/home/xuanwu/usr/
}

alias sync_file = nu ~/scripts/sync_file/sync_files.nu

alias clean_file = nu ~/scripts/clean_file/clean_files.nu

alias bd_sglt_envs = nu ~/scripts/build_singularity_image/bd_sglt_envs.nu

alias bd_sglt_images = nu ~/scripts/build_singularity_image/bd_sglt_images.nu

alias tsf_sglt_images = nu ~/scripts/build_singularity_image/tsf_sglt_images.nu

alias tsf_clst_key = nu ~/scripts/transfer_cluster_key/tsf_clst_key.nu

def test_fatido [] {

  cd ~/Code_Program/test/

  sudo singularity run ~/Code_Program/smilei_fatido/smilei_fatido_compiled.sif smilei ./input.py

  sudo singularity run ~/Code_Program/fatido/fatido mpirun -n 4 ./input_fatido.py
}

def test_smilei [] {

  cd ~/Code_Program/test/

  sudo singularity run ~/Code_Program/smilei_fatido/smilei_fatido ./input.py

  cp ~/Code_Program/test/Fields0.h5 ~/win_downloads/Fields0.h5

  cp ~/Code_Program/test/Fields1.h5 ~/win_downloads/Fields1.h5
}

def test_warpx [] {

  cd ~/Code_Program/test/

  sudo singularity run ~/Code_Program/warpx_3d/warpx_3d ./input_warpx
}

def transmit_Thomson_Scattering_Noise [eshell] {

  if $eshell == "ty" {

    for i in 1..9 {

      let src_w = $"tyeshell_xuanwu:~/usr/smilei_tasks/Thomson_Scattering_Noise/sim_($i)/w_laser/FarFieldRadiation0.h5"

      let dst_w = $"/mnt/d/PPT/Group_Meeting/组会 吴玄 251205/data/sim_($i)_w_laser.h5"

      let src_wo = $"tyeshell_xuanwu:~/usr/smilei_tasks/Thomson_Scattering_Noise/sim_($i)/wo_laser/FarFieldRadiation0.h5"

      let dst_wo = $"/mnt/d/PPT/Group_Meeting/组会 吴玄 251205/data/sim_($i)_wo_laser.h5"

      scp $src_w $dst_w

      scp $src_wo $dst_wo
    }
  } else if $eshell == "hf" {

    for i in 1..9 {

      let src_w = $"hfeshell_xuanwu:~/usr/smilei_tasks/Thomson_Scattering_Noise/sim_($i)/w_laser/FarFieldRadiation0.h5"

      let dst_w = $"/mnt/d/PPT/Group_Meeting/组会 吴玄 251205/data/sim_($i)_w_laser.h5"

      let src_wo = $"hfeshell_xuanwu:~/usr/smilei_tasks/Thomson_Scattering_Noise/sim_($i)/wo_laser/FarFieldRadiation0.h5"

      let dst_wo = $"/mnt/d/PPT/Group_Meeting/组会 吴玄 251205/data/sim_($i)_wo_laser.h5"

      scp $src_w $dst_w

      scp $src_wo $dst_wo
    }
  }
}

def tonushell [] {

  cd ~/.config/nushell

  nvim
}

def tonvim [] {

  cd ~/.config/nvim

  nvim
}

def push2github [] {

  cd ~/dot_files/

  git push

  cd ~/scripts/

  git push

  cd ~/singularity_def_files/

  git push

  cd ~/Code_Program/smilei_fatido/

  git push
}

def yayup [] {

  yay -Syu --noconfirm --verbose
}

cd /home/xuanwu
