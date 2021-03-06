Loop, 
{
    Process, Exist, TextPad.exe
    tp_PID = %ErrorLevel%
    if tp_PID = 0
        break
    else
    {
        tp_run_ck++
        if tp_run_ck = 3
        {
            MsgBox, You're not listening, or there is a bug in this code. I'm outta here.
            ExitApp 1
        }
        MsgBox, 1, , It looks like you have TextPad running. You'll need to close out all instances of TextPad before I can continue.
        IfMsgBox, Cancel
            ExitApp 1
    }
}

tp_root = %APPDATA%\Helios\TextPad
latest = 7
oldest = 6
try = %latest%
Loop, 
{
    IfExist, %tp_root%\%try%
    {
        tp_folder = %tp_root%\%try%
        break
    }
    try--
    if (try < oldest)
    {
        ;FIXME - try to get a path from the user.
        MsgBox You lose! No TextPad 6 or 7: you must manually install.
        ExitApp 1
    }
}

tp_config = %tp_folder%\ConfigState.xml
tp_config_bak = %tp_folder%\ConfigState.xml-%A_Now%.bak
tp_config_tmp = newConfigState.xml
config_install = config
src = src

lfp_not_set = 1
dii_not_set = 1
opt_not_set = 1

FileCopy, %tp_config%, %tp_config_bak%, 1
FileDelete, %tp_config_tmp%

Loop
{
    FileReadLine, line, %tp_config%, %A_Index%
    if ErrorLevel
        break
    if in_classes = 1
        while_in_classes(line)
    else 
    {
        ifInString, line, <Document-Classes>
            in_classes = 1
            found_classes = 1
    }
    FileAppend, %line%`n, %tp_config_tmp%
}

if found_classes != 1
{
    MsgBox, Something went wrong. Bailing out without doing anything.
    ExitApp 1
}

Filecopy, %src%\dii.syn, %tp_folder%
Filecopy, %src%\lfp.syn, %tp_folder%
Filecopy, %src%\opt.syn, %tp_folder%
FileCopy, %tp_config_tmp%, %tp_config%, 1

FileDelete, %tp_config_tmp%
;FIXME lousy formatting
MsgBox Installed to %tp_folder%. If this didn't work well, replace %tp_config% with %tp_config_bak%

while_in_classes(line) {
    global in_classes
    global tp_config_tmp
    global dii_not_set
    global lfp_not_set
    global opt_not_set
    ifInString, line, <class name="lfp"
        lfp_not_set = 0
    ifInString, line, <class name="dii"
        dii_not_set = 0
    ifInString, line, <class name="opt"
        opt_not_set = 0

    ifInString, line, </Document-Classes>
    {
        in_classes = 0
        if dii_not_set = 1
            append_class("dii")
        if lfp_not_set = 1
            append_class("lfp")
        if opt_not_set = 1
            append_class("opt")
    }
}

append_class(class) {
    global tp_config_tmp
    global config_install
    FileRead, config, %config_install%\%class%.xml
    FileAppend, %config%, %tp_config_tmp%
}
