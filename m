From: Balaguru Nallathambi <bala@ats.com>
Date: Wed, 13 Jan 1999 18:49:12 +0000
Subject: Re: SoundBlasterPCI128
Message-Id: <marc-linux-sound-91624449806750@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91584820831233@msgid-missing>
In-Reply-To: <marc-linux-sound-91584820831233@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I downloaded the modular sound patch from Alan Cox's web site.
and applied it to kernel 2.0.36

I did a "make xconfig" and clicked on Sound.
( I also tried make config and make menuconfig)
I still could not find the ES1371 driver listed there.
I also looked in the .config file in the source tree.
It is not listed there.

I am bit reluctant to install the 2.2.pre kernel.
Since it is still under development I am worried it may do something tomy
harddisk.


If anyone has the source for the kernel with ES1371  driver pls. give me
a pointer to it.

Thanks in advance.
-)Bala.


At 03:11 PM 1/9/99 +0100, you wrote:
>Balaguru Nallathambi wrote:
>> 
>> HI,
>>         I have a SoundBlaster PCI 128. Does linux have support for this.
>> Are there any drivers for this card, which I can download.
>> 
>>         I compiled the kernel with the sound as a module.
>>         The kernel could not detect the sound card.
>
>CONFIG_EXPERIMENTAL=y
>CONFIG_SOUND_ES1371=y or m
>
>You need either 2.0.36 plus Alan Cox modular sound patch
>or 2.2.pre
>
>Tom
>
>
