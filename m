From: "Woller, Thomas" <twoller@crystal.cirrus.com>
Date: Fri, 06 Apr 2001 18:47:11 +0000
Subject: RE: please help me with my ibm 600E
Message-Id: <marc-linux-sound-98658291808607@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-98657921629218@msgid-missing>
In-Reply-To: <marc-linux-sound-98657921629218@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

use the cs46xx driver.  i wonder why the SuSE detection and installation
fails. that is a mystery.   but let SuSE use the cs46xx driver if it tries
to.

the final 2.4.0 has support for the cs46xx series, but Power management has
been added later in post 2.4.0. the driver should work fine on the cs4610
controller +cs4239 codec in that system. i don't have one so i can not test
that ibm model.  go to www.cirrus.com for the driver and instructions on
installing. if you have any questions please ask me, be glad to help.  the
website has been up and down, so if you can not get from the site, email me
and i will send to you directly.
tom

Tom Woller
Senior Systems Engineer (Linux)
Cirrus Logic Corp
twoller@crystal.cirrus.com

> -----Original Message-----
> From:	Lee Leahu [SMTP:lee@ricis.com]
> Sent:	Friday, April 06, 2001 12:44 PM
> To:	Linux-Sound-ML
> Subject:	please help me with my ibm 600E
> 
> hello everyone
> 
> i have an IBM 600E laptop with SuSE 7.1 kernel 2.4.0-4GB installed.
> i want to get my soundcard working, but am having troubles.
> 
> i went to the ibm website and they say to use the cs4232 modules for
> sound.
> SuSE detects a cs4610 and wants to use a cs461x sound moudles.
> others have said to use the cs4239 module.
> 
> i've decided to go with ibm's recommendation - they built this machine.
> 
> when i try to do a modprobe snd-card-cs4232 this is what i get:
> 
> -- (snip) --
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: init_module: No such device
> Hint: insmod errors can be caused by incorrect module parameters,
> including invalid IO or IRQ parameters
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: insmod
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o failed
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: insmod snd-card-cs4232
> failed
> -- (snip) --
> 
> 
> now when i do a insmod snd-card-cs4232 then i get this:
> 
> -- (snip) --
> Using /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> isapnp_resource_change
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_card_unregister
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_register_interrupt
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_register_ioport
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_kcalloc
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_register_dma_channel
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> isapnp_find_card
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_opl3_new
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_unregister_ioports
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_mpu401_uart_interrupt
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> isapnp_find_dev
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> _snd_kfree
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_card_register
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_cs4231_new_pcm
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_cs4231_interrupt
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_cs4231_new_mixer
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_card_free
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_card_new
> /lib/modules/2.4.0-4GB/misc/snd-card-cs4232.o: unresolved symbol
> snd_mpu401_uart_new   
> -- (snip) --
> 
> i don't know what to do - can somebody please help me?
> 
> thanx in advance,
> -- 
> Lee Leahu <lee@ricis.com>,
> System Admin,
> Web Developer,
> RICIS Inc,
> (708) 444-2690 (Work)
> (708) 467-2044 (Pager)
> -
> To unsubscribe from this list: send the line "unsubscribe linux-sound" in
> the body of a message to majordomo@vger.kernel.org
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
