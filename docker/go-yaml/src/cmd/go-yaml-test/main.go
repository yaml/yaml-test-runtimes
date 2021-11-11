package main

import (
	"fmt"
	"os"
	"io/ioutil"

	"gopkg.in/yaml.v3"
)

func main() {
	data, _ := ioutil.ReadAll(os.Stdin)

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
