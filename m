From: "Nerijus" <nerijus@sat.lt>
Date: Sun, 13 Feb 2000 00:57:38 +0000
Subject: FW: Linux K7M Soundrivers found on ASUS CD
Message-Id: <marc-linux-sound-95040520613417@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



-----Original Message-----
From: owner-linux-kernel@vger.rutgers.edu
[mailto:owner-linux-kernel@vger.rutgers.edu] On Behalf Of Jeff Garzik
Sent: Saturday, February 12, 2000 10:16 PM
To: linux-via@gtf.org
Cc: Linux Kernel List
Subject: Re: Linux K7M Soundrivers found on ASUS CD


rolf@max.lui.uni-tuebingen.de wrote:
> 
> Hello
> 
> Maybe you are as Surprised a i was but...
> 
> There are Sounddrivers on the CD that came with my Asus K7M
> there are two Versions /cdrom/Audio/LINUX/CALDERA/  and
> /cdrom/Audio/LINUX/REDHAT/
> 
> They basically contain the same.
> 
> The Sound Drivers are Compiled for Kernel Version 2.2.5
> To try them on a different Kernel you have to modify the
> vinstall script by replacing all occurences of 2.2.5 with
> your Kernel Version for example with 2.2.14


Thanks to Rolf for posting this, I didn't know this either.

These drivers are the ones for which I have source code (under NDA), and
are the basis for the upcoming open source "native" via sound driver.

It should also be noted that the Via sound chip does not have 100%
hardware MIDI, but merely an additional PCM channel for which MIDI data
can be piped.  You would need to use a userspace solution, or perhaps
the SoftOSS wave table engine, in order to get MIDI support.

-- 
Jeff Garzik         | "Vegetarian" is the Indian word
Building 1024       | for 'lousy hunter.'
MandrakeSoft, Inc.  |

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.rutgers.edu
Please read the FAQ at http://www.tux.org/lkml/
