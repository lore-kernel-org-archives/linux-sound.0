From: Emil Stephan <ste@esqhen.su.eunet.de>
Date: Tue, 08 Sep 1998 20:17:05 +0000
Subject: Re: second dma
Message-Id: <marc-linux-sound-90532287605122@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90519114625121@msgid-missing>
In-Reply-To: <marc-linux-sound-90519114625121@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Karsten Patzwaldt wrote:
> 
> hi!
> 
> when configuring the soundcard in the kernel-setup, the config-program
> tells me that i can choose whether i my card uses 5, 6 or 7 as 2nd
> dma-channel. but with my sb16-card, i have to use channel 1 there. it took
> me a long time to figure it out (maybe my way of figuring it out was too
> silly :) ), maybe this should be changed in future releases. i use 2.0.33,
> sorry if this is updated in 2.0.34 oder the 2.1.x-series.
> 
> and: what about a simple hardware-detection in the kernel-config? this is
> very off-topic, but this idea was born when i got angrier and angrier and
> then used pnpdump to get the dma and irq and so on of the card...
> 
> if there are any questions, please contact me directly, i'm not on this
> list...
> 
> ---
> Karsten Patzwaldt             http://kpa.notrix.de              kpa@gmx.net
>                         "Wisdom is earned... not given."
Hello Karsten,

i have an AWE64Gold, which shall be compatible to SB16 concerning the
audio
and midi part (Gold means gold plated in's and out's and cables, 64
means
32 soft synth voices plus 32 emu8000 voices, but the ISA-bus width is 16
as on the SB16). I use DMA 1 and 5 with this card. What thoughts led You
to the point, that You can use DMA 1 only ?

Bye, Emil.
-- 
--------------------------------------------------
Emil Stephan, Marktplatz 39, 53773 Hennef, Germany
voice: +49-2242-84438

Accelerate Windows: 9.81 m/sec^2 would be adequate
