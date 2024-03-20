package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

func replaceStringsInFile(filePath string) error {
	// Open the file for reading and writing
	file, err := os.OpenFile(filePath, os.O_RDWR, 0644)
	if err != nil {
		return err
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	var lines []string

	for scanner.Scan() {
		line := scanner.Text()

		if strings.Contains(line, "GOARCH=") {
			line = strings.ReplaceAll(line, "amd64", "arm64")
		}

		if strings.Contains(line, "-o ") && strings.Contains(line, "main.go") {
			parts := strings.Split(line, " ")
			if len(parts) >= 9 {
				chmodCommand := fmt.Sprintf("   chmod +x %v", parts[8]+"/bootstrap")
				zipCommand := fmt.Sprintf(" zip -j %v.zip %v", parts[8], parts[8]+"/bootstrap")
				newParts := append(parts[0:8], parts[8]+"/bootstrap ", parts[9])
				newLine := strings.Join(newParts, " ")
				lines = append(lines, newLine)
				lines = append(lines, chmodCommand)
				lines = append(lines, zipCommand)
				lines = append(lines, "")
			} else {
				chmodCommand := fmt.Sprintf("   chmod +x %v", parts[2]+"/bootstrap")
				zipCommand := fmt.Sprintf(" zip -j %v.zip %v", parts[2], parts[2]+"/bootstrap")
				newParts := append(parts[0:2], parts[2]+"/bootstrap ", parts[3])
				newLine := strings.Join(newParts, " ")
				lines = append(lines, newLine)
				lines = append(lines, chmodCommand)
				lines = append(lines, zipCommand)
				lines = append(lines, "")
			}
		} else {
			lines = append(lines, line)
		}
	}

	// Truncate the file and write the modified content back
	file.Truncate(0)
	file.Seek(0, 0)
	writer := bufio.NewWriter(file)
	for _, line := range lines {
		_, err := fmt.Fprintln(writer, line)
		if err != nil {
			return err
		}
	}
	writer.Flush()

	return nil
}

func main() {
	root := "." // Root directory of your Golang project

	err := filepath.Walk(root, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if !info.IsDir() && info.Name() == "Makefile" {
			err := replaceStringsInFile(path)
			if err != nil {
				fmt.Printf("Error processing file %s: %v\n", path, err)
			} else {
				fmt.Printf("Replaced strings in file: %s\n", path)
			}
		}
		return nil
	})

	if err != nil {
		fmt.Println("Error:", err)
	}
}
