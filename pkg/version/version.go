package version

import (
	"fmt"
)

var (
	Version   string
	GitBranch string
	GitCommit string
	GoVersion string
	BuildTime string
)

func ShowVersion() {
	fmt.Printf("Version: %s\nGit Branch: %s\nGit Commit: %s\n"+
		"Go Version: %s\nBuildTime: %s\n", Version, GitBranch, GitCommit, GoVersion, BuildTime)
}
