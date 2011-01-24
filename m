From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Date: Mon, 24 Jan 2011 20:53:05 +0000
Subject: ES1x88 card isn't automatically detected anymore
Message-Id: <4D3DE6B1.5060707@gentoo.org>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I have a Compaq XP1000 alpha system, which has an ES1888 audio chip onboard.

When using the es1688 driver in a 2.6.34 kernel, the card is detected
without any parameters. Starting from 2.6.35, the driver module returns
'no such device' when loading it. I have to pass to the module the
'isapnp=0' parameter to get it to detect the card. What happened?

I know its kinda strange that having an ES1888 i'm using the es1688
driver. But back in 2.6.29 or so when i installed the system, i tried
the es18xx driver and guess what, it didn't detect the card, while the
es1688 driver did, so thats what i used.

Turns out the es18xx driver works as well with 'isapnp=0'. But i'd guess
i could ask why the es1688 driver doesn't detect it anymore.

Thanks!
