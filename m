From: "lokesh setia" <lokesh_setia@hotmail.com>
Date: Sun, 14 Feb 1999 20:08:22 +0000
Subject: Re: Aztech 16-bit in SB mode??
Message-Id: <marc-linux-sound-91905177317996@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91870762615258@msgid-missing>
In-Reply-To: <marc-linux-sound-91870762615258@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

>I think I may have the same card. (or similar) The sb emulation is only 
8
>bits. almost all cards which emulate sb only work in 8 bits. You need 
to
>use the mss. Try using the sgalaxy driver, it works great for me. I use 
:
>
>modprobe sgalaxy io=0x530 irq=7 sgbase=0x220 dma=1 dma2=0
>
>Look at your autoexec.bat file, it will probably set galaxy= something.

Thanks for that, but i could'nt get it to work ;-(
I'm sure i have almost the same card as you have.
(Aztech 16-bit Sound galaxy pro), 
It is compatible with both sb16 and mwss. and sets galaxy=foo in 
autoexec.bat.

Here's my problem now:  
First of all, this module (sgalaxy.o) isnt there in 2.0.32.
So i upgraded it to 2.0.36. then i removed everything from 
/etc/conf.modules and restarted the computer. Here are some 
results i got.

bash# lsmod
bash# modprobe sgalaxy io=0x530 irq sgbase=0x220 dma=1 dma2=0
/lib/modules/2.0.36/misc/sgalaxy.o: device or resource busy
sound: device or resource busy.
bash# lsmod
ad1848  blah blah
soundlow blah blah
soundcore blah blah
sound	blah blah
bash# rmmod ad1848; rmmod soundlow; rmmod sound;
bash# lsmod
soundcore (used by 0)
bash# rmmod soundcore
soundcore: device or resource busy.

You get it? i remove all instances and the sound is certainly not being 
used still i cant remove soundcore. and yes i have tried different irq's 
(5, 7 , 9 and 11) and io=0x530 (as in dos) but all i get is device or 
resource busy.

Infact, i get this device or resource busy on trying to load any sound 
module (pss.o, sgalaxy.o or whatever).

Did you need to recompile the kernel to get your sound card working?
Also, in my DOS setting there is no option for mwss irq no.. I heard
that irq is the default, but isn't it used by the display.

Thanks anyway.

Lokesh 
>On Wed, Feb 10, 1999 at 08:31:52PM -0800, lokesh setia wrote:
>> Hi all,
>> 
>> I have a Aztech 16-bit sound card which reports to be SB16 
compatible.
>> (In DOS that is, all games etc. use the SB 16  settings after the 
Aztech 
>> sound driver is loaded.).
>> I have a Redhat 5.0 with kernel 2.0.32, and i tried using sndconfig.
>> The card is not detected at io=0x220 (irq test fails at all irqs).
>> Then I came to know of LOADliN , i boot into dos, initialize the 
sound
>> driver, use loadlin to go into linux.
>> and voila, sndconfig does report my sound card and also plays the 
sample 
>> file correctly.
>> 
>> Now my problem is that my sound card is *probably* working in 8-bit 
>> mode. (the ioctl SNDCTL_DSPP_SAMPLESIZE returns the value 8 in the 
>> argument size, always).
>> I also tried using a software like vplay (distributed inside sndkit, 
by 
>> Hannu Salovien) but it says the following:
>> 
>> Unable to set 16-bit sample size, playing 8-bit.
>> 
>> If my card is detected correctly as SB16, then why does it play only 
>> 8-bit?? Any Clues???
>> 
>> Lokesh
>> 
>> ______________________________________________________
>> Get Your Private, Free Email at http://www.hotmail.com
>> 
>
>-- 
>
>Robbie Murray
>


______________________________________________________
Get Your Private, Free Email at http://www.hotmail.com
