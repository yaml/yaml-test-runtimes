package main

import (
	"fmt"
	"log"
	"os"
	"io/ioutil"

	"gopkg.in/yaml.v3"
)

func main() {

	if len(os.Args) <= 1 {
		log.Fatal("Missing file argument")
	}
	file := os.Args[1]

	data, err := ioutil.ReadFile(file)
	if err != nil {
		log.Fatal("ReadFile() of " + file + " failed: " + err.Error())
	}

	t := yaml.NewTester(data)
	var str *string
	for {
		str = t.NextEvent()
		if str == nil {
			break
		}
		fmt.Printf("%s\n", *str)
	}
}
