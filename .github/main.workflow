workflow "Pull Request" {
  on = "pull_request"
  resolves = ["lint"]
}

action "install" {
  uses = "docker://node:12-slim"
  args = "npm ci"
}

action "lint" {
  uses = "hallee/eslint-action@master"
  args = ["*.ts **/*.ts"]
  secrets = ["GITHUB_TOKEN"]
}

# action "lint" {
# #   uses = "hallee/eslint-action@master"
#   uses = "docker://node:12-slim"
#   args = "npm run lint"
# }

action "build" {
#   needs = ["lint"]
  uses = "docker://node:12-slim"
  args = "npm run build"
}
