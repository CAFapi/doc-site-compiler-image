#
# Copyright 2017-2020 Micro Focus or one of its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ARG DOCKER_HUB_PUBLIC=docker.io
FROM ${DOCKER_HUB_PUBLIC}/cafapi/opensuse-nodejs10:2

RUN zypper install -y gzip && \
    zypper install -y -t pattern devel_basis

# Install Bower & Bower Artifactory integration
RUN npm install -g bower bower-art-resolver

# Copy in the build script and make it the default command
ENV TARGET_FILE=docs-site.tar.gz
CMD ["/root/build-docs.sh"]
COPY build-docs.sh /root
RUN chmod +x /root/build-docs.sh
