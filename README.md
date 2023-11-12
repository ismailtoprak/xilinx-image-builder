 # Xilinx Docker Yocto Builder
 
 To build Petalinux Images of Xilinx FPGAs, will need a supported OS. 
 
 
 ## References
   - [Huseyin Kozan - Yocto Builder](https://github.com/huseyinkozan/toradex-docker-yocto-builder)
   - [Xilinx Atlassian](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841862/Install+and+Build+with+Xilinx+Yocto)
   - [Avnet Yocto Meta User Demo](https://xterra2.avnet.com/yocto/yocto-meta-user-demo)
 
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
   - cpuidle.off=1 added to kernel bootargs
   - fpga-manager disabled

## Known Bugs
   - None

## Warnings
   - User has to copy generated bit file to sdcard boot partition then load it ```fpga load``` commad. For more information follow ```Test Procedure``` section of [Xilinx Atlassian Wiki](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/124682257/U-Boot+FPGA+Driver)