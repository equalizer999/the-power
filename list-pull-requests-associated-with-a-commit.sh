.  ./.gh-api-examples.conf

# https://docs.github.com/en/rest/commits/commits?apiVersion=2022-11-28#list-pull-requests-associated-with-a-commit
# GET /repos/{owner}/{repo}/commits/{commit_sha}/pulls


if [ -z "$1" ]
  then
    commit_sha=$(curl --silent -H "Authorization: Bearer ${GITHUB_TOKEN}" ${GITHUB_API_BASE_URL}/repos/${org}/${repo}/git/refs/heads/${branch_name} | jq -r '.object.sha')
  else
    commit_sha=$1
fi


curl ${curl_custom_flags} \
     -H "Accept: application/vnd.github.v3+json" \
     -H "Authorization: Bearer ${GITHUB_TOKEN}" \
        "${GITHUB_API_BASE_URL}/repos/${org}/${repo}/commits/${commit_sha}/pulls"

