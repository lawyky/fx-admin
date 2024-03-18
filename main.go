package main

import (
	"github.com/lawyky/fx-admin/cmd"
)

func main() {
	//logFile := "daemon.log"
	////启动一个子进程后主程序退出
	//_, err := xdaemon.Background(logFile, true)
	//if err != nil {
	//	log.Error(err, err.Error())
	//}

	cmd.Execute()
}
