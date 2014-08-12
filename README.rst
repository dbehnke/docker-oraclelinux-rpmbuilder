CentOS 7 RPM builder
====================
This is a base image for build RPM packages. It *should* contain all the
required tools to get started.

You can add a build script like the following::

  #!/bin/sh
  package=$1
  sources=~/rpmbuild/SOURCES
  specs=~/rpmbuild/SPECS
  srpms=~/rpmbuild/SRPMS
  package_dir=${specs}/${package}

  cd ${sources}
  cp ${package_dir}/* .
  # Download sources
  spectool -g -R ${package}.spec
  # Build SRPM
  rpmbuild -bs ${package}.spec
  # Build dependencies
  yum-builddep ${srpms}/${package}*.src.rpm -y
  # Rebuild
  rpmbuild --rebuild ${srpms}/${package}*.src.rpm
