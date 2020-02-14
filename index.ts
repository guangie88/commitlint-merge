import * as core from '@actions/core';
import * as github from '@actions/github';

async function run() {
    const token = core.getInput('github_token');
    const octokit = new github.GitHub(token);
    const payload = github.context.payload

    const { data: pullRequest } = await octokit.pulls.get({
        owner: 'octokit',
        repo: 'rest.js',
        pull_number: 123,
        mediaType: {
          format: 'diff'
        }
    });
}

run();
