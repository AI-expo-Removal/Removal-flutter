const amplifyconfig = {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "removal": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://2cncgho5bfccpfdxbeqnuqkmhq.appsync-api.ap-northeast-2.amazonaws.com/graphql",
                    "region": "ap-northeast-2",
                    "authorizationType": "AWS_IAM"
                }
            }
        }
    }
};
