From: Gerald Teschl <gerald.teschl@univie.ac.at>
Date: Tue, 04 Jun 2002 15:57:52 +0000
Subject: [PATCH] opl3sa2 isapnp activation fix
Message-Id: <marc-linux-sound-102320726210297@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102320707510070@msgid-missing>
In-Reply-To: <marc-linux-sound-102320707510070@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

this is the final version of my patch which fixes the isapnp activation 
of opl3sa2 based
cards which require dma=0 as discussed with Zwane Mwaikambo.

Gerald

--- linux-2.4.18-4/drivers/sound/opl3sa2.c.orig    Thu May  2 23:36:45 2002
+++ linux-2.4.18-4/drivers/sound/opl3sa2.c    Tue Jun  4 16:09:50 2002
@@ -57,6 +57,7 @@
  *                         (Jan 7, 2001)
  * Zwane Mwaikambo       Added PM support. (Dec 4 2001)
  * Zwane Mwaikambo       Code, data structure cleanups. (Feb 15 2002)
+ * Gerald Teschl       Fixed ISA PnP activate. (Jun 02 2002)
  *
  */
 
@@ -869,10 +870,24 @@
     }
     else {
         if(dev->activate(dev) < 0) {
-            printk(KERN_WARNING PFX "ISA PnP activate failed\n");
-            opl3sa2_state[card].activated = 0;
-            return -ENODEV;
+            /*
+             * isapnp.c disallows dma=0 but some opl3sa2 cards need it.
+             * So we set dma by hand and try again
+             */
+            if (dma < 0 || dma > 7)
+                dma= 0;
+            if (dma2 < 0 || dma2 >7)
+                dma2= 1;
+            isapnp_resource_change(&dev->dma_resource[0], dma, 1);
+            isapnp_resource_change(&dev->dma_resource[1], dma2, 1);
         }
+        if(!dev->active)
+           if (dev->activate(dev) < 0) {
+                printk(KERN_WARNING PFX "ISA PnP activate failed.\n");
+                opl3sa2_state[card].activated = 0;
+                return -ENODEV;
+            }
+        opl3sa2_state[card].activated = 1;
 
         printk(KERN_DEBUG
                PFX "Activated ISA PnP card %d (active=%d)\n",

