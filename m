From: lawson_whitney@juno.com
Date: Tue, 11 May 1999 14:02:21 +0000
Subject: Re: Couple of questions 1 real stupid - sorry
Message-Id: <marc-linux-sound-92647289126393@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92643155626678@msgid-missing>
In-Reply-To: <marc-linux-sound-92643155626678@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



On Tue, 11 May 1999 georgek@netwrx1.com wrote:

> Hello:
> 
> First an apology for the really stupid question I'll start with...I'm
> just drawing a complete blank here.
> 
> System Info:
> Gateway 9100XL Notebook
> 	Pentium 350MHz
> 	384 MB RAM

This is more RAM than the total for all the computers I've ever
programmed in my life.  Including mainframes.

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

mount -t vfat /dev/fd0 /mnt/floppy
> 
> with NO success using either a SuperDisk or 1.44MB standard floppy
> formatted under WIN98. What the %^*&% am I missing??

win98 don't do umsdos.  vfat is fat16 with a long filename kluge, and
probably what it'd use on a floppy.  cat /proc/filesystems to see what
choice you have.
> 
> 2) Has anyone got PCMCIA working on a system like this? I've got it
> enabled in the kernel but it doesn't seem to see any cards and running
> cardmgr by hand get me a "no entries in /proc/devices" error in the
> log.
> 
> 3) Is the SuperDisk and the Xircom Ethernet supported in the PCMCIA
> package? 
> 
> 4) What do I select for a Mouse and Video Adapter for X-Windows or kde
> here to get the built in Display and the little glide point thingy
> working I can't seem to get the mouse responding at all and am unsure
> on the video also.

I'm just guessing.  I'd try PS/2 mouse for the glide point thingy.
> 
> 5) What type of sound drivers do I need to get that working here...I
> haven't tried to address this much up til now but since I'm
> asking.....
> 
> 6) Is there any DVD Support for the DVD that is here as well? Not a
> necessity but it sure would be nice to have....
> 
> These are my five (or 6) core critical issues here, once I'm past
> these I can get the rest of the system going (I hope). I've done alot
> of Linux on "standard" machines but never on a notebook....
> 
> Thanks,
> George

Well, that's 1 and a half of your questions answered.  If you get that
much of a response from each of the lists you cross posted to, you
should be right.

Lawson
	  >< Microsoft free environment

This mail client runs on Wine.  Your mileage may vary.





___________________________________________________________________
You don't need to buy Internet access to use free Internet e-mail.
Get completely free e-mail from Juno at http://www.juno.com/getjuno.html
or call Juno at (800) 654-JUNO [654-5866]
