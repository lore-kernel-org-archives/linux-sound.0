From: llornkcor <llornkcor@llornkcor.com>
Date: Wed, 27 Oct 1999 00:50:23 +0000
Subject: Re: pci128 line-in help
Message-Id: <marc-linux-sound-94098612031968@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94098365529736@msgid-missing>
In-Reply-To: <marc-linux-sound-94098365529736@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a pci 128, and the mic input is the default, so you'll have to make sure
to select the line input using a mixer. If you've already done that, try
looking at /dev/dsp, or /dev/dsp1. If you are trying to listen to something and
record at the same time (full-duplex) the OSS driver that comes with the kernel
doesn't support it. So, if the line out is open, it won't record anything.
Sometimes, some sound apps don't close /dev/dsp correctly.Try ALSA or the
commercial OSS driver from 4front. 

On Tue, 26 Oct 1999, est@hyperreal.org wrote:
> I can't seem to get my pci128 line-in to work.  This is using the
> (es1370) OSS driver distributed with the 2.2.7 kernel.  I've tried all
> the obvious mixer settings as well as all the private ioctl()s the
> driver has, checked my hardware, etc.  Can anyone think of anything I
> might be missing?
> 
> Thanks,
> 
> Eric
-- 
"When the doors of perception are cleansed everything appears as it truly is - infinite."   - William Blake 

llornkcor rocknroll 
SpiritShip MultiMedia Recording Studio
http://www.llornkcor.com
