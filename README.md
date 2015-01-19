### Overview 
Image for static sites in nginx

##### Environment variables
SERVICE_NAME - name of service running in container
CONFIG_FOLDER - folder with files which will be parsed for search & replace

APP_* - all occurences of ##APP_*## will be replaced in all files in CONFIG_FOLDER (where '*' is a wildcard)

