From: shaleh@clifford.livenet.net
Date: Tue, 11 May 1999 14:51:14 +0000
Subject: Re: Couple of questions 1 real stupid - sorry
Message-Id: <marc-linux-sound-92644290803571@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92643155626678@msgid-missing>
In-Reply-To: <marc-linux-sound-92643155626678@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> 
> Hello:
> 
> First an apology for the really stupid question I'll start with...I'm
> just drawing a complete blank here.
> 
> System Info:
> Gateway 9100XL Notebook
> 	Pentium 350MHz
> 	384 MB RAM
> 	8.1 GB Hard Disk 
> 	all Linux with 768MB of Swap partitions (6 x 128)
> 120MB SuperDisk Drive
> Xircom CE 10/100 Ethernet PCMCIA Adapter
> Caldera OpenLinux 1..3
> kernel 2.0.35
> 
> First the stupid question....
> 
> 1) How do I mount the floppy drive /dev/fd0 I've tried
> 
> mount -t umsdos /dev/fd0 /mnt/floppy
> 
> with NO success using either a SuperDisk or 1.44MB standard floppy
> formatted under WIN98. What the %^*&% am I missing??

Try mount -t msdos or vfat, umsdos is unix fs on msdos so you can try to run
linux installed in a dos directory.

> 
> 2) Has anyone got PCMCIA working on a system like this? I've got it
> enabled in the kernel but it doesn't seem to see any cards and running
> cardmgr by hand get me a "no entries in /proc/devices" error in the
> log.
> 

Make sure you have the latest and greatest pcmcia package (ike 3.0.x).

> 3) Is the SuperDisk and the Xircom Ethernet supported in the PCMCIA
> package? 
> 

Unsure, in the pcmcia package there is a doc listing known working and not
working hardware.

> 4) What do I select for a Mouse and Video Adapter for X-Windows or kde
> here to get the built in Display and the little glide point thingy
> working I can't seem to get the mouse responding at all and am unsure
> on the video also.
> 

mouse is prolly /dev/psaux (ps/2)

> 5) What type of sound drivers do I need to get that working here...I
> haven't tried to address this much up til now but since I'm
> asking.....
> 

Unsure here.

> 6) Is there any DVD Support for the DVD that is here as well? Not a
> necessity but it sure would be nice to have....

Not yet.  ANd DVD movies dont work either and may not for some time.
