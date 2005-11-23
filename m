From: Patrick Mochel <mochel@digitalimplant.org>
Date: Wed, 23 Nov 2005 22:08:24 +0000
Subject: Re: [Patch 0/6] Remove Deprecated PM Interface from Obsolete Sound
Message-Id: <Pine.LNX.4.50.0511231406340.16769-100000@monsoon.he.net>
List-Id: <linux-sound.vger.kernel.org>
References: <Pine.LNX.4.50.0511231114340.14446-100000@monsoon.he.net>
 <20051123205710.GW3963@stusta.de>
In-Reply-To: <20051123205710.GW3963@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linux-pm@lists.osdl.org, akpm@osdl.org


On Wed, 23 Nov 2005, Adrian Bunk wrote:

> On Wed, Nov 23, 2005 at 12:23:25PM -0800, Patrick Mochel wrote:
> >
> > Hi there.
>
> Hi Patrick,
>
> > This is a series of 6 patches that remove the old, deprecated power
> > management interface from a variety of old OSS drivers, most of them
> > marked OBSOLETE and scheduled for removal in January 2006.
> >
> > These patches facilitate the removal of the ancient PM interface by
> > reducing the number of in-kernel users to 3:
> >
> > 	drivers/net/3c509.c
> > 	drivers/net/irda/ali-ircc.c
> > 	drivers/serial/68328serial.c
> >...
> > Does any one have any objections to these patches?
>
> I'd say the obsolete OSS drivers are the least problem, it would be more
> interesting to get the code fixed that will still be present two months
> from now.

I completely agree. I just wanted to start some place easy. :)

> Looking at the current state of 2.6.15, I doubt your patches would make
> it into Linus' tree earlier than the complete removal of the drivers.

That's a good point. I'll not worry about pushing the patches that affect
these to-be-removed drivers.

Thanks,


	Patrick

