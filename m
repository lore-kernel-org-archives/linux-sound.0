From: Tony Nugent <tony@growzone.com.au>
Date: Thu, 28 Oct 1999 16:14:22 +0000
Subject: Re: pci128 line-in help
Message-Id: <marc-linux-sound-94114189616065@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94098365529736@msgid-missing>
In-Reply-To: <marc-linux-sound-94098365529736@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[why all of a sudden are so many of the messages here also going to a
linux audio list in canada?]

On Tue Oct 26 1999 at 17:19, est@hyperreal.org wrote:

> I can't seem to get my pci128 line-in to work.  This is using the
> (es1370) OSS driver distributed with the 2.2.7 kernel.  I've tried all
> the obvious mixer settings as well as all the private ioctl()s the
> driver has, checked my hardware, etc.  Can anyone think of anything I
> might be missing?

You need to configure the sound driver module when you load it.

%   /sbin/modinfo -p es1370
joystick int array (min = 1, max = 5), description "if 1 enables joystick interface (still need separate driver)"
lineout int array (min = 1, max = 5), description "if 1 the LINE input is converted to LINE out"
micbias int array (min = 1, max = 5), description "sets the +5V bias for an electret microphone"

(btw, default 2.2.12-20 kernel/modules from redhat6.1)

Either pass the relevant parameters on the insmod/modprobe command
line if you (re)load it manually, or put them into /etc/conf.modules

Check the /usr/src/linux/Documentation/sound/ directory for more
information about the parameters... there is a file there specifically
for the es1370 chip.

Cheers
Tony
