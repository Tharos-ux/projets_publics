pushd "%2"

:ffmpeg
    for /R %%A in (*.mp4, *.avi, *.mov, *.wmv, *.ts, *.m2ts, *.mkv, *.mts) do (
        echo Processing "%%A"
		:: -b:a xxxk > donne le débit de la pise audio 
		:: -map 0:a:x > sélectionne la piste x en piste active
        ffmpeg -i "%%A" -b:a 384k -map 0:a:0 "%%A_MAIN.flac" -b:a 384k -map 0:a:1? "%%A_MIC.flac" -b:a 384k -map 0:a:2? "%%A_DSC.flac" -b:a 384k -map 0:a:3? "%%A_MUS.flac"
        echo Processed %%A	
    )
	pause
GOTO :EOF