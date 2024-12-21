# Achillobator
Larger, more lethal Bluefin. `bluefin:lts` prototype built on CentOS Stream10.

![image](https://github.com/user-attachments/assets/2e160934-44e6-4aee-b2b8-accb3bcf0a41)

# Purpose

Experimentation and reckless feeding. This is not a 1:1 recreation, it's a minimal product. 

## Current Status

Working on a base image first before trying the desktop parts. The more people dive in the faster we can get there. 😄

![image](https://github.com/user-attachments/assets/a8142495-68b1-4925-b96c-249fcb15bf48)

### Scope and Caveats

- Flatpaks must be installed by hand with `just install install-system-flatpaks` - [incoming anaconda PR](https://github.com/rhinstaller/anaconda/pull/6056)
- Do not rebase to this from an existing Fedora image, ain't no one testing that. Also the filesystems are going to be different, etc. We recommend a VM for now
- Not working on nvidia, -dx, etc. at this time as we wait for packages to populate into the EPEL10 repos.
- The URL _will change_ in the future, this is a temporary image, eventually will be pushed to `ublue-os/bluefin:lts`, but not any time soon.

## Rationale

S slower cadenced OS has a proven use case. With `bootc` being a critical piece of RHEL image mode, it means that stack in CentOS will be well maintained. And with the flexibility of the container model, we can source content from anywhere. This is a spike to see if it's worth adding this as a `bluefin:lts` branch, or worse case, a starting point for someone who wants to grow a community around this use case. 

- GNOME47 will be shipping, we have builds for our stuff already,
- 6.12 LTS kernel covers Framework's current laptops, we can source newer kernels for different tags later, but this should be great for 2025.
- Is there going to be a reliable GNOME COPR for El10?

## Building

To build locally and then spit out a VM: 

```
just build-vm 1
just build-iso ghcr.io/centos-workstation/achillobator
```

qcow2 file is written to the `output/` directory. Username and password are `centos`/`centos`

## Current Ideas

- hyperscale sig provides newer kernels, we don't need to stay old old.
- EPEL will fill in lots of stuff
- Long lived and boring, we expect even less maintenance than Fedora-based Bluefin
