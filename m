From: Zwane Mwaikambo <zwane@holomorphy.com>
Date: Mon, 25 Nov 2002 19:10:47 +0000
Subject: Re: AZT1008 on HP Vectra VL6
Message-Id: <marc-linux-sound-103825124327478@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-103825052826476@msgid-missing>
In-Reply-To: <marc-linux-sound-103825052826476@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 25 Nov 2002, Ofer Achler wrote:

> I have a couple of old PII HP vectra machines with this sound card.
>
> (Redhat 8.0)
> Sndconfig will see it but the kernel module will not admit that the card
> exists:
> Nov 25 10:32:19 newthird kernel: ad1848/cs4248 codec driver Copyright
> (C) by Hannu Savolainen 1993-1996
> Nov 25 10:32:19 newthird kernel: ad1848: No ISAPnP cards found, trying
> standard ones...

You're sure it can be supported by ad1848?

> Here's the current output (after manually making the card activate in
> isapnp) of /proc/isapnp:
>
> Card 1 'AZT1008:AZT1008 PnP SOUND DEVICE' PnP version 1.0 Product
> version 0.3

Might be a simple matter of ISA pnp ids, but then again the ad1848 probe
should have picked it up regardless. What does /proc/ioports and
/proc/interrupts and dmesg say after the module load?

	Zwane
-- 
function.linuxpower.ca
