From: Zwane Mwaikambo <zwane@linux.realnet.co.sz>
Date: Mon, 03 Jun 2002 14:23:38 +0000
Subject: Re: isapnp problems with opl3sa2
Message-Id: <marc-linux-sound-102311592601240@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102310582924862@msgid-missing>
In-Reply-To: <marc-linux-sound-102310582924862@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 3 Jun 2002, Gerald Teschl wrote:

> the isapnp activation of this card fails (this has been broken ever 
> since the 2.4 series).So I did some investigations and eventually found 
> out that the reason is the following check from isapnp_check_dma(..) in 
> isapnp.c:

You should be able to load it without any parameters with ISAPNP, i have a 
box at home with that card which only requires a modprobe opl3sa2. Could 
you show me how you're loading it as well as dmesg and /proc/isapnp output 
after loading.

> A few further remarks concerning my patch:
> *) The patch also adds a line "opl3sa2_state[card].activated = 1" which 
> is an obvious omission in the original driver.

Thanks, put it right at the end before the return and i'll be happy.

> *) I have to force the driver to use both dma=0 and dma2=1. From what I
> understand dma=0 should be sufficient, but this will not work. Looks like
> a bug in isapnp.c to me. However, this should do no harm since according
> to /proc/isapnp, the card only offers these values anyway.

isapnp.c is fine

> -----------------------------------------------
> --- drivers/sound/opl3sa2.c.orig        Thu May  2 23:36:45 2002
> +++ drivers/sound/opl3sa2.c     Sun Jun  2 15:19:44 2002

When you rediff, can you diff so that the patch can be applied with a 
strip of '1' ie diff -u linux/drivers...

Cheers,
	Zwane Mwaikambo

-- 
http://function.linuxpower.ca
		


