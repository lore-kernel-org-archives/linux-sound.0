From: Alessandro Zummo <azummo@ita.flashnet.it>
Date: Sun, 05 Mar 2000 14:24:20 +0000
Subject: [PATCH] PNP quirks
MIME-Version: 1
Content-Type: multipart/mixed; boundary="BOUNDARY.146241192.14"
Message-Id: <marc-linux-sound-95227016421731@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95227016321725@msgid-missing>
In-Reply-To: <marc-linux-sound-95227016321725@msgid-missing>
To: linux-sound@vger.kernel.org

Warning: This is a message in MIME format. Your mail reader does not
support MIME. Some parts of this message will be readable as plain text.
To see the rest, you will need to upgrade your mail reader. Following are
some URLs where you can find MIME-capable mail programs for common platforms:

  Amiga............: YAM          http://www.yam.ch/
  Unix.............: Metamail     ftp://ftp.bellcore.com/nsb/
  Windows/Macintosh: Eudora       http://www.qualcomm.com/

General info about MIME can be found at:

http://www.cis.ohio-state.edu/hypertext/faq/usenet/mail/mime-faq/top.html


--BOUNDARY.146241192.14
Content-Type: text/plain


 Here is a patch which solves some troubles with the CMI8330
 sound card.

 Patch is against 2.3.49.

 sorry..i always forget to include the patch in the mail *:-)
-- 

   - *Alex* -

  http://freepage.logicom.it/azummo/

--BOUNDARY.146241192.14
Content-Type: text/plain; charset=iso-8859-1; name="patch-cmi"
Content-Disposition: attachment; filename="patch-cmi"
Content-Transfer-Encoding: quoted-printable

--- linux/drivers/sound/sb_card.c	Mon Feb 28 21:18:09 2000
+++ sb-linux/drivers/sound/sb_card.c	Sun Mar  5 16:13:15 2000
@@ -290,29 +290,8 @@
 	if((sb_dev =3D isapnp_find_dev(bus,
 		ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0001), NULL)))
 	{
-#ifdef CMI8330_DMA0BAD
-		int dmahack =3D 0;
-#endif
 		sb_dev->prepare(sb_dev);
 		=

-		/*  This device doesn't work with DMA 0, so we must allocate
-		 *  it to prevent PnP routines to assign it to the card.
-		 *
-		 *  I know i could have inlined the following lines, but it's cleaner
-		 *  this way.
-		 */
-	=

-#ifdef CMI8330_DMA0BAD
-		if(sb_dev->dma_resource[0].start =3D=3D 0)
-		{
-			if(!request_dma(0, "cmi8330 dma hack"))
-			{
-				/* DMA was free, we now have it */
-				dmahack =3D 1;
-			}
-		}
-#endif
-
 		if((sb_dev =3D activate_dev("CMI8330", "sb", sb_dev)))
 		{
 			hw_config->io_base 	=3D sb_dev->resource[0].start;
@@ -323,9 +302,6 @@
 			show_base("CMI8330", "sb", &sb_dev->resource[0]);
 		}
 =

-#ifdef CMI8330_DMA0BAD
-		if(dmahack) free_dma(0);
-#endif
 		if(!sb_dev) return(NULL);
 	}
 	else
--- linux/drivers/pnp/quirks.c	Mon Feb 28 21:16:56 2000
+++ sb-linux/drivers/pnp/quirks.c	Sun Mar  5 15:56:48 2000
@@ -45,7 +45,26 @@
 		port3->min +=3D 0x800;
 		port3->max +=3D 0x800;
 	}
	printk(KERN_INFO "ISAPnP: AWE32 quirk - adding two ports\n");
+}
+
+static void __init quirk_cmi8330_resources(struct pci_dev *dev)
+{
+	struct isapnp_resources *res =3D dev->sysdata;
+
+	for ( ; res ; res =3D res->alt ) {
+
+		struct isapnp_irq *irq;
+		struct isapnp_dma *dma;
+	=

+		for( irq =3D res->irq; irq; irq =3D irq->next )	// Valid irqs are 5, 7=
, 10
+			irq->map =3D 0x04A0;						// 0000 0100 1010 0000
+
+		for( dma =3D res->dma; dma; dma =3D dma->next ) // Valid 8bit dma chan=
nels are 1,3
+			if( ( dma->flags & IORESOURCE_DMA_TYPE_MASK ) =3D=3D IORESOURCE_DMA_8=
BIT )
+				dma->map =3D 0x000A;
+	}
+	printk(KERN_INFO "isapnp: CMI8330 quirk - fixing interrupts and dma\n")=
;
 }
 =

 =

@@ -61,6 +80,8 @@
 		quirk_awe32_resources },
 	{ ISAPNP_VENDOR('C','T','L'), ISAPNP_DEVICE(0x0023),
 		quirk_awe32_resources },
+	{ ISAPNP_VENDOR('@','X','@'), ISAPNP_DEVICE(0x0001), // CMI8330 =

+		quirk_cmi8330_resources },
 	{ 0 }
 };

--BOUNDARY.146241192.14--
