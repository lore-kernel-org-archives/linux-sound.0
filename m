From: Alessandro Zummo <azummo@ita.flashnet.it>
Date: Mon, 13 Mar 2000 19:57:17 +0000
Subject: [PATCH] sb_card.c
MIME-Version: 1
Content-Type: multipart/mixed; boundary="BOUNDARY.145392192.4"
Message-Id: <marc-linux-sound-95310700302429@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
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


--BOUNDARY.145392192.4
Content-Type: text/plain


 Here is the announced patch.

 Changes:

 - Dropped support for AWE wavetable. The new awe_wave driver
  (0.4.4) supports pnp itself. I hope it will be included in the kernel.

 - Support for joystick dropped, it's not the place for it.

 - If a device is already active before the
 driver is loaded then it's current settings will
 be used. this will allow the user to manually configure
 each card via the /proc/isapnp interface if needed.

 - The card is leaved in an active state if it was already
active when the module was loaded.
 
We still have a problem when sb.o module isinserted/removed 
many times without removing sb_lib.o too: i get
the message too many mixer devices or something similar,
i hadn't the time to check it. 

Christoph, could you please check?


-- 

   - *Alex* -

  http://freepage.logicom.it/azummo/

-
To unsubscribe: mail -s unsubscribe sound-hackers-request@zabbo.net < /dev/null

*** End of forwarded message ***

-- 

   - *Alex* -

  http://freepage.logicom.it/azummo/

--BOUNDARY.145392192.4
Content-Type: text/plain; charset=iso-8859-1; name="sb_patch.2.3.51"
Content-Disposition: attachment; filename="sb_patch.2.3.51"
Content-Transfer-Encoding: quoted-printable

--- linux/drivers/sound/sb_card.c	Sat Mar 11 16:00:13 2000
+++ sb-linux/drivers/sound/sb_card.c	Mon Mar 13 22:48:46 2000
@@ -29,6 +29,10 @@
  * 13-02-2000 Hopefully fixed awe/sb16 related bugs, code cleanup
  *  Alessandro Zummo <azummo@ita.flashnet.it>
  *
+ * 13-03-2000 Added some more cards, thanks to Torsten Werner.
+ *  Removed joystick and wavetable code, there are better places for the=
m.
+ *  Code cleanup plus some fixes. =

+ *
  */
 =

 #include <linux/config.h>
@@ -145,10 +149,7 @@
 static struct address_info cfg_mpu;
 =

 struct pci_dev 	*sb_dev 	=3D NULL, =

-		*wss_dev	=3D NULL, =

-		*jp_dev		=3D NULL,
-		*mpu_dev	=3D NULL, =

-		*wt_dev		=3D NULL;
+		*mpu_dev	=3D NULL;
 /*
  *    Note DMA2 of -1 has the right meaning in the SB16 driver as well
  *    as here. It will cause either an error if it is needed or a fallba=
ck
@@ -166,10 +167,9 @@
 #if defined CONFIG_ISAPNP || defined CONFIG_ISAPNP_MODULE
 static int isapnp	=3D 1;
 static int isapnpjump	=3D 0;
-static int nosbwave	=3D 0;	/* This option will be removed when the new a=
we_wave driver will be
-				   in the kernel tree */
+static int activated	=3D 1;
 #else
-int isapnp	=3D 0;
+static int isapnp	=3D 0;
 #endif
 =

 MODULE_DESCRIPTION("Soundblaster driver");
@@ -187,10 +187,8 @@
 #if defined CONFIG_ISAPNP || defined CONFIG_ISAPNP_MODULE
 MODULE_PARM(isapnp,	"i");
 MODULE_PARM(isapnpjump,	"i");
