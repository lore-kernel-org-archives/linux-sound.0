From: shaleh@clifford.livenet.net
Date: Fri, 11 Jun 1999 16:17:34 +0000
Subject: Re: Module vs INTO KERNEL ?
Message-Id: <marc-linux-sound-92911681507755@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92911616207004@msgid-missing>
In-Reply-To: <marc-linux-sound-92911616207004@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> 
> Dear All,
> 
>         First, I compile sound as a module for a while (ethernet, some fs,
>     and almost as a module) but right now, I want to compile all of its that
>     I frequently use into kernel.
>         All of others is fine except sound :(
>         I don't know why, I just change <M> to <*> and specific the IRQ, DMA
>     at Sound section of 'make menuconfig'
> 
>         There's no /dev/mixer, /dev/dsp nothing except /proc/sound.
> 

Sound is best left as a module.  There is no reason to include it and it will
likely help make your kernel too large to compile.  Modules are your friend.
