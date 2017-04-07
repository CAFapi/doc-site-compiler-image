FROM digitallyseamless/nodejs-bower-grunt:5

# Download and compile v1.29 of tar
# (Version 1.27.1 is included in the base image but it doesn't have the --exclude-vcs-ignores switch)
RUN curl -sSL https://ftp.gnu.org/gnu/tar/tar-1.29.tar.gz | tar xzf - -C /usr/src/
RUN cd /usr/src/tar-1.29/ && FORCE_UNSAFE_CONFIGURE=1 ./configure && make && make install

# Install Bower Artifactory integration
RUN npm install -g bower-art-resolver

# Add Tini
ENV TINI_VERSION v0.14.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# Copy in the build script and make it the default command
ENV TARGET_FILE=docs-site.tar.gz
CMD ["/root/build-docs.sh"]
COPY build-docs.sh /root
RUN chmod +x /root/build-docs.sh

# Tag the image
ARG BUILD_NUMBER
ARG BUILD_DATE
ARG GIT_BRANCH
ARG GIT_COMMIT

LABEL Build.Number="$BUILD_NUMBER" \
      Build.Date="$BUILD_DATE" \
      Git.Branch="$GIT_BRANCH" \
      Git.Commit="$GIT_COMMIT"
