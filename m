From: Gerald Teschl <gerald@esi.ac.at>
Date: Sun, 25 Aug 2002 11:29:50 +0000
Subject: Re: [PATCH] ad1848 infinite loop fix
Message-Id: <marc-linux-sound-103027503420527@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-103022452030488@msgid-missing>
In-Reply-To: <marc-linux-sound-103022452030488@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 25 Aug 2002, Zwane Mwaikambo wrote:

> 
> > --- linux-2.4.19/drivers/sound/ad1848.c.orig    Sat Aug 24 23:19:54 2002
> > +++ linux-2.4.19/drivers/sound/ad1848.c Sat Aug 24 23:20:58 2002
> > @@ -3058,7 +3058,7 @@
> >         else
> >                 printk(KERN_INFO "ad1848: Failed to initialize %s\n", 
> > devname);
> > 
> > -       return 0;
> > +       return -ENODEV;
> >  }
> > 
> >  static int __init ad1848_isapnp_probe(struct address_info *hw_config)
> 
> This will break the isapnp probe in ad1848, the problem could possibly be 
> elsewhere. You have to be a bit careful when changing the return values of 
> functions in some of the older OSS code.
> 
I just looked into some of the other drivers and they also use "return 0"
in case of failure. So you are right, this is not the proper
way to fix this! But this means that there are some generic problems
with the loading of kernel modules!?

If I use "return -ENODEV" the module will do the init stuff, fail, and
thats it. With the original "return 0" the module will do the init
stuff in an infinite loop. I do not think this is a problem inside
the module since it looks like the main init function gets
called over and over again (blocking the kernel and hence freezing
the system).

Gerald