-MODULE_PARM(nosbwave,	"i");
 MODULE_PARM_DESC(isapnp,	"When set to 0, Plug & Play support will be dis=
abled");
 MODULE_PARM_DESC(isapnpjump,	"Jumps to a specific slot in the driver's P=
nP table. Use the source, Luke.");
-MODULE_PARM_DESC(nosbwave,	"Disable SB AWE 32/64 Wavetable initializatio=
n. Use this option with the new awe_wave driver.");
 #endif
 =

 MODULE_PARM_DESC(io,		"Soundblaster i/o base address (0x220,0x240,0x260,=
0x280)");
@@ -213,12 +211,13 @@
 {
 	int err;
 =

+	/* Device already active? Let's use it */
+
 	if(dev->active)
 	{
-		printk(KERN_INFO "sb: %s %s already in use\n", devname, resname);
-		return(NULL);
+		activated =3D 0;
+		return(dev);
 	}
-
 	if((err =3D dev->activate(dev)) < 0)
 	{
 		printk(KERN_ERR "sb: %s %s config failed (out of resources?)[%d]\n", d=
evname, resname, err);
@@ -324,42 +323,6 @@
 	else
 		printk(KERN_ERR "sb: CMI8330 panic: mpu not found\n");
 =

-
-	/*  @P@:Gameport
-	 */
-
-	if((jp_dev =3D isapnp_find_dev(bus,
-		ISAPNP_VENDOR('@','P','@'), ISAPNP_FUNCTION(0x0001), NULL)))
-	{
-		jp_dev->prepare(jp_dev);
-
-		if((jp_dev =3D activate_dev("CMI8330", "gameport", jp_dev)))
-			show_base("CMI8330", "gameport", &jp_dev->resource[0]);
-	}
-	else
-		printk(KERN_ERR "sb: CMI8330 panic: gameport not found\n");
-
-	/*  @@@0001:OPL3 =

-	 */
-
-#if defined(CONFIG_SOUND_YM3812) || defined(CONFIG_SOUND_YM3812_MODULE)
-	if((wss_dev =3D isapnp_find_dev(bus,
-		ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001), NULL)))
-	{
-		wss_dev->prepare(wss_dev);
-
-		/* Let's disable IRQ and DMA for WSS device */
-
-		wss_dev->irq_resource[0].flags =3D 0;
-		wss_dev->dma_resource[0].flags =3D 0;
-
-		if((wss_dev =3D activate_dev("CMI8330", "opl3", wss_dev)))
-			show_base("CMI8330", "opl3", &wss_dev->resource[1]);
-	}
-	else
-		printk(KERN_ERR "sb: CMI8330 panic: opl3 not found\n");
-#endif
-
 	printk(KERN_INFO "sb: CMI8330 mail reports to Alessandro Zummo <azummo@=
ita.flashnet.it>\n");
 =

 	return(sb_dev);
@@ -391,7 +354,6 @@
 		}
 =

 		if(!sb_dev) return(NULL);
-
 	}
 	else
 		printk(KERN_ERR "sb: DT0197H panic: sb base not found\n");
@@ -399,7 +361,6 @@
 	/*  @X@0001:mpu
 	 */
 =

-#ifdef CONFIG_MIDI
 	if((mpu_dev =3D isapnp_find_dev(bus,
 				ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0001), NULL)))
 	{
@@ -413,171 +374,100 @@
 	}
 	else
 		printk(KERN_ERR "sb: DT0197H panic: mpu not found\n");
-#endif
-
-
-	/*  @P@:Gameport
-	 */
-
-	if((jp_dev =3D isapnp_find_dev(bus,
-				ISAPNP_VENDOR('@','P','@'), ISAPNP_FUNCTION(0x0001), NULL)))
-	{
-		jp_dev->prepare(jp_dev);
-
-		if((jp_dev =3D activate_dev("DT0197H", "gameport", jp_dev)))
-			show_base("DT0197H", "gameport", &jp_dev->resource[0]);
-	}
-	else
-		printk(KERN_ERR "sb: DT0197H panic: gameport not found\n");
-
-	/*  @H@0001:OPL3 =

-	 */
-
-#if defined(CONFIG_SOUND_YM3812) || defined(CONFIG_SOUND_YM3812_MODULE)
-	if((wss_dev =3D isapnp_find_dev(bus,
-				ISAPNP_VENDOR('@','H','@'), ISAPNP_FUNCTION(0x0001), NULL)))
-	{
-		wss_dev->prepare(wss_dev);
-
-		/* Let's disable IRQ and DMA for WSS device */
-
-		wss_dev->irq_resource[0].flags =3D 0;
-		wss_dev->dma_resource[0].flags =3D 0;
-
-		if((wss_dev =3D activate_dev("DT0197H", "opl3", wss_dev)))
-			show_base("DT0197H", "opl3", &wss_dev->resource[0]);
-	}
-	else
-		printk(KERN_ERR "sb: DT0197H panic: opl3 not found\n");
-#endif
 =

 	printk(KERN_INFO "sb: DT0197H mail reports to Torsten Werner <twerner@i=
ntercomm.de>\n");
 =

 	return(sb_dev);
 }
 =

-/* Specific support for awe will be dropped when:
- * a) The new awe_wawe driver with PnP support will be introduced in the=
 kernel
- * b) The joystick driver will support PnP - a little patch is available=
 from me....hint, hint :-)
- */
-
-static struct pci_dev *sb_init_awe(struct pci_bus *bus, struct pci_dev *=
card, struct address_info *hw_config, struct address_info *mpu_config)
+static struct pci_dev *sb_init_als(struct pci_bus *bus, struct pci_dev *=
card, struct address_info *hw_config, struct address_info *mpu_config)
 {
-	/*  CTL0042:Audio SB64
-	 *  CTL0031:Audio SB32
-	 *  CTL0045:Audio SB64
+	/* =

+	 * ALS 100
+	 * very similar to both ones above
+	 */
+
+	/*  @@@0001:Soundblaster.
 	 */
 =

-	if(	(sb_dev =3D isapnp_find_dev(bus, ISAPNP_VENDOR('C','T','L'), ISAPNP=
_FUNCTION(0x0042), NULL)) || =

-		(sb_dev =3D isapnp_find_dev(bus, ISAPNP_VENDOR('C','T','L'), ISAPNP_FU=
NCTION(0x0031), NULL)) ||
-		(sb_dev =3D isapnp_find_dev(bus, ISAPNP_VENDOR('C','T','L'), ISAPNP_FU=
NCTION(0x0045), NULL))	)
+	if((sb_dev =3D isapnp_find_dev(bus,
+				ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001), NULL)))
 	{
 		sb_dev->prepare(sb_dev);
 		=

-		if((sb_dev =3D activate_dev("AWE", "sb", sb_dev)))
+		if((sb_dev =3D activate_dev("ALS100", "sb", sb_dev)))
 		{
 			hw_config->io_base 	=3D sb_dev->resource[0].start;
 			hw_config->irq 		=3D sb_dev->irq_resource[0].start;
-			hw_config->dma 		=3D sb_dev->dma_resource[0].start;
-			hw_config->dma2 	=3D sb_dev->dma_resource[1].start;
-
-			mpu_config->io_base	=3D sb_dev->resource[1].start;
+			hw_config->dma 		=3D sb_dev->dma_resource[1].start;
+			hw_config->dma2 	=3D sb_dev->dma_resource[0].start;
 =

-			show_base("AWE", "sb",		&sb_dev->resource[0]);
-			show_base("AWE", "mpu", 	&sb_dev->resource[1]);
-			show_base("AWE", "opl3",	&sb_dev->resource[2]);
+			show_base("ALS100", "sb", &sb_dev->resource[0]);
 		}
-		else
-			return(NULL);
-	}
-	else
-		printk(KERN_ERR "sb: AWE panic: sb base not found\n");
-
 =

-	/*  CTL7002:Game SB64
-	 *  CTL7001:Game SB32
-	 */
-
-	if(	(jp_dev =3D isapnp_find_dev(bus, ISAPNP_VENDOR('C','T','L'), ISAPNP=
_FUNCTION(0x7002), NULL)) ||
-		(jp_dev =3D isapnp_find_dev(bus, ISAPNP_VENDOR('C','T','L'), ISAPNP_FU=
NCTION(0x7001), NULL)) )
-	{
-		jp_dev->prepare(jp_dev);
-		=

-		if((jp_dev =3D activate_dev("AWE", "gameport", jp_dev)))
-			show_base("AWE", "gameport", &jp_dev->resource[0]);
+		if(!sb_dev) return(NULL);
 	}
 	else
-		printk(KERN_ERR "sb: AWE panic: gameport not found\n");
-
+		printk(KERN_ERR "sb: ALS100 panic: sb base not found\n");
 =

-	/*  CTL0022:WaveTable SB64
-	 *  CTL0021:WaveTable SB32
-	 *  CTL0023:WaveTable Sb64
+	/*  @X@0001:mpu
 	 */
 =

-	if( nosbwave =3D=3D 0 &&
-   	( ( wt_dev =3D isapnp_find_dev(bus, ISAPNP_VENDOR('C','T','L'), ISAP=
NP_FUNCTION(0x0023), NULL)) ||
-	  ( wt_dev =3D isapnp_find_dev(bus, ISAPNP_VENDOR('C','T','L'), ISAPNP_=
FUNCTION(0x0022), NULL)) ||
-	  ( wt_dev =3D isapnp_find_dev(bus, ISAPNP_VENDOR('C','T','L'), ISAPNP_=
FUNCTION(0x0021), NULL)) ))
+	if((mpu_dev =3D isapnp_find_dev(bus,
+				ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0001), NULL)))
 	{
-		wt_dev->prepare(wt_dev);
-		=

-		if((wt_dev =3D activate_dev("AWE", "wavetable", wt_dev)))
+		mpu_dev->prepare(mpu_dev);
+
+		if((mpu_dev =3D activate_dev("ALS100", "mpu", mpu_dev)))
 		{
-			show_base("AWE", "wavetable", &wt_dev->resource[0]);
-			show_base("AWE", "wavetable", &wt_dev->resource[1]);
-			show_base("AWE", "wavetable", &wt_dev->resource[2]);
+			show_base("ALS100", "mpu", &mpu_dev->resource[0]);
+			mpu_config->io_base =3D mpu_dev->resource[0].start;
 		}
 	}
 	else
-		printk(KERN_ERR "sb: AWE panic: wavetable not found\n");
+		printk(KERN_ERR "sb: ALS100 panic: mpu not found\n");
 =

-	printk(KERN_INFO "sb: AWE mail reports to Alessandro Zummo <azummo@ita.=
flashnet.it>\n");
+	printk(KERN_INFO "sb: ALS100 mail reports to Torsten Werner <twerner@in=
tercomm.de>\n");
 =

 	return(sb_dev);
 }
 =

-#define SBF_DEV	0x01
-
+#define SBF_DEV	0x01 /* Please notice that cards without this flag set a=
re on top in the list */
 =

 static struct { unsigned short vendor, function, flags; struct pci_dev *=
 (*initfunc)(struct pci_bus *, struct pci_dev *, struct address_info *, s=
truct address_info *); char *name; }
-isapnp_sb_list[] __initdata =3D {
+sb_isapnp_list[] __initdata =3D {
+	{ISAPNP_VENDOR('C','M','I'), ISAPNP_FUNCTION(0x0001), 0,	&sb_init_cmi,	=
	"CMI 8330 SoundPRO" },
+	{ISAPNP_VENDOR('R','W','B'), ISAPNP_FUNCTION(0x1688), 0,	&sb_init_diamo=
nd,	"Diamond DT0197H" },
+	{ISAPNP_VENDOR('A','L','S'), ISAPNP_FUNCTION(0x0001), 0,	&sb_init_als,	=
	"ALS 100" },
 	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0001), SBF_DEV,	&sb_init=
_generic,	"Sound Blaster 16" },
 	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0031), SBF_DEV,	&sb_init=
_generic,	"Sound Blaster 16" },
 	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0041), SBF_DEV,	&sb_init=
