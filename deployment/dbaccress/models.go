package dbaccress

import (
	"../logging"
	"io/ioutil"
)

type Model struct{
	/*
		Model model
	 */
	statement string
	sqlPath string
	name string
}

func (im *Model) Set (path string,name string){
	/*
		set sql query to the model
	 */
	im.sqlPath = path
	im.name = name
	logger := logging.Logger{}
	query, err := ioutil.ReadFile(im.sqlPath)

	if err != nil{
		logger.Init(im.name+" SQL query couldn't import",logging.DABG)
		logger.Println()
	}

	im.statement = string(query)
	logger.Init(im.name+" SQL query file added successfully",logging.SUCCESS)
}

func (im *Model) Get () string {
	return im.statement
}

