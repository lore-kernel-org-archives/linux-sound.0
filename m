From: Karsten Patzwaldt <kpa@gmx.net>
Date: Mon, 07 Sep 1998 17:26:03 +0000
Subject: second dma
Message-Id: <marc-linux-sound-90519114625121@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

hi!

when configuring the soundcard in the kernel-setup, the config-program
tells me that i can choose whether i my card uses 5, 6 or 7 as 2nd
dma-channel. but with my sb16-card, i have to use channel 1 there. it took
me a long time to figure it out (maybe my way of figuring it out was too
silly :) ), maybe this should be changed in future releases. i use 2.0.33,
sorry if this is updated in 2.0.34 oder the 2.1.x-series.

and: what about a simple hardware-detection in the kernel-config? this is
very off-topic, but this idea was born when i got angrier and angrier and
then used pnpdump to get the dma and irq and so on of the card...

if there are any questions, please contact me directly, i'm not on this
list...

--- 
Karsten Patzwaldt             http://kpa.notrix.de              kpa@gmx.net
                        "Wisdom is earned... not given."
