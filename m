From: =?iso-8859-1?Q?J=E9r=F4me=20Aug=E9?= <jauge@club-internet.fr>
Date: Thu, 04 Oct 2001 17:11:14 +0000
Subject: Re: Problems recording sound with ISAPnp Soundcard since Kernel-2.4.x
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------2FD00B594C1A7117790A5931"
Message-Id: <marc-linux-sound-100221537811476@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-100220329623616@msgid-missing>
In-Reply-To: <marc-linux-sound-100220329623616@msgid-missing>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------2FD00B594C1A7117790A5931
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Magic Phibo wrote:
>=20
> Hello
>=20
> Sorry, if this mail arrives twice ...
>=20
> Since upgrade to Kernel-2.4.x (currently 2.4.10) I got problems recording=
 sound
> causing following error message in /var/log/messages:
>=20
> Sep 30 15:53:16 osiris kernel: Sound: DMA (input) timed out - IRQ/DRQ con=
figerror?
>=20
> It's a redhat dist. (7.0) with a Yamaha ISAPnp Soundcard (OPL3 YMF719) an=
d a
> self configured Kernel-2.4.10.
>=20
> [...]
>=20

I also noticed this problem ...
There is a problem with the initialization of the DMA channels (dma and
dma2 are never set to the real dma channels, and they remain at -1).
Applying this patch fix this error.

I'm going to post it to the kernel mailling list.

--=20
J=E9r=F4me Aug=E9
--------------2FD00B594C1A7117790A5931
Content-Type: text/plain; charset=us-ascii;
 name="patch-opl3sa2-dma-init"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-opl3sa2-dma-init"

diff -ur linux.orig/drivers/sound/opl3sa2.c linux/drivers/sound/opl3sa2.c
--- linux.orig/drivers/sound/opl3sa2.c	Wed Oct  3 09:36:16 2001
+++ linux/drivers/sound/opl3sa2.c	Wed Oct  3 09:41:28 2001
@@ -862,9 +862,9 @@
 
 	/* Our own config: */
 	hw_cfg->io_base = dev->resource[4].start;
-	hw_cfg->irq     = 0;
-	hw_cfg->dma     = -1;
-	hw_cfg->dma2    = -1;
+	hw_cfg->irq     = dev->irq_resource[0].start;
+	hw_cfg->dma     = dev->dma_resource[0].start;
+	hw_cfg->dma2    = dev->dma_resource[1].start;
 	
 	/* The MSS config: */
 	mss_cfg->io_base      = dev->resource[1].start;
@@ -944,9 +944,9 @@
 			 *  give pretty output from conf_printf. :)
 			 */
 			cfg[card].io_base = io;
-			cfg[card].irq     = 0;
-			cfg[card].dma     = -1;
-			cfg[card].dma2    = -1;
+			cfg[card].irq     = irq;
+			cfg[card].dma     = dma;
+			cfg[card].dma2    = dma2;
 	
 			/* The MSS config: */
 			cfg_mss[card].io_base      = mss_io;

--------------2FD00B594C1A7117790A5931--

