resource "github_repository" "example-repo" {
  name        = "example-repo"
  description = "My new repository for use with Terraform"
}

resource "github_team" "Team1" {
  name        = "Team1"
  description = "Team1"
  privacy     = "closed"
}

resource "github_team" "Team2" {
  name        = "Team2"
  description = "Team2"
  privacy     = "closed"
}

resource "github_team" "Team3" {
  name        = "Team3"
  description = "Team3"
  privacy     = "closed"
}


resource "github_team" "Team4" {
  name        = "Team3"
  description = "Team3"
  privacy     = "closed"
}

resource "github_team" "Team5" {
  name        = "Team4"
  description = "Team4"
  privacy     = "closed"
}

resource "github_team" "Team6" {
  name        = "Team5"
  description = "Team5"
  privacy     = "closed"
}

variable "team_names" {
  type        = list(string)
  default     = ["Team1","Team2","Team3","Team4","Team5","Team6"]
}

variable "role_map" {
  type = "map"
  default = {
	"user1" = ["member","maintainer","member","member","maintainer","member"]
	"user2" = ["maintainer","member","member","maintainer","member","member"]
	"user3" = ["member","member","maintainer","member","member","member"]
	"user4" = ["","member","member","member","member","maintainer"]
	}
}

resource "github_team_membership" "example-team-membership" {
  team_id  = "${github_team.var.team_names.id}"
  username = "var.user_name"
  role     = "var.role_map[${count.index}]"
  count    = 4
}
