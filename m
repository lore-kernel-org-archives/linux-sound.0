From: Per von Zweigbergk <pvz@linux.se>
Date: Sun, 27 May 2001 11:17:35 +0000
Subject: Re: ESS1878
Message-Id: <marc-linux-sound-99096422101798@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-99091993318702@msgid-missing>
In-Reply-To: <marc-linux-sound-99091993318702@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sat, May 26, 2001 at 07:22:53PM -0400, Burton Windle wrote:
> Hello. I have recently acquired a fairly old laptop (Compaq Armada
> 1590DMT; Pentium 166MMX, 16mb ram, etc).  I currently run Debian Woody on
> it, and am using the 2.4.5 kernel. I am attempting to get sound working on
> this machine. According to Compaq, this machine uses an ESS1878 sound
> chip. I didn't see that option in menuconfig, but a grep of the kernel
> source does make it seem like it can be supported. However, I don't have
> the foggiest idea how. It doesn't showup if I do a 'pnpdump', and I don't
> see anything in /proc/pci that looks familar either. 
> 
> Where do I begin?

Try using the sb driver. Worked for me on my Lifetec LT 9888 notebook.

Also try searching the web for information about your laptop.
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
