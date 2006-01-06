From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Date: Fri, 06 Jan 2006 07:47:02 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.LNX.4.61.0601060845250.22809@yvahk01.tjqt.qr>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <20060103193736.GG3831@stusta.de>
 <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
 <mailman.1136368805.14661.linux-kernel2news@redhat.com>
 <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl> <s5hmziaird8.wl%tiwai@suse.de>
 <Pine.LNX.4.61.0601060028310.27932@zeus.compusonic.fi>
In-Reply-To: <Pine.LNX.4.61.0601060028310.27932@zeus.compusonic.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannu Savolainen <hannu@opensound.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> > If you have sound device without this soft mixing is moved to user space 
>> > .. but  applications do not need know about this even now because all
>> > neccessary details are handled on library level. Is it ?
>> > So question is: why the hell *ALL* mixing details are not moved to kernel 
>> > space to SIMPLE and NOT GROWING abstraction ?
>> 
>> Because many people believe that the softmix in the kernel space is
>> evil.
>>
>This is the usual argument against kernel level mixing. Somebody has once 
>said that all this is evil. However this is not necessarily correct.
>

I'm going with "is evil". Better let userspace have a segfault than a kernel
oops. I am having quite a moody feeling when running even my own things like
http://alphagate.hopto.org/quad_dsp/

>Kernel mixing is not rocket science. All you need to do is picking a 
>sample from the output buffers of each of the applications, sum them 
>together (with some volume scaling) and feed the result to the physical 
>device. Ok, handling different sample formats/rates makes it much more 
>difficult but that could be done in the library level.



Jan Engelhardt
-- 
