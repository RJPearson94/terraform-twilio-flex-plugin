module.exports = {
  repositoryUrl: "https://github.com/RJPearson94/terraform-twilio-flex-plugin",
  tagFormat: "v${version}",
  branches: ["main"],
  plugins: [
    [
      "@semantic-release/commit-analyzer",
      {
        preset: "angular",
        releaseRules: [{ type: "docs", release: "patch" }],
      },
    ],
    "@semantic-release/release-notes-generator",
    "@semantic-release/git",
    "@semantic-release/github",
  ],
};
