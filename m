From: LuftHans <LuftHans@asu.edu>
Date: Sat, 13 Mar 1999 01:02:33 +0000
Subject: Re: Vibra 16V PnP <-> SuSE 5.3 ?
Message-Id: <marc-linux-sound-92128723514199@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92124872211270@msgid-missing>
In-Reply-To: <marc-linux-sound-92124872211270@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 12 Mar 1999, Rico Dreier wrote:

> Hello,

moin Rico,

> I'm trying to activate a Vibra 16C PnP under SuSE 5.3. Independent of the selected
> Interrupt 5 or 7 an error occurs during the boot process saying that the interrupt
> test failed (no other devices use INT5/7 -> /proc/interrupts). The soundcard can
> not be configured by using YaST since it is not possible to reach the respective
> menu entry.

I had this same prob with a soundblaster under SuSE, RedHat and Slackware (I
switched from Slackware to SuSE and played with RedHat just to try it out).
The problem was BIOS was locking it out. I changed IRQ 5 to be available for
isapnp and it was immediately taken by my scsi card and video card, so I
loaded the soundcard at IRQ 11 :).

> The kernel is compiled with audio support etc. selected, but I'm not sure if all
> the sound options are set correctly :-/  Does the card only work by using the
> isapnp tool, and does anybody have a valid isapnp.conf file for SoundBlaster Vibra
> 16C or 16X?
> 
> Inserting the sound module with insmod or modprobe leads to unresolved symbols.

Same prob I had. This was under 2.0.3x, 2.1.x and 2.2.x. Once I changed the
bios AND went to a higher irq it worked. Just moving to a higher irq before
hadn't worked...

ciao,

der.hans

> Thanks for every hint,
> Bye, Rico

# +++++++++++=================+++++++++++ #
#                   LuftHans@asu.edu                      #
#            http://home.pages.de/~lufthans/              #
#             I've got a photographic memory,             #
#         but I'm lousy photographer. - der.hans          #
# ======+++++++++++++++++++++++++++++++++====== #
