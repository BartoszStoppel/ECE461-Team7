/*
 * ECE 461 - Spring 2023 - Project 2
 *
 * API for ECE 461/Spring 2023/Project 2: A Trustworthy Module Registry
 *
 * API version: 2.3.5
 * Contact: davisjam@purdue.edu
 * Generated by: Swagger Codegen (https://github.com/swagger-api/swagger-codegen.git)
 */
package swagger

// This is a \"union\" type. - On package upload, either Content or URL should be set. If both are set, returns 400. - On package update, exactly one field should be set. - On download, the Content field should be set.
type PackageData struct {
	// Package contents. This is the zip file uploaded by the user. (Encoded as text using a Base64 encoding).  This will be a zipped version of an npm package's GitHub repository, minus the \".git/\" directory.\" It will, for example, include the \"package.json\" file that can be used to retrieve the project homepage.  See https://docs.npmjs.com/cli/v7/configuring-npm/package-json#homepage.
	Content string `json:"Content,omitempty"`
	// Package URL (for use in public ingest).
	URL string `json:"URL,omitempty"`
	// A JavaScript program (for use with sensitive modules).
	JSProgram string `json:"JSProgram,omitempty"`
}