_generic,	"Sound Blaster 16" },
 	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0042), SBF_DEV,	&sb_init=
_generic,	"Sound Blaster 16" },
 	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0043), SBF_DEV,	&sb_init=
_generic,	"Sound Blaster 16" },
 	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0045), SBF_DEV,	&sb_init=
_generic,	"Sound Blaster 16" },
-	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0044), 0,	&sb_init_awe,	=
	"Sound Blaster 32" },
-	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0039), 0,	&sb_init_awe,	=
	"Sound Blaster AWE 32" },
-	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x009D), 0,	&sb_init_awe,	=
	"Sound Blaster AWE 64" },
-	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x00C5), 0,	&sb_init_awe,	=
	"Sound Blaster AWE 64" },
-	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x00E4), 0,	&sb_init_awe,	=
	"Sound Blaster AWE 64" },
 	{ISAPNP_VENDOR('E','S','S'), ISAPNP_FUNCTION(0x0968), SBF_DEV,	&sb_init=
_ess,		"ESS 1688" },
 	{ISAPNP_VENDOR('E','S','S'), ISAPNP_FUNCTION(0x1868), SBF_DEV,	&sb_init=
_ess,		"ESS 1868" },
 	{ISAPNP_VENDOR('E','S','S'), ISAPNP_FUNCTION(0x8611), SBF_DEV,	&sb_init=
_ess,		"ESS 1868" },
 	{ISAPNP_VENDOR('E','S','S'), ISAPNP_FUNCTION(0x1869), SBF_DEV,	&sb_init=
_ess,		"ESS 1869" },
 	{ISAPNP_VENDOR('E','S','S'), ISAPNP_FUNCTION(0x1878), SBF_DEV,	&sb_init=
_ess,		"ESS 1878" },
 	{ISAPNP_VENDOR('E','S','S'), ISAPNP_FUNCTION(0x1879), SBF_DEV,	&sb_init=
_ess,		"ESS 1879" },
-	{ISAPNP_VENDOR('C','M','I'), ISAPNP_FUNCTION(0x0001), 0,	&sb_init_cmi,	=
	"CMI 8330 SoundPRO" },
