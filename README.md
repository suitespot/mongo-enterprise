# mongo-enterprise
Repository to allow building a mongo-enterprise container as per the official instructions: https://docs.mongodb.com/manual/tutorial/install-mongodb-enterprise-with-docker/

The Dockerfile is slightly modified to allow unattended build of the container.

# mongo 5.0.5 and later

Due to mac's new M1 chips their architecture is now arm64, therefore mongo container now has to be built for multiple architecture (arm and amd) this is achieved using QEMU and buildx. 

after pushing changes to github repo we need to add a git tag and push the tags to origin matching pattern: `{digit}.{digit}.{digit}` this will trigger the github-action located at `./.github/workflows/github-actions.yml`.

This action builds the image for arm and amd and then pushes into our dockerhub at: `suitespottechnology/mongo-enterprise:{tag}`
