From: Zwane Mwaikambo <zwane@linuxpower.ca>
Date: Sun, 25 Aug 2002 10:59:43 +0000
Subject: Re: [PATCH] ad1848 infinite loop fix
Message-Id: <marc-linux-sound-103027318319774@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-103022452030488@msgid-missing>
In-Reply-To: <marc-linux-sound-103022452030488@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


> --- linux-2.4.19/drivers/sound/ad1848.c.orig    Sat Aug 24 23:19:54 2002
> +++ linux-2.4.19/drivers/sound/ad1848.c Sat Aug 24 23:20:58 2002
> @@ -3058,7 +3058,7 @@
>         else
>                 printk(KERN_INFO "ad1848: Failed to initialize %s\n", 
> devname);
> 
> -       return 0;
> +       return -ENODEV;
>  }
> 
>  static int __init ad1848_isapnp_probe(struct address_info *hw_config)

This will break the isapnp probe in ad1848, the problem could possibly be 
elsewhere. You have to be a bit careful when changing the return values of 
functions in some of the older OSS code.

	Zwane

-- 
function.linuxpower.ca


