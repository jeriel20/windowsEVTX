#####################################
####	Jeriel Juarbe Script	#####
####	20161101		#####
####	EVTX Conversions to CSV	#####
####	USING LOGPARSER.EXE	#####
#####################################
#-=--=-=--=-=--=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-																	#
#	This script can be ran from anywhere on the Filesystem 
#	You must have LogParser2.2 installed
#	You may need to run the following command to allow PS1 to run
#								
#			C:\>	Set-Execution-Policy Unrestricted																	#
#-=--=-=--=-=--=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#Input from User#
$folder_location = read-host "Please enter the full path of the file locations - IE: C:\Users\"
$dest_location = read-host "Please enter the full path of destination directiory to dump the files - IE: C:\Users\Admin\Desktop\"
$logparser_location = read-host "Please enter the full path of LogParser.exe - IE: C:\Users\Admin\Desktop\LogParser\LogParser.exe"

#Definining Variables for the loops below
$ext = "*.evtx"
$src_location = $folder_location + $ext
$CMD = $logparser_location
$arg1 = 'SELECT * INTO'
$arg3 = '-i:EVT'
$arg4 = '-o:CSV'
$arg5 = 'FROM'
$quoteDouble = '"'
$quoteSingle = "'"

#Array is required to store the name of all the files that will be converted
$files_array = @()
$out_files_array = @()

write-host "STANDBY while the conversion is completed........OUTPUT to STDOUT to follow...."

#This date command below is to keep track of how long it took to convert the EVTX files to CSV
date

#This Foreach loop gets all the file names in the directiory specified and stores their names in an ARRAY for future use#
$a = Get-Item $src_location
foreach ($file in $a) {
	$files_array += $file.Fullname
	$out_files_array += $dest_location + $file.BaseName + ".csv"
}


# This While loop - while $i  is less that the length of the Array (from above) 
# creates 2 new arrays ($in_log) and ($out_log) that contains the String values for output destination of CSV and Input location of EVTX
# Then runs the logparser.exe with switches 
# 
$i = 0
while ($i -lt $files_array.length) {

	$in_log = $files_array[$i]
	$out_log = $out_files_array[$i]

	& $CMD $quoteDouble$arg1 $quoteSingle$out_log$quoteSingle $arg5 $quoteSingle$in_log$quoteSingle$quoteDouble $arg3 $arg4
	$i += 1
}

#This date commande below is to keep track of how long it took to convert the EVTX files to CSV
date	
