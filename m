From: Tony Nugent <tony@growzone.com.au>
Date: Fri, 09 Mar 2001 09:27:48 +0000
Subject: Re: How to configure a SB PCI128?
Message-Id: <marc-linux-sound-98413005828397@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon Feb 26 2001 at 12:38, ZYSERMAN Fabio wrote:

> Hi, I apologize if the request has
> already been answered, but I am new to this list!
> 
> I have a Sound Blaster PCI128,
> could someone help me with the steps
> necessary to get it to work?
> 
> Thank you all in advance!

Short answer:

	modprobe es1371

If that doesn't work, and es1371.o does not exist in your
/lib/modules/* tree for the kernel you are running, then you are
either in trouble, or this sound driver has been compiled into the
kernel itself (which is not recommended).

Long answer:

If you have a redhat box, simply run the sndconfig utility, which
puts an alias into /etc/modules.conf (or /etc/conf.modules) that
specifies an alias for the module.

On my redhat 7.0 box (with a 2.4.x kernel and the same sound card),
I have:

alias sound-slot-0	es1371

Other distributions might have different mechanisms for setting this
up.  The alias name is also different ("alias sound es1371", IIRC)
in earlier distributions (kernel version dependent).

Cheers
Tony
 -=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-
  Tony Nugent <Tony@growzone.com.au>    Systems Administrator, RHCE
  LinuxWorks - PO Box 5747 Gold Coast MC Queensland Australia  9726
  Ph: (07) 5526 8020                           Mobile: 0408 066 336
 -=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
