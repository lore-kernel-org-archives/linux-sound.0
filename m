From: Andrew Friedley <saai@swbell.net>
Date: Fri, 26 Jul 2002 20:32:49 +0000
Subject: sb driver only accepts 16 bit dma channels 5,6,7
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary_(ID_MXdFHZkvqvW65JtDDCSJYw)"
Message-Id: <marc-linux-sound-102771552908379@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.

--Boundary_(ID_MXdFHZkvqvW65JtDDCSJYw)
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT

I'm not subscribed to this list, id appreciate it if replies were CC'd to
me.

I have a ISA soundblaster (vibra) 16.  By default it uses DMA 3 for its 16
bit dma channel.  For some reason the oss sb.o driver included in the kernel
only accepts 16 bit dma values of 5, 6, or 7.  Using the isapnp support in
the 2.4 kernel, the driver accepts dma 3 as detected by isapnp.  But, when
dma 3 is given as the 16 bit dma channel on the kernel command line, the sb
driver rejects it and no 16 bit dma channel is set up.

I have attached a patch, made against 2.4.19rc3, which makes the sb driver
accept any DMA channel number for the 16 bit channel.  This patch works for
me on my system.

Thanks,

Andrew Friedley

--Boundary_(ID_MXdFHZkvqvW65JtDDCSJYw)
Content-type: application/octet-stream; name=sb_common.diff
Content-transfer-encoding: quoted-printable
Content-disposition: attachment; filename=sb_common.diff

diff -Naur linux-2.4.19rc3/drivers/sound/sb_common.c =
linux-2.4.19rc3-mod/drivers/sound/sb_common.c=0A=
--- linux-2.4.19rc3/drivers/sound/sb_common.c	2002-07-26 =
15:13:58.000000000 -0500=0A=
+++ linux-2.4.19rc3-mod/drivers/sound/sb_common.c	2002-07-26 =
13:05:20.000000000 -0500=0A=
@@ -801,11 +801,11 @@=0A=
 =0A=
 			if (hw_config->dma2 =3D=3D -1)=0A=
 				devc->dma16 =3D devc->dma8;=0A=
-			else if (hw_config->dma2 < 5 || hw_config->dma2 > 7)=0A=
-			{=0A=
-				printk(KERN_WARNING  "SB16: Bad or missing 16 bit DMA channel\n");=0A=
-				devc->dma16 =3D devc->dma8;=0A=
-			}=0A=
+//			else if (hw_config->dma2 < 5 || hw_config->dma2 > 7)=0A=
+//			{=0A=
+//				printk(KERN_WARNING  "SB16: Bad or missing 16 bit DMA channel\n");=0A=
+//				devc->dma16 =3D devc->dma8;=0A=
+//			}=0A=
 			else=0A=
 				devc->dma16 =3D hw_config->dma2;=0A=
 =0A=

--Boundary_(ID_MXdFHZkvqvW65JtDDCSJYw)--
