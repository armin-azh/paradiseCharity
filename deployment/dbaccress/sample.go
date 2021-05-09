package dbaccress

func GetImageModel()*Model{
	/*
		return an instantiate Image model
	 */
	url:="./sqlCode/image.sql"
	model:=new(Model)
	model.Set(url,"Image")
	return model
}

func GetPersonModel()*Model{
	/*
		return an instantiate Person model
	 */
	url:="./sqlCode/person.sql"
	model:=new(Model)
	model.Set(url,"Person")
	return model
}

func GetEventModel()*Model{
	/*
		return an instantiate Event model
	 */
	url:="./sqlCode/event.sql"
	model:=new(Model)
	model.Set(url,"Event")
	return model
}

func GetOrderModel()*Model{
	/*
		return an instantiate Order model
	 */
	url:="./sqlCode/order.sql"
	model:=new(Model)
	model.Set(url,"Order")
	return model
}

func GetPaymentModel()*Model{
	/*
		return an instantiate Payment model
	 */
	url:="./sqlCode/payment.sql"
	model:=new(Model)
	model.Set(url,"Payment")
	return model
}


func GetDonationModel()*Model{
	/*
		return an instantiate Donation model
	 */
	url:="./sqlCode/donation.sql"
	model:=new(Model)
	model.Set(url,"Donation")
	return model
}
