package main

import (
	"flag"
	"fmt"
	"log"
	"math/rand"
	"os"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

type CliOpt struct {
	port int
	name string
	hash string
}

func randImages(count int) []int {

	var num [14]int

	rand.Seed(time.Now().UnixNano())

	for i := 0; i < 14; i++ {
		num[i] = i
	}

	for i := 0; i < len(num); i++ {
		tmp := num[i]
		p := rand.Intn(len(num))
		num[i] = num[p]
		num[p] = tmp
	}

	return num[0:count]
}

func parseCommandLine() CliOpt {

	var port int
	var name string
	var hash string

	p := os.Getenv("PORT")
	if "" == p {
		port = 3000
	} else {
		var err error
		port, err = strconv.Atoi(p)
		if nil != err {
			log.Fatalf("Invalid port number: %s\n", p)
			os.Exit(1)
		}
	}

	name = os.Getenv("INSTANCE_NAME")
	hash = os.Getenv("INSTANCE_HASH")

	flag.IntVar(&port, "port", port, "port to listen to")
	flag.StringVar(&name, "name", name, "set the instance name")
	flag.StringVar(&hash, "hash", hash, "set the instance hash")
	flag.Parse()

	return CliOpt{port, name, hash}
}

func main() {

	fmt.Printf(">>> num: %v\n", randImages(4))

	opt := parseCommandLine()

	r := gin.Default()

	if dirname, err := os.Getwd(); nil != err {
		log.Fatalf("Strange, cannot get current directory: %v\n", err)
		os.Exit(1)
	} else {
		staticDir := fmt.Sprintf("%s/static", dirname)
		if _, err := os.Stat(staticDir); os.IsNotExist(err) {
			log.Fatalf("Static asset directory does not exists: %s\n%v\n", staticDir, err)
		}
		r.Static("/static", staticDir)
	}

	r.GET("/healthz", func(c *gin.Context) {
		c.JSON(204, gin.H{})
	})

	fmt.Printf("Starting application at %s on port %d\n", time.Now().UTC().String(), opt.port)

	if err := r.Run(fmt.Sprintf("0.0.0.0:%d", opt.port)); nil != err {
		log.Fatalf("Cannot start dov-bear: %v\n", err)
		os.Exit(1)
	}
}
