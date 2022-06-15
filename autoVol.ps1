param(
  [Parameter(
    HelpMessage="Name of memory file (with extension)."
  )]
  [Alias('help')]
  [string]$filename,
  [switch]$h,
  [int]$p
  
  )


$text = @"

     **               **            **      **           **
    ****             /**           /**     /**          /**
   **//**   **   ** ******  ****** /**     /**  ******  /**
  **  //** /**  /**///**/  **////**//**    **  **////** /**
 **********/**  /**  /**  /**   /** //**  **  /**   /** /**
/**//////**/**  /**  /**  /**   /**  //****   /**   /** /**
/**     /**//******  //** //******    //**    //******  ***
//      //  //////    //   //////      //      //////  /// 


 .:::.   .:::.        d88b    d888b   .d8b.  d8888b. d8888b. d8888b  d8888b. .d8888. 
:::::::.:::::::       '8P'   88' Y8b d8' '8b 88  '8D 88  '8D 88'     88  '8D 88'  YP 
:::::::::::::::        88    88      88ooo88 88   88 88   88 88ooooo 88oobY' `8bo.   
':::::::::::::'        88    88  ooo 88~~~88 88   88 88   88 88~~~~~ 88`8b     `Y8b. 
  ':::::::::'      db. 88    88. ~8~ 88   88 88  .8D 88  .8D 88.     88 `88. db   8D 
    ':::::'        Y8888P     Y888P  YP   YP Y8888D' Y8888D' Y88888P 88   YD `8888Y' 
      ':'
                                                     
                                                                                       
"@
Write-Host "$text"

##### Help Screen Message #####
if($h){
  Write-Host "*INSERT HELP SCREEN HERE*"
  exit
}


$filepath = -join(".\PlaceMemFilesHere\", $filename)
$volPath = "..\vol.py"
if($p){
  $outFolderName = -join((Get-Item $filepath ).Basename, (Get-Date -Format "ddMMyyHHmm"),"PID$p")
}else{
  $outFolderName = -join((Get-Item $filepath ).Basename, (Get-Date -Format "ddMMyyHHmm"))
}
$outFolderLoc = -join(".\output\", $outFolderName)
mkdir $outFolderLoc -ea 0


if(-Not (Test-Path -Path $filepath -PathType Leaf)) {
    Write-Host "File does not exist. Exiting..."
    exit
}


if($p){
  $outFolderName = -join((Get-Item $filepath ).Basename, (Get-Date -Format "ddMMyyHHmm"),"PID$p")
  Write-Host "Now running output for Process ID $p"

  Write-Host "Now Running imageinfo"
  cmd.exe /c "python $volPath -f $filepath windows.info > $outFolderLoc\imageinfo.txt"

  Write-Host "Now Running handles"
  cmd.exe /c "python $volPath -f $filepath windows.handles.Handles --pid $p > $outFolderLoc\handles.txt"

  Write-Host "Now Running dlllist"
  cmd.exe /c "python $volPath -f $filepath windows.dlllist --pid $p > $outFolderLoc\dlllist.txt"

  Write-Host "Now Running envars"
  cmd.exe /c "python $volPath -f $filepath windows.envars.Envars --pid $p > $outFolderLoc\envars.txt"

  Write-Host "Now Running privileges"
  cmd.exe /c "python $volPath -f $filepath windows.privileges.Privs --pid $p > $outFolderLoc\privs.txt"

    Write-Host "Now Running cmdline"
  cmd.exe /c "python $volPath -f $filepath windows.cmdline.CmdLine --pid $p > $outFolderLoc\cmdline.txt"

}else{
  $outFolderName = -join((Get-Item $filepath ).Basename, (Get-Date -Format "ddMMyyHHmm"))
  Write-Host "Now Running general volatility scan \n"

  Write-Host "Now Running imageinfo"
  cmd.exe /c "python $volPath -f $filepath windows.info > $outFolderLoc\imageinfo.txt"

  Write-Host "Now Running pstree"
  cmd.exe /c "python $volPath -f $filepath windows.pstree.PsTree > $outFolderLoc\pstree.txt"

  Write-Host "Now Running pslist"
  cmd.exe /c "python $volPath -f $filepath windows.pslist.PsList > $outFolderLoc\pslist.txt"

  Write-Host "Now Running Psscan"
  cmd.exe /c "python $volPath -f $filepath windows.psscan.PsScan > $outFolderLoc\psscan.txt"

  Write-Host "Now Running dlllist"
  cmd.exe /c "python $volPath -f $filepath windows.dlllist.DllList > $outFolderLoc\dlllist.txt" 

  Write-Host "Now Running cmdline"
  cmd.exe /c "python $volPath -f $filepath windows.cmdline.CmdLine > $outFolderLoc\cmdline.txt"

  Write-Host "Now Running netscan"
  cmd.exe /c "python $volPath -f $filepath  windows.netscan > $outFolderLoc\netscan.txt"

  Write-Host "Now Running filescan"
  cmd.exe /c "python $volPath -f $filepath windows.filescan > $outFolderLoc\filescan.txt"

  Write-Host "Now Running malfind"
  cmd.exe /c "python $volPath -f $filepath  windows.malfind.Malfind > $outFolderLoc\malfind.txt"

  Write-Host "Now Running driverirp"
  cmd.exe /c "python $volPath -f $filepath windows.driverirp > $outFolderLoc\driverirp.txt"

  Write-Host "Now Running ssdt"
  cmd.exe /c "python $volPath -f $filepath windows.ssdt.SSDT > $outFolderLoc\ssdt.txt"

  Write-Host "Now Running mutants"
  cmd.exe /c "python $volPath -f $filepath windows.mutantscan > $outFolderLoc\mutexes.txt"

  Write-Host "Now Running sessions"
  cmd.exe /c "python $volPath -f $filepath windows.sessions > $outFolderLoc\sessions.txt"

  Write-Host "Now Running getsids"
  cmd.exe /c "python $volPath -f $filepath windows.getsids > $outFolderLoc\getsids.txt"

  Write-Host "Now Running privileges"
  cmd.exe /c "python $volPath -f $filepath windows.privileges.Privs > $outFolderLoc\privs.txt"

  Write-Host "Now Running hivelist"
  cmd.exe /c "python $volPath -f $filepath windows.registry.hivelist.HiveList > $outFolderLoc\hivelist.txt"

  Write-Host "Now Running handles"
  cmd.exe /c "python $volPath -f $filepath windows.handles.Handles > $outFolderLoc\handles.txt"
}

Write-Host "Complete. Output Folder Location:'$outFolderLoc'" 
