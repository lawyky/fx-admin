package snowflake

import (
	"fmt"
	"github.com/bwmarrin/snowflake"
)

type ID = snowflake.ID

var v *snowflake.Node

func init() {
	var err error
	v, err = snowflake.NewNode(1)
	if err != nil {
		fmt.Println(err)
		return
	}
}

func Get() snowflake.ID {
	return v.Generate()
}

func MustID() ID {
	v := Get()
	return v
}

// MustString Create snowflake id
func MustString() string {
	return MustID().String()
}