-	{ISAPNP_VENDOR('R','W','B'), ISAPNP_FUNCTION(0x1688), 0,	&sb_init_diamo=
nd,	"Diamond DT0197H" },
 	{0}
 };
 =

-static int __init sb_init_isapnp(struct address_info *hw_config, struct =
address_info *mpu_config, struct pci_bus *bus, struct pci_dev *card, int =
slot)
+static int __init sb_isapnp_init(struct address_info *hw_config, struct =
address_info *mpu_config, struct pci_bus *bus, struct pci_dev *card, int =
slot)
 {
 	struct pci_dev *idev =3D NULL;
 =

 	/* You missed the init func? That's bad. */
-	if(isapnp_sb_list[slot].initfunc)
+	if(sb_isapnp_list[slot].initfunc)
 	{
-		char *busname =3D bus->name[0] ? bus->name : isapnp_sb_list[slot].name=
;
+		char *busname =3D bus->name[0] ? bus->name : sb_isapnp_list[slot].name=
;
 =

 		printk(KERN_INFO "sb: %s detected\n", busname); =

 =

 		/* Initialize this baby. */
 =

-		if((idev =3D isapnp_sb_list[slot].initfunc(bus, card, hw_config, mpu_c=
onfig)))
+		if((idev =3D sb_isapnp_list[slot].initfunc(bus, card, hw_config, mpu_c=
onfig)))
 		{
 			/* We got it. */
 =

@@ -602,12 +492,12 @@
    Should this be fixed? - azummo
 */
 =

-int __init sb_probe_isapnp(struct address_info *hw_config, struct addres=
s_info *mpu_config) =

+int __init sb_isapnp_probe(struct address_info *hw_config, struct addres=
s_info *mpu_config) =

 {
 	int i;
 =

-	/* Count entries in isapnp_sb_list */
-	for (i =3D 0; isapnp_sb_list[i].vendor !=3D 0; i++);
+	/* Count entries in sb_isapnp_list */
+	for (i =3D 0; sb_isapnp_list[i].vendor !=3D 0; i++);
 =

 	/* Check and adjust isapnpjump */
 	if( isapnpjump < 0 || isapnpjump > ( i - 1 ) )
@@ -616,18 +506,18 @@
 		isapnpjump =3D 0;
 	}
 	=

-	for (i =3D isapnpjump; isapnp_sb_list[i].vendor !=3D 0; i++) {
+	for (i =3D isapnpjump; sb_isapnp_list[i].vendor !=3D 0; i++) {
 =

-		if(!(isapnp_sb_list[i].flags & SBF_DEV))
+		if(!(sb_isapnp_list[i].flags & SBF_DEV))
 		{
 			struct pci_bus *bus =3D NULL;
 				=

 			while ((bus =3D isapnp_find_card(
-					isapnp_sb_list[i].vendor,
-					isapnp_sb_list[i].function,
+					sb_isapnp_list[i].vendor,
+					sb_isapnp_list[i].function,
 					bus))) {
 	=

-				if(sb_init_isapnp(hw_config, mpu_config, bus, NULL, i))
+				if(sb_isapnp_init(hw_config, mpu_config, bus, NULL, i))
 					return 0;
 			}
 		}
@@ -637,18 +527,18 @@
 	 *  that matches any entry marked with SBF_DEV in the table.
 	 */
 =

-	for (i =3D isapnpjump; isapnp_sb_list[i].vendor !=3D 0; i++) {
+	for (i =3D isapnpjump; sb_isapnp_list[i].vendor !=3D 0; i++) {
 =

-		if(isapnp_sb_list[i].flags & SBF_DEV)
+		if(sb_isapnp_list[i].flags & SBF_DEV)
 		{
 			struct pci_dev *card =3D NULL;
 =

 			while ((card =3D isapnp_find_dev(NULL,
-					isapnp_sb_list[i].vendor,
-					isapnp_sb_list[i].function,
+					sb_isapnp_list[i].vendor,
+					sb_isapnp_list[i].function,
 					card))) {
 =

-				if(sb_init_isapnp(hw_config, mpu_config, card->bus, card, i))
+				if(sb_isapnp_init(hw_config, mpu_config, card->bus, card, i))
 					return 0;
 			}
 		}
@@ -667,7 +557,7 @@
 	*/
 =

 #if defined CONFIG_ISAPNP || defined CONFIG_ISAPNP_MODULE			=

-	if(isapnp && (sb_probe_isapnp(&cfg, &cfg_mpu) < 0) ) {
+	if(isapnp && (sb_isapnp_probe(&cfg, &cfg_mpu) < 0) ) {
 		printk(KERN_NOTICE "sb_card: No ISAPnP cards found, trying standard on=
es...\n");
 		isapnp =3D 0;
 	}
@@ -709,11 +599,13 @@
 		unload_sbmpu(&cfg_mpu);
 	SOUND_LOCK_END;
 =

-	if(sb_dev)	sb_dev->deactivate(sb_dev);
-	if(jp_dev)	jp_dev->deactivate(jp_dev);
-	if(wt_dev)	wt_dev->deactivate(wt_dev);
-	if(mpu_dev)	mpu_dev->deactivate(mpu_dev);
-	if(wss_dev)	wss_dev->deactivate(wss_dev);
+#if defined CONFIG_ISAPNP || defined CONFIG_ISAPNP_MODULE			=

+	if(activated)
+	{
+		if(sb_dev) 	sb_dev->deactivate(sb_dev);
+		if(mpu_dev) 	mpu_dev->deactivate(mpu_dev);
+	}
+#endif
 }
 =

 module_init(init_sb);

--BOUNDARY.145392192.4--
