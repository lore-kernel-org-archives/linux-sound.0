From: "Adam J. Richter" <adam@yggdrasil.com>
Date: Sat, 16 Nov 2002 14:19:56 +0000
Subject: Patch(2.5.47): a few sound drivers directly set pcidev.dma_mask
MIME-Version: 1
Content-Type: multipart/mixed; boundary="AhhlLboLdkugWU4S"
Message-Id: <marc-linux-sound-103745649404109@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

	A few sound drivers directly set pci_dev->dma_mask instead of
calling pci_set_dma_mask.  pci_dev.dma_mask may be moved soon
(probably to pci_dev.device.dma_mask).  So, applying this patch will
reduce or eliminate the need to change your code when that happens,
and it will be one less change to maintain between 2.4 and 2.5+
kernels.

	In one case, these changes also allow the driver to detect and
fail if the DMA it wants really is not available, although I don't
know how realistic that scenario is.

	If these changes look OK, then I would appreciate it if the
appropriate maintainers would shepherd this patch to Linus or let me
know if there is something more I should do.

-- 
Adam J. Richter     __     ______________   575 Oroville Road
adam@yggdrasil.com     \ /                  Milpitas, California 95035
+1 408 309-6081         | g g d r a s i l   United States of America
                         "Free Software For The Rest Of Us."

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="diffs.sound"

--- linux-2.5.47/sound/core/wrappers.c	2002-11-10 19:28:05.000000000 -0800
+++ linux/sound/core/wrappers.c	2002-11-16 05:54:00.000000000 -0800
@@ -85,9 +85,9 @@
 		return pci_alloc_consistent(hwdev, size, dma_handle);
 	dma_mask = hwdev->dma_mask;
 	rmask = ~((unsigned long)dma_mask);
-	hwdev->dma_mask = 0xffffffff; /* do without masking */
+	pci_set_dma_mask(hwdev, 0xffffffff); /* do without masking */
 	ret = pci_alloc_consistent(hwdev, size, dma_handle);
-	hwdev->dma_mask = dma_mask; /* restore */
+	pci_set_dma_mask(hwdev, dma_mask); /* restore */
 	if (ret) {
 		/* obtained address is out of range? */
 		if (((unsigned long)*dma_handle + size - 1) & rmask) {
--- linux-2.5.47/sound/oss/ite8172.c	2002-11-10 19:28:06.000000000 -0800
+++ linux/sound/oss/ite8172.c	2002-11-16 05:54:00.000000000 -0800
@@ -1807,6 +1807,10 @@
     /* enable pci io and bus mastering */
     if (pci_enable_device(pcidev))
 	goto err_dev3;
+
+    if (pci_set_dma_mask(pcidev, 0xffffffff))
+	goto err_dev3;  
+
     pci_set_master(pcidev);
 
     /* get out of legacy mode */
@@ -1878,7 +1882,6 @@
     
     /* store it in the driver field */
     pci_set_drvdata(pcidev, s);
-    pcidev->dma_mask = 0xffffffff;
     /* put it into driver list */
     list_add_tail(&s->devs, &devs);
     /* increment devindex */
--- linux-2.5.47/sound/oss/nec_vrc5477.c	2002-11-10 19:28:27.000000000 -0800
+++ linux/sound/oss/nec_vrc5477.c	2002-11-16 05:54:00.000000000 -0800
@@ -1913,6 +1913,10 @@
 	/* enable pci io and bus mastering */
 	if (pci_enable_device(pcidev))
 		goto err_dev3;
+
+	if (pci_set_dma_mask(pcidev, 0xffffffff))
+		goto err_dev3;
+
 	pci_set_master(pcidev);
 
 /*
@@ -1960,7 +1964,6 @@
 
 	/* store it in the driver field */
 	pci_set_drvdata(pcidev, s);
-	pcidev->dma_mask = 0xffffffff;
 	/* put it into driver list */
 	list_add_tail(&s->devs, &devs);
 	/* increment devindex */
--- linux-2.5.47/sound/oss/rme96xx.c	2002-11-10 19:28:09.000000000 -0800
+++ linux/sound/oss/rme96xx.c	2002-11-16 05:54:00.000000000 -0800
@@ -712,7 +711,7 @@
 	
 	if (pcidev->irq == 0) 
 		return -1;
-	if (!pci_dma_supported(pcidev, 0xffffffff)) {
+	if (pci_set_dma_mask(pcidev, 0xffffffff)) {
 		printk(KERN_WARNING RME_MESS" architecture does not support 32bit PCI busmaster DMA\n");
 		return -1;
 	}
@@ -751,7 +750,6 @@
 		goto err_devices;
 
 	pci_set_drvdata(pcidev, s);
-	pcidev->dma_mask = 0xffffffff; /* ????? */
 	/* put it into driver list */
 	list_add_tail(&s->devs, &devs);
 

--AhhlLboLdkugWU4S--
