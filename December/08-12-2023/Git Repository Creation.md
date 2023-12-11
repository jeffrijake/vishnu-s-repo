08-12-2023

What is providers in Terraform?

Providers in terraform are plugins that allow you define and create resources within various infrastructure platforms. Like AWS, Azure, Git Hub, GCP, etc,….
In the below example I will try to create git hub provider and I will try to create one repo with 2 branches :
 
    provider "github" {
      token = "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"
    }

    resource "github_repository" "example" {
      name        = "myrepo"
      description = "testing purpose"
      auto_init   = true

      visibility = "public"
    }

    resource "github_branch" "dev" {
      repository = github_repository.example.name
      branch     = "dev"
    }

    resource "github_branch" "test" {
      repository = github_repository.example.name
      branch     = "test"
    }

By using the above code I can create the git repository with main and 2 other branches.
