From: Mattia Monga <monga@debian.org>
Date: Sat, 20 Oct 2001 15:20:05 +0000
Subject: Bug#116378: kernel-source-2.4.12: nm256 driver does not support NeoMagic 256XL
Message-Id: <marc-linux-sound-100359229107557@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Package: kernel-source-2.4.12
Version: 2.4.12-1
Severity: wishlist
Tags: patch

nm256_audio.c is not able to deal with NeoMagic 256XL. This chipset, however, 
is fully compatible with the 256ZX, supported by the driver. Therefore, I'm
sending you this patch to enable the use of NeoMagic 256XL audio chipsets (I
have one in my Sharp PC-A810 laptop)
 
Cheers, 

Mattia Monga

-- cut here --

--- /usr/src/kernel-source-2.4.12.orig/drivers/sound/nm256.h	Mon Oct 25 17:26:52 1999
+++ /usr/src/kernel-source-2.4.12/drivers/sound/nm256.h	Sat Oct 20 10:17:26 2001
@@ -5,7 +5,7 @@
 
 /* The revisions that we currently handle.  */
 enum nm256rev {
-    REV_NM256AV, REV_NM256ZX
+    REV_NM256AV, REV_NM256ZX, REV_NM256XL
 };
 
 /* Per-card structure. */
--- /usr/src/kernel-source-2.4.12.orig/drivers/sound/nm256_audio.c	Sun Sep 30 21:26:08 2001
+++ /usr/src/kernel-source-2.4.12/drivers/sound/nm256_audio.c	Sat Oct 20 10:02:21 2001
@@ -17,6 +17,8 @@
  *		Added some __init
  * 19-04-2001	Marcus Meissner <mm@caldera.de>
  *		Ported to 2.4 PCI API.
+ * 20-10-2001   Mattia Monga <monga@debian.org>
+ *              Added support for NeoMagic 256XL chipset 
  */
 
 #define __NO_VERSION__
@@ -50,6 +52,7 @@
 /* These belong in linux/pci.h. */
 #define PCI_DEVICE_ID_NEOMAGIC_NM256AV_AUDIO 0x8005
 #define PCI_DEVICE_ID_NEOMAGIC_NM256ZX_AUDIO 0x8006
+#define PCI_DEVICE_ID_NEOMAGIC_NM256XL_AUDIO 0x8016
 
 /* List of cards.  */
 static struct nm256_info *nmcard_list;
@@ -1263,6 +1266,8 @@
 	return nm256_install(pcidev, REV_NM256AV, "256AV");
     if (pcidev->device = PCI_DEVICE_ID_NEOMAGIC_NM256ZX_AUDIO)
 	return nm256_install(pcidev, REV_NM256ZX, "256ZX");
+    if (pcidev->device = PCI_DEVICE_ID_NEOMAGIC_NM256XL_AUDIO)
+	return nm256_install(pcidev, REV_NM256XL, "256XL");
     return -1; /* should not come here ... */
 }
 
@@ -1649,6 +1654,8 @@
 	{PCI_VENDOR_ID_NEOMAGIC, PCI_DEVICE_ID_NEOMAGIC_NM256AV_AUDIO,
 	PCI_ANY_ID, PCI_ANY_ID, 0, 0},
 	{PCI_VENDOR_ID_NEOMAGIC, PCI_DEVICE_ID_NEOMAGIC_NM256ZX_AUDIO,
+	PCI_ANY_ID, PCI_ANY_ID, 0, 0},
+	{PCI_VENDOR_ID_NEOMAGIC, PCI_DEVICE_ID_NEOMAGIC_NM256XL_AUDIO,
 	PCI_ANY_ID, PCI_ANY_ID, 0, 0},
 	{0,}
 };


-- end of patch --

-- System Information
Debian Release: testing/unstable
Architecture: i386
Kernel: Linux micca 2.4.12 #1 sab ott 20 10:07:04 CEST 2001 i686
Locale: LANG=it_IT, LC_CTYPE=it_IT

Versions of packages kernel-source-2.4.12 depends on:
ii  binutils                   2.11.92.0.7-1 The GNU assembler, linker and bina
ii  bzip2                      1.0.1-13      A high-quality block-sorting file 
ii  fileutils                  4.1-7         GNU file management utilities.


