From: Donn aka N5XWB <n5xwb@hal-pc.org>
Date: Sat, 19 Apr 2003 16:55:34 +0000
Subject: kernel 2.4.21-pre5 and 7
Message-Id: <marc-linux-sound-105077134906171@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello:

This is to let you know of a kernel repeated problem in pre5
and pre7 dealing with my sound card.  I have es1370 and
joystick support.

I have tried to compile in a es1370 with gcc 2.95.3 and gcc
3.2 with the same error.  This come from a patched clean
2.4.20 kernel.  

drivers/sound/sounddrivers.o: In function `es1370_probe':
drivers/sound/sounddrivers.o(.text+0x5bcb): undefined
reference to `gameport_register_port'
drivers/sound/sounddrivers.o: In function `es1370_remove':
drivers/sound/sounddrivers.o(.text+0x5d5f): undefined
reference to `gameport_unregister_port'
make: *** [vmlinux] Error 1

As a unrelated note -> in both 5 and 7 "xconfig" fails.

This is a SuSE 8.0 highly upgraded system.
-- 
73 de Donn Washburn     __ " http://www.hal-pc.org/~n5xwb "
Ham Callsign N5XWB     / /     __  __  __  __  __ __  __ 
307 Savoy St.         / /__   / / /  \/ / / /_/ / \ \/ /
Sugar Land, TX 77478 /_____/ /_/ /_/\__/ /_____/  /_/\_\
LL# 1.281.242.3256       a MSDOS Virus "Free Zone" OS
Email: n5xwb@hal-pc.org  Info: http://www.knoppix.net
