From: "lokesh setia" <lokesh_setia@hotmail.com>
Date: Wed, 10 Feb 1999 20:31:52 +0000
Subject: Aztech 16-bit in SB mode??
Message-Id: <marc-linux-sound-91870762615258@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all,

I have a Aztech 16-bit sound card which reports to be SB16 compatible.
(In DOS that is, all games etc. use the SB 16  settings after the Aztech 
sound driver is loaded.).
I have a Redhat 5.0 with kernel 2.0.32, and i tried using sndconfig.
The card is not detected at io=0x220 (irq test fails at all irqs).
Then I came to know of LOADliN , i boot into dos, initialize the sound
driver, use loadlin to go into linux.
and voila, sndconfig does report my sound card and also plays the sample 
file correctly.

Now my problem is that my sound card is *probably* working in 8-bit 
mode. (the ioctl SNDCTL_DSPP_SAMPLESIZE returns the value 8 in the 
argument size, always).
I also tried using a software like vplay (distributed inside sndkit, by 
Hannu Salovien) but it says the following:

Unable to set 16-bit sample size, playing 8-bit.

If my card is detected correctly as SB16, then why does it play only 
8-bit?? Any Clues???

Lokesh

______________________________________________________
Get Your Private, Free Email at http://www.hotmail.com
