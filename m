From: Bill Nottingham <notting@redhat.com>
Date: Thu, 11 Mar 1999 06:10:13 +0000
Subject: Re: solo-1 chip
Message-Id: <marc-linux-sound-92113283024701@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92066824429576@msgid-missing>
In-Reply-To: <marc-linux-sound-92066824429576@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dan Boger (dan@giccs.georgetown.edu) said: 
>   Anyone have any luck configuring kernel 2.2.2 to work with the
> solo-1 chip (on the motherboard)? I can get it to work with the sb
> driver, but only in 8-bit mode.  WSS driver seems to be able to access 
> it, but I can't think of a way to figure out the IRQ/DMA for it.

To get native ESS Solo support ATM, you'd either have to use the
2.2.*-ac patches (ftp.linux.org.uk:/pub/linux/alan/2.2), or ALSA
(http://alsa.jcu.cz/)

Bill
