From: Christoph Hellwig <chhellwig@gmx.net>
Date: Thu, 09 Mar 2000 14:07:51 +0000
Subject: Re: mad16 & ad1848 problems in kernel 2.3.50.
Message-Id: <marc-linux-sound-95261137204527@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, Mar 09, 2000 at 02:09:51PM +0100, Diego Liziero wrote:
> 
> Kernel 2.3.50
> depmod: *** Unresolved symbols in /lib/modules/2.3.50/misc/mad16.o
> depmod:         exit_mad16
> 
> I got the symbol resolved with this patch:
> 
> --- mad16.c.2.3.50.original	Thu Mar  9 11:59:38 2000
> +++ mad16.c	Thu Mar  9 12:00:08 2000
> @@ -1098,7 +1098,7 @@
>  	return 0;
>  }
>  
> -static void __exit cleanup_mad16(void)
> +static void __exit exit_mad16(void)
>  {
>  	if (found_mpu)
>  		unload_mad16_mpu(&cfg_mpu);

Ok, but module_exit needs to be adjusted, too.

> 
> But when I issue a modprobe mad16 I get the following error:
> 
> MSS: I/O port conflict
> /lib/modules/2.3.50/misc/ad1848.o: init_module: Device or resource busy
> /lib/modules/2.3.50/misc/ad1848.o: insmod /lib/modules/2.3.50/misc/ad1848.o failed
> /lib/modules/2.3.50/misc/ad1848.o: insmod mad16 failed
> 
> If I use the ad1848.o of a 2.3.49 kernel all works fine.

Hmm, with ad1848 something seems to be not ok, I'll look at it ...

Christoph

-- 
Always remember that you are unique.  Just like everyone else.
