From: SkyViper <skvpr@earthlink.net>
Date: Mon, 24 Jan 2000 12:07:24 +0000
Subject: es1370 in Kern 2.2.14
Message-Id: <marc-linux-sound-94871729216562@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

When I boot I get a very high static sound.
This static sounds like my card is being over driven. Quieter sounds are
discernable, but masked with static.The problem is intermittent in that
it does not occur on every boot, and follows no pattern.
If the boot is good, then restarting X has no ill effect. If the boot is
bad, restarting X does not correct the problem. The card still works
fine in Kernel 2.2.11 using insmod es1370, but I will try 2.2.13 and
2.2.12.

I used xconfig to set the Kernel, and configured it to use sound and the
es1370 and Joystick. (By the way, I don't think the joystick works, but
I am not sure)

I am running Red Hat 6.1
Hardware list:
Asus P5AB
Motherboard = AMD K6-2 400 (OC to 450)
Sound Card = PCI SRS727 (Ensoniq es1370)
Video Adapter = PCI 3Dfx Voodoo3 2000
Modem = ISA Motorola Voice Surfer 56K V90 (firmware Upgradded from
KFlex)
Hard drives = Maxtor 850, Samsung 2.1, Fuji 10.2 Partitioned by
Partition Magic 5.0
 Linux is on one of these parts.
RAM = 64M PC 100 single stick
Mouse = MS Intellmouse 1.1a
Keyboard = MS Natural
Joystick = CH F16 Fighterstick, CH Throttle, CH Pro Pedals

Known Running Server/Module items:
XFree 3.3.5, Gnome, KDE
Glide 2 and 3 loaded per 3Dfx sight
Modules:
3dfx on the 3.3.5 server




OUTPUT from sh scripts/ver_linux :
Linux localhose.localdomain 2.2.14 #9 Sat Jan 22 17:09:25 EST 2000 i586
unknown
Kernel modules   2.1.121
Gnu C  egcs-2.91.66
Binutils   2.9.1.-.24
Linux C Library   2.1.2
Dynamic linker   ldd (GNU libc) 2.1.2
Procps   2.0.4
Mount   2.9u
Net-tools   1.53
Console-tools   199.03.02
Sh-utils   2.0
Modules Loaded    3dfx


Tom H.
