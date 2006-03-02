From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Date: Thu, 02 Mar 2006 23:09:32 +0000
Subject: [PATCH 4/9] opl3sa2: adjust pnp_register_driver signature
Message-Id: <200603021609.32770.bjorn.helgaas@hp.com>
List-Id: <linux-sound.vger.kernel.org>
References: <200603021601.27467.bjorn.helgaas@hp.com>
In-Reply-To: <200603021601.27467.bjorn.helgaas@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Belay <ambx1@neo.rr.com>
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@suse.cz>, Matthieu Castet <castet.matthieu@free.fr>, Li Shaohua <shaohua.li@intel.com>, Andrew Morton <akpm@osdl.org>, Zwane Mwaikambo <zwane@arm.linux.org.uk>, linux-sound@vger.kernel.org

Remove the assumption that pnp_register_driver() returns the number of
devices claimed.

Signed-off-by: Bjorn Helgaas <bjorn.helgaas@hp.com>

Index: work-mm4/sound/isa/opl3sa2.c
=================================--- work-mm4.orig/sound/isa/opl3sa2.c	2006-02-01 16:24:54.000000000 -0700
+++ work-mm4/sound/isa/opl3sa2.c	2006-02-15 10:11:17.000000000 -0700
@@ -95,6 +95,7 @@
 static int pnp_registered;
 static int pnpc_registered;
 #endif
+static unsigned int snd_opl3sa2_devices;
 
 /* control ports */
 #define OPL3SA2_PM_CTRL		0x01
@@ -760,6 +761,7 @@
 	}
 	pnp_set_drvdata(pdev, card);
 	dev++;
+	snd_opl3sa2_devices++;
 	return 0;
 }
 
@@ -826,6 +828,7 @@
 	}
 	pnp_set_card_drvdata(pcard, card);
 	dev++;
+	snd_opl3sa2_devices++;
 	return 0;
 }
 
@@ -944,7 +947,7 @@
 
 static int __init alsa_card_opl3sa2_init(void)
 {
-	int i, err, cards = 0;
+	int i, err;
 
 	if ((err = platform_driver_register(&snd_opl3sa2_nonpnp_driver)) < 0)
 		return err;
@@ -962,23 +965,19 @@
 			goto errout;
 		}
 		platform_devices[i] = device;
-		cards++;
+		snd_opl3sa2_devices++;
 	}
 
 #ifdef CONFIG_PNP
 	err = pnp_register_driver(&opl3sa2_pnp_driver);
-	if (err >= 0) {
+	if (!err)
 		pnp_registered = 1;
-		cards += err;
-	}
 	err = pnp_register_card_driver(&opl3sa2_pnpc_driver);
-	if (err >= 0) {
+	if (!err)
 		pnpc_registered = 1;
-		cards += err;
-	}
 #endif
 
-	if (!cards) {
+	if (!snd_opl3sa2_devices) {
 #ifdef MODULE
 		snd_printk(KERN_ERR "Yamaha OPL3-SA soundcard not found or device busy\n");
 #endif
