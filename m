From: Bill Nottingham <notting@redhat.com>
Date: Mon, 10 May 1999 14:59:09 +0000
Subject: Re: SB16 pnp
Message-Id: <marc-linux-sound-92634814308600@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92629686810981@msgid-missing>
In-Reply-To: <marc-linux-sound-92629686810981@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

chin hooi chee (hcchin@csam.com.my) said: 
> Board 1 has Identity d7 00 00 15 f5 24 00 8c 0e:  CTL0024 Serial No 5621 [checksum d7]
> CTL0024/5621[0]{Audio               }: Ports 0x220 0x330 0x388; IRQ5 DMA1 DMA5 --- Enabled OK
> 
> % lsmod 
> BUT
> % cat /dev/sndstat
> 
> Sound Driver:3.5.4-960630 (Tue Mar 2 05:22:12 SGT 1999 root,

You need to run isapnp *before* loading the module. Also, 
since you're using an older driver, what settings did you
compile into the kernel for the module?

Bill
