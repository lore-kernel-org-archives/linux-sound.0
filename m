From: =?iso-8859-1?Q?J=E9r=F4me=20Aug=E9?= <jauge@club-internet.fr>
Date: Sun, 16 Jul 2000 21:27:28 +0000
Subject: Re: "noise" while recording with an OPL3SAx
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------4B0A7C1F6B2ABD21B945E83C"
Message-Id: <marc-linux-sound-96378303312317@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96376558726822@msgid-missing>
In-Reply-To: <marc-linux-sound-96376558726822@msgid-missing>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------4B0A7C1F6B2ABD21B945E83C
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Rainer Wiener wrote:
> 
> Hi I.S.Wolfe!
> 
> On Sun, 16 Jul 2000, I.S.Wolfe@happy-man.com wrote:
> 
> > I'm unfamiliar with both your Satellite and your
> > Red Hat, so perhaps I should keep my mouth shut.
> > But the combination you describe makes me think of
> > how Alsa mutes the mike (and everything else) and
> > OSS (I think) doesn't, so if your machine has a
> > built-in mike, you may be mixing in computer and
> > other background noises without realizing it, until
> > you run Alsa and it mutes the mike.  If I'm write,
> > setting a mute mike with aumix, say, doing a save
> > there, and then running aumix -L when you log in,
> > might solve the problem.
> 
> Yes, the problem is also there. I have an external mic and even when I plug
> it out and record something from my MD I have the same noises. So it would
> not be the mic. At the first time I thought it was the mic but this is not so.
> 

I thought it was a problem with some input level/gain but when sampling
my voice, for example, and then later listening at it I could hear my
voice + some "scratch" noises.
This is a quick patch based on comparison between OSS and Alsa driver
initialization. I'm not an expert with kernel/sound programming so test
this patch and tell me if I'm wrong somewhere ...

I tested it with kernel 2.2.14 and 2.4.0-test4.
--------------4B0A7C1F6B2ABD21B945E83C
Content-Type: text/plain; charset=us-ascii;
 name="patch-2.4.0-test4-opl3sa2-dma-init"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-2.4.0-test4-opl3sa2-dma-init"

diff -u --recursive linux-2.4.0-test4.orig/drivers/sound/opl3sa2.c linux-2.4.0-test4/drivers/sound/opl3sa2.c
--- linux-2.4.0-test4.orig/drivers/sound/opl3sa2.c	Tue Mar  7 22:40:24 2000
+++ linux-2.4.0-test4/drivers/sound/opl3sa2.c	Sun Jul 16 17:50:05 2000
@@ -598,6 +598,15 @@
    	request_region(hw_config->io_base, 2, chipset_name);
 
 	devc->cfg_port = hw_config->io_base;
+
+	/*printk("OPL3-SAx dma init  ...");*/
+	if( hw_config->dma == hw_config->dma2 ) {
+		/*printk(" DMA1=DMA2=%d\n", hw_config->dma );*/
+		opl3sa2_write(devc->cfg_port, 0x06, 0x03);
+	} else {
+		/*printk(" DMA1=%d DMA2=%d\n", hw_config->dma, hw_config->dma2);*/
+		opl3sa2_write(devc->cfg_port, 0x06, 0x21);
+	}
 }
 
 


--------------4B0A7C1F6B2ABD21B945E83C--
