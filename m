From: Benno Senoner <sbenno@em.gardena.net>
Date: Sat, 28 Aug 1999 08:52:15 +0000
Subject: Re: playing MP3 vs CPU usage
Message-Id: <marc-linux-sound-93583019213770@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93577292904421@msgid-missing>
In-Reply-To: <marc-linux-sound-93577292904421@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> 
> 
> 
> 
> On Fri, 27 Aug 1999, Benno Senoner wrote:
> > 
> > Linux actually has some problems in this area, especially on slow computers.
> > The trick is to increase audio buffers of your mp3 player (what player are you
> > using ?),
> 
> I'm using mpg123 to play it.
> How can I increase the audio buffer of it?

mpg123 -b 1000 mp3file

should help

( In 1-2 days I will post the URL to mingo's patch ( for kernel 2.2.10) ),
this will help even on the crappiest hardware.

> 
> > plus tuning your EIDE disk with
> > hdparm -d 1 -u 1 -m 8 -c 1  /dev/hda
> > because when there are disk accesses, the kernel stalls sometimes, especially
> > when you run non-DMAed disks
> > most distros don't tune your disk properly.
> 
> what does that command do?  I'm use an EIDE non-DMAed harddisk.
> does that line of command tune all kind of disks?
> Does the size of disk matter?

this command turns on all useful EIDE options, like
-d 1 = DMA on
-u 1 = unmask irqs during disk writes
-c 1 = enable 32 bit access
-m 8 = enable multicount disk transfers

even if DMA is not supported the other options are still useful,
just give the commandline as is, unsupported options will be ignored
by hdparm (ie turning on DMA on a non DMAed disk)

Disk size does not matter.

> 
> 
> So many questions. =P  Thanks for helping me.

No prob.
:-)

regards,
Benno.
