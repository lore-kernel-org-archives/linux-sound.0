From: Vinay K Nallamothu <vinay-rc@naturesoft.net>
Date: Sun, 10 Aug 2003 15:51:42 +0000
Subject: [PATCH 2.6.0-test3][OSS] nec_vrc5477.c: incorrect use of __devinit
Message-Id: <marc-linux-sound-106052885908280@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

sound/oss/nec_vrc5477.c: __devinit is incorrectly used on the device
unloading function. This patch replaces it with __devexit.

--- linux-2.6.0-test3/sound/oss/nec_vrc5477.c	2003-08-09 12:11:40.000000000 +0530
+++ linux-2.6.0-test3-nvk/sound/oss/nec_vrc5477.c	2003-08-10 20:24:47.000000000 +0530
@@ -61,6 +61,7 @@
  *    02.08.2001  0.1   Initial release
  */
 
+#include <linux/init.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
@@ -1965,7 +1966,7 @@
 	return -1;
 }
 
-static void __devinit vrc5477_ac97_remove(struct pci_dev *dev)
+static void __devexit vrc5477_ac97_remove(struct pci_dev *dev)
 {
 	struct vrc5477_ac97_state *s = pci_get_drvdata(dev);
 
@@ -2001,7 +2002,7 @@
 	.name		= VRC5477_AC97_MODULE_NAME,
 	.id_table	= id_table,
 	.probe		= vrc5477_ac97_probe,
-	.remove		= vrc5477_ac97_remove,
+	.remove		= __devexit_p(vrc5477_ac97_remove)
 };
 
 static int __init init_vrc5477_ac97(void)


