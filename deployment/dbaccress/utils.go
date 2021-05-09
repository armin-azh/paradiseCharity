package dbaccress

import (
	"../settings"
	"os"
)

const(
	ENVIRONMENT string = "env_variable_access"
	SETTINGS string = "settings_access"
	DB_ENV_ACEESS string = "DATABASE_URL"
	POSTGRES string = "postgres"
)

type DatabaseAccess struct{
	/*
		this type can get type of access to the database
	 */
	url        string
	accessFlag string
}

func (dba *DatabaseAccess) hasEnv()bool{	// check that relative database environment variable access or not
	if os.Getenv(DB_ENV_ACEESS) == ""{
		return false
	}else{}
	return true
}

func (dba *DatabaseAccess) getDatabaseAccess()string{
	/*
		this method provide access url for connect
	 */
	if dba.hasEnv(){
		dba.url = os.Getenv(DB_ENV_ACEESS)
		dba.accessFlag = ENVIRONMENT

		return dba.url
	}else{
		dba.url = settings.GetAccessToPostgresDatabase()
		dba.accessFlag = SETTINGS
		return dba.url
	}
}

func (dba *DatabaseAccess) GetUrl()string{
	/*
		exported method for get url
	 */
	return dba.getDatabaseAccess()
}
