package settings

import (
	"strconv"
	"strings"
)

// database settings
const (
	HOST string = "127.0.0.1"
	USER string = "armin_npm"
	PASSWORD string = "12345678"
	DATABASE string = "test_paradise"
	PORT int = 5432
	SSL string = "disable"
)

func GetAccessToPostgresDatabase()string{
	/*
		this function provide access formatted string for Postgres database access
	 */
	cogSet := []string{strings.Join([]string{"host",HOST},"="),
		strings.Join([]string{"port",strconv.Itoa(PORT)},"="),
		strings.Join([]string{"user",USER},"="),
		strings.Join([]string{"dbname",DATABASE},"="),
		strings.Join([]string{"sslmode",SSL},"="),
		strings.Join([]string{"password",PASSWORD},"=")}
	return strings.Join(cogSet," ")
}

