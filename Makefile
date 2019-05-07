export GNUPGHOME = ~/.aptly/gpg

create-repo:
	aptly repo create --distribution=bionic chicken

# aptly repo add chicken deb/

publish:
	aptly publish repo chicken chicken

# we should ensure published first
update:
	aptly publish update bionic chicken

serve:
	aptly serve -listen :8088
