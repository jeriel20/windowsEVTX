# windowsEVTX
CONVERT ARCHIVED EVTX WINDOWS EVENT LOG FILES TO CSV
USE LOGSTASH TO READ THE CSV FILES AND OUTPUT TO ELASTICSEARCH

This Repo contains:
  ----Windows Binary for LogParser2.2
  ----Windows Binary for 7z
  ----Logstash Configuration File for Windows Security Event Logs (Reading from CSV File)
  ----Batch Script to take a TAR.GZ and ZIP files and uncompress them
  ---Powershell Script to convert EVTX to CSV using LogParser2.2

---------I typed descriptions in each script to explain them---------  


INSTRUCTIONS:-----
-----1) Download the Repo
-----2) Install LogParser and 7z
-----3) Add 7z binary path to the environmental variable path for Windows
-----4) Place untar.bat in the directory for your Compressed Logs
-----5) Run the PowerShell Script to convert EVTX to CSV
-----6) INSTALL Logstash and Use the Logstash configuration file in this repo to output all the CSVs to Elasticsearch

-------------------BE ADVISED ---------------- Ensure to modify the Logstash Config file to fit your environment and Elasticsearch Cluster


JERIEL JUARBE
NOVEMBER 2016

