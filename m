From: Rico Dreier <rdreier@fzi.de>
Date: Fri, 12 Mar 1999 14:17:12 +0000
Subject: Vibra 16V PnP <-> SuSE 5.3 ?
Message-Id: <marc-linux-sound-92124872211270@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

I'm trying to activate a Vibra 16C PnP under SuSE 5.3. Independent of the selected
Interrupt 5 or 7 an error occurs during the boot process saying that the interrupt
test failed (no other devices use INT5/7 -> /proc/interrupts). The soundcard can
not be configured by using YaST since it is not possible to reach the respective
menu entry.

The kernel is compiled with audio support etc. selected, but I'm not sure if all
the sound options are set correctly :-/  Does the card only work by using the
isapnp tool, and does anybody have a valid isapnp.conf file for SoundBlaster Vibra
16C or 16X?

Inserting the sound module with insmod or modprobe leads to unresolved symbols.

Thanks for every hint,
Bye, Rico
