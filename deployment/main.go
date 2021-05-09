package main

import (
	da "./dbaccress"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)

func main(){
	dbAccess := new(da.DatabaseAccess)
	db,err := gorm.Open(da.POSTGRES,dbAccess.GetUrl())

	if err != nil{
		panic("connection failed")
	}

	defer db.Close()

	models:= []da.Model{
		*(da.GetImageModel()),
		*(da.GetPersonModel()),
		*(da.GetEventModel()),
		*(da.GetDonationModel()),
		*(da.GetOrderModel()),
		*(da.GetPaymentModel()),
	}

	for _,mo:=range models{
		db.Exec(mo.Get())
	}

}