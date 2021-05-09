package logging

import(
	"github.com/fatih/color"
	"log"
)

type Logger struct {
	message string
	level string
}

func (lg *Logger) Init(message string,level string){
	lg.message=message
	lg.level=level
}

func (lg *Logger)Println(){
	switch lg.level {

	case DEBUG:
		color.Set(color.FgBlue)
		defer color.Unset()
		log.Println(lg.message)
	case DABG:
		color.Set(color.FgRed)
		defer color.Unset()
		log.Println(lg.message)
	case WARN:
		color.Set(color.FgHiYellow)
		defer color.Unset()
		log.Println(lg.message)
	case WARNING:
		color.Set(color.FgYellow)
		defer color.Unset()
		log.Println(lg.message)
	case INFO:
		color.Set(color.FgHiBlue)
		defer color.Unset()
		log.Println(lg.message)
	case SUCCESS:
		color.Set(color.FgGreen)
		defer color.Unset()
		log.Println(lg.message)
	default:
		log.Println(lg.message)
	}
}
