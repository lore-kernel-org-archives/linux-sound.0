From: Zwane Mwaikambo <zwane@linux.realnet.co.sz>
Date: Tue, 04 Jun 2002 17:33:41 +0000
Subject: Re: [PATCH] opl3sa2 isapnp activation fix
Message-Id: <marc-linux-sound-102321374217698@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102320707510070@msgid-missing>
In-Reply-To: <marc-linux-sound-102320707510070@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 4 Jun 2002, Gerald Teschl wrote:

> >>Oops, that won't work on isapnp since dma = dma2 = -1 at this stage, how 
> >>about;
> >>
> >>if ((dma != -1) && (dma2 != -1)) frob();
> >>
> I don't get what you mean? I tested this, if I do "modprobe opl3sa2 
> dma=1 dma2=3" it will activate
> the card with dma 1,3 (according to /proc/isapnp). However, my card will 
> not work with these values.

How about this, you check if the resource register reads 0 for the DMA 
value and you reassign it using the resource registers, that way you skip 
on using magic values.

Cheers,
	Zwane

-- 
http://function.linuxpower.ca
		





