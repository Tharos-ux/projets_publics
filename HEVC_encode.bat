::Supprime le path
@echo off
::Informations utilisateur
pushd "%2"
echo ---------------------------------
echo Convertisseur ffmpeg HEVC h.265
echo Necessite un GPU Nvidia 10series ou superieur
echo Conserve le multipiste audio
echo ---------------------------------
echo Entrez le facteur de compression
echo 22 est un sans perte visuel
echo Un chiffre plus eleve correspond a une qualite plus basse mais a une meilleure compression
echo Un chiffre inferieur correspond a une meilleure qualite mais a une compression plus faible
echo Par defaut, saisissiez 22
echo ---------------------------------
::Variables
SET /p ffmpeg_qv="Entrez le ffmpeg_qv : "
::Code
:ffmpeg
    for /R %%A in (*.mp4, *.avi, *.mov, *.wmv, *.ts, *.m2ts, *.mkv, *.mts) do (
        echo Processing "%%A"
        ffmpeg -hwaccel auto -i "%%A" -pix_fmt p010le -map 0:v -map 0:a -map_metadata 0 -c:v hevc_nvenc -rc constqp -qp %ffmpeg_qv% -b:v 0K -c:a aac -b:a 384k -movflags +faststart "%%A_hevc_QV%ffmpeg_qv%.mp4"

        echo Processed %%A
    )
	pause
GOTO :EOF