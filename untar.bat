REM #########################################
REM ####	LT Milbank Script		        	#####
REM ####	20161101					            #####
REM ####	Jeriel Juarbe{				        #####
REM ####	Unpack TAR.GZ &				        #####
REM ####	Unzip all ZIP's				        #####
REM ####	USING 7z} 					          #####
REM #########################################
REM #-=--=-=--=-=--=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=--=--=--=-=--=-=-==-#
REM #																									                                                  #
REM #	This script is designed to be ran from the directory where your (filename.tar.gz) files reside	  #
REM #	You must have 7z installed on your system													                              	#
REM #	You must add the binary path for 7z to the windows Enviromental variable Path			            		#
REM #	**IF you only have ZIP'd Files then comment out the first FOR loop.							                	#
REM #-=--=-=--=-=--=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=--=-=-=-=-=-=-=-=--=#
@Echo Off
mkdir tmp

REM this for loop takes all .GZ files in the current directory and uncompresses them
REM Then the TAR Files are PIPED to another 7z commnand that uncompresses the TARs into the TMP Directory you created
FOR /F "usebackq" %%a in (`DIR /s /b *.gz`) do 7z x %%a -r -so | 7z x -si -ttar -o"TMP"

REM This FOR loop unzips all the files in the TMP directory you created 
FOR /F "usebackq" %%a in (`DIR /s /b *.zip`) do 7z x %%a -o"TMP"

mkdir EVTX

REM This FOR loop movesa all the uncompresses .evtx files to the EVTX you created
FOR /F "usebackq" %%a in (`DIR /s /b *.evtx`) do move %%a EVTX

REM this below Removes the TMP folder to clean up the mess
rmdir /S /Q tmp
