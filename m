From: "Jaakko Niemi" <liiwi@lonesom.pp.fi>
Date: Mon, 14 Sep 1998 15:08:25 +0000
Subject: Re: Desperately Seeking *#$^@^@% AWE64 Help :)
Message-Id: <marc-linux-sound-90579201028828@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90573905510932@msgid-missing>
In-Reply-To: <marc-linux-sound-90573905510932@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


>> pnp configured by changing the dump of pnpdump and uncommenting the right
>> lines plus adding 2 for the wavetable stuff. isapnp is seemingly happy and
>> gives me a single line responce with a bunch of hex numbers and so on.

 Ok, lets check couple of things.. 

 Isapnp outputs something like this:

Board 1 has Identity 7f 0c 86 2c bd 9e 00 8c 0e:  CTL009e Serial No
210119869 [checksum 7f]

 ? 

 What do cat /dev/sndstat , cat /proc/interrupts etc. show after this ?

 I need to put the following in /etc/conf.modules to get things going:

alias char-major-14 sb
alias sound sb
options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330

>> modprobe sound seems to work. it doesn't whine but neither does it produce
>> any output.

 Try cat /dev/sndstat after that.

	--j
