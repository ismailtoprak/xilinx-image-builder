 # Xilinx Docker Yocto Builder
 
 To build Petalinux Images of Xilinx FPGAs, will need a supported OS. 
 
 
 ## Requirements

 * GNU/Linux distro which have Docker support.
  * Tested with Arch Linux.
* Install Docker and Docker Compose.
  * [Docker Install](https://docs.docker.com/engine/install/ubuntu/)
  * [Docker Linux Post Install](https://docs.docker.com/engine/install/linux-postinstall/)
    * Configure Docker to start on boot with systemd
    * Manage Docker as a non-root user
  * [Docker Compose Install](https://docs.docker.com/compose/install/)
* A disk path that have at least 60GB free space.
* Configure git. See [here](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration) for more info.
  ```bash
  $ git config --global user.name "John Doe"
  $ git config --global user.email johndoe@example.com
  ```
  
  
  
## First Time Setup

Do below steps to setup;
   ```bash
     docker-compose up --build --no-start
   ```
   
* Start container;
  ```bash
  ./start.sh
  ```
* Fetch layers with repo tool.
  ```bash
   repo init -u https://github.com/Xilinx/yocto-manifests.git -b <current-release>
   repo sync
   ```
   
   
## Usage

To start and enter the container;
   ```bash
   cd <where-this-project-located>

   ./start.sh
   ```


Then, you can use `bitbake`. For example;
* `bitbake petalinux-image-minimal` : build `petalinux-image-minimal` package.

## Customizations
   - debug-tweaks feature set as enabled for root login without password.

## Known Bugs
   - rootfs load as Read-Only file system.
   - mmc device-tree overlay does not work as desired.

