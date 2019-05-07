# 3e8 debian repositories

deb repositories included in this git repo:

- chicken: chicken-X.Y.Z, which install self-contained in `/usr/local/chicken-X.Y.Z`.

To use, add the following to `/etc/apt/sources.list.d/chicken.list`:

    deb https://raw.githubusercontent.com/ursetto/debrepo/master/chicken bionic main

These are all signed with key `packaging@3e8.org.gpg.asc`:

    curl https://raw.githubusercontent.com/ursetto/debrepo/master/packaging%403e8.org.gpg.asc | apt-key -

Or use `deb [trusted=yes] ...` in your sources.list.

## Build

These repositories are built with [aptly](aptly.info). Use aptly > 1.3.0 (Nov 2018 or later)
for GPGv2 support. This is the published part of the repository, which usually exists under
`~/.aptly/public`.

    git clone https://github.com/ursetto/debrepo ~/.aptly/public

The Makefile expects your .gnupg home in `~/.aptly/gpg`. You can make this a symlink to `~/.gnupg` or
wherever your packaging key homedir is.

Losing the aptly metadata in `~/.aptly` is not ideal, but you can recover by recreating the repos, then adding any debs from the pool.

    # assuming rm -rf ~/.aptly
    git clone https://github.com/ursetto/debrepo ~/.aptly/public
    cd ~/.aptly/public
    make create-repo
    find chicken/pool -name '*.deb' | xargs aptly repo add chicken
    make publish

## Notes

The chicken repository is under its own prefix `chicken/` in case we want to
split it out later. Alternatively, we could use distribution `bionic-chicken`
to have one repo with chicken semi-contained, or just use `bionic` and dump all
debs together.
