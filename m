From: Gerald Teschl <gerald@esi.ac.at>
Date: Thu, 06 Jun 2002 19:01:17 +0000
Subject: [PATCH] unregister YMH0021 from ad1848
Message-Id: <marc-linux-sound-102339013507846@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


This is the last of my patches which ensure that an opl3sax
based sound card will work out of the box on a fresh
linux installation:

Since the main driver for opl3sax cards (YMH0021) is opl3sa2
I have commented the YMH0021 entry in the MODULE_DEVICE_TABLE
in ad1848.c. Otherwise both ad1848 and opl3sa2 will be listed
in modules.isapnpmap and tools like sndconfig will setup the
card using ad1848 instead of opl3sa2.


I have tested this and it causes no problems (this is the output
when using all patches together):

isapnp: Scanning for PnP cards...
isapnp: opl3sa4 quirk: Allowing dma 0.
isapnp: Card 'YAMAHA OPL3-SAx Audio System'
isapnp: 1 Plug & Play card detected total
ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996
ad1848: OPL3-SA2 WSS mode detected
ad1848: ISAPnP reports 'OPL3-SA2 WSS mode' at i/o 0x530, irq 5, dma 0, 1
opl3sa2: chipset version = 0x4
opl3sa2: Found OPL3-SA3 (YMF715E or YMF719E)
opl3sa2: 1 PnP card(s) found.

--- linux.orig/drivers/sound/ad1848.c	Thu Jun  6 18:04:44 2002
+++ linux/drivers/sound/ad1848.c	Thu Jun  6 20:09:32 2002
@@ -2979,8 +2979,10 @@
 		ISAPNP_VENDOR('C','S','C'), ISAPNP_FUNCTION(0x0000), 0 },
         {       ISAPNP_ANY_ID, ISAPNP_ANY_ID,
 		ISAPNP_VENDOR('C','S','C'), ISAPNP_FUNCTION(0x0100), 0 },
+/*	The main driver for this card is opl3sa2
         {       ISAPNP_ANY_ID, ISAPNP_ANY_ID,
 		ISAPNP_VENDOR('Y','M','H'), ISAPNP_FUNCTION(0x0021), 0 },
+*/
 	{0}
 };
 

