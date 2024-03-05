package hash

import (
	"fmt"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestHash(t *testing.T) {
	md5 := MD5("test")
	assert.EqualValues(t, "098f6bcd4621d373cade4e832627b4f6", md5)

	sha1 := SHA1("test")
	assert.EqualValues(t, "a94a8fe5ccb19ba61c4c0873d391e987982fbbd3", sha1)

	sha256 := SHA256("123456")
	fmt.Print(sha256)
	assert.EqualValues(t, "8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92", sha256)
}
