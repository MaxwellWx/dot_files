# Nushell Config File
#
# version = "0.104.1"
$env.config.color_config = {
  separator: white
  leading_trailing_space_bg: {attr: n}
  header: green_bold
  empty: blue
  bool: light_cyan
  int: white
  filesize: cyan
  duration: white
  datetime: purple
  range: white
  float: white
  string: white
  nothing: white
  binary: white
  cell-path: white
  row_index: green_bold
  record: white
  list: white
  closure: green_bold
  glob: cyan_bold
  block: white
  hints: dark_gray
  search_result: {bg: red fg: white}
  shape_binary: purple_bold
  shape_block: blue_bold
  shape_bool: light_cyan
  shape_closure: green_bold
  shape_custom: green
  shape_datetime: cyan_bold
  shape_directory: cyan
  shape_external: cyan
  shape_externalarg: green_bold
  shape_external_resolved: light_yellow_bold
  shape_filepath: cyan
  shape_flag: blue_bold
  shape_float: purple_bold
  shape_glob_interpolation: cyan_bold
  shape_globpattern: cyan_bold
  shape_int: purple_bold
  shape_internalcall: cyan_bold
  shape_keyword: cyan_bold
  shape_list: cyan_bold
  shape_literal: blue
  shape_match_pattern: green
  shape_matching_brackets: {attr: u}
  shape_nothing: light_cyan
  shape_operator: yellow
  shape_pipe: purple_bold
  shape_range: yellow_bold
  shape_record: cyan_bold
  shape_redirection: purple_bold
  shape_signature: green_bold
  shape_string: green
  shape_string_interpolation: cyan_bold
  shape_table: blue_bold
  shape_variable: purple
  shape_vardecl: purple
  shape_raw_string: light_purple
  shape_garbage: {
    fg: white
    bg: red
    attr: b
  }
}

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
  print "sync to TY cluster"
  rsync -arvm --delete --include="*/" --include="*.py" --include="*.sh" --exclude="*" ~/cluster/ tycluster:/work/home/xuanwu/usr/

  print "sync to WZ cluster"
  rsync -arvm --delete --include="*/" --include="*.py" --include="*.sh" --exclude="*" ~/cluster/ wzcluster:/work/home/xuanwu/usr/

  print "sync to HF cluster"
  rsync -arvm --delete --include="*/" --include="*.py" --include="*.sh" --exclude="*" ~/cluster/ hfcluster:/public/home/xuanwu/usr/
}

alias sync_file = nu ~/scripts/sync_file/sync_files.nu

alias clean_file = nu ~/scripts/clean_file/clean_files.nu

alias bd_sglt_envs = nu ~/scripts/build_singularity_image/bd_sglt_images.nu

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
  cd ~/.config/nvim/
  git push
  cd ~/.config/nushell/
  git push
  cd ~/Code_Program/smilei_fatido/
  git push
  cd ~/Code_Program/smilei_fatido/Smilei_FaTiDo/
  git push
  cd /mnt/c/Users/15371/.config/wezterm/
  git push
}

def yayup [] {
  yay -Syu --noconfirm --verbose
}

cd /home/xuanwu
