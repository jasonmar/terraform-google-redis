#!/bin/bash
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

gsutil cp "gs://${bucket}/broker.jar" /etc/tokenbroker/lib/
gsutil cp "gs://${bucket}/application.conf" /etc/tokenbroker/
gsutil cp "gs://${bucket}/${id}.keytab" /etc/tokenbroker/
gsutil cp "gs://${bucket}/${id}.crt" /etc/tokenbroker/
gsutil cp "gs://${bucket}/${id}.pem" /etc/tokenbroker/

# Configure network here

# Install OS packages here

# Install service
cat <<EOF > /etc/systemd/system/tokenbroker.service

<service goes here>

EOF
systemctl daemon-reload

cat <<EOF > /etc/logrotate.d/tokenbroker
/var/log/tokenbroker/broker*log {
  weekly
  rotate 150
  dateext
  compress
  copytruncate
  missingok
}
EOF

service tokenbroker restart
