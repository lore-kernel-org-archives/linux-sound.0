From: Simon Huggins <huggie@earth.li>
Date: Sun, 12 Mar 2000 14:35:22 +0000
Subject: [PATCH] Ensoniq SoundScape with 2.3.51 (mpu401 changes broke it)
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zYM0uCDKw75PZbzx"
Message-Id: <marc-linux-sound-95287201901215@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii

Hi,

Your patch to clean up the OSS stuff has broken the Ensoniq SoundScape.
Reverting one small portion fixes it.
Can you decide whether you want to wrap this in some magical #ifdef's
and send it on to Linus?


BTW, the documentation in Documentation/README.OSS suggests that this
card cannot be used with isapnp?
This is not my experience.
See http://www.huggie.dial.pipex.com/linux/sound.shtml for how it Works
For Me(TM).


Also since I applied my patch, I get this when I modprobe -r:

[root@byers /usr/src/linux/drivers/sound]# modprobe -r sscape
Trying to free nonexistent resource <0000-0001>
Sound device 2 went missing!
kmem_free: Either bad obj addr or double free (objp=c61bd000,
name=size-4096)

I imagine this is because of the changes too?


Simon.

-- 
"Now where did I put that magazine?" Tom asked periodically.                

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mpu401.diff"

--- mpu401.c.old	Sun Mar 12 14:17:11 2000
+++ mpu401.c	Sun Mar 12 14:17:51 2000
@@ -1726,18 +1726,14 @@
 {
 	/* Can be loaded either for module use or to provide functions
 	   to others */
-	cfg.irq = irq;
-	cfg.io_base = io;
-	
-	if (cfg.io_base != -1 && cfg.irq != -1) {
-		printk(KERN_WARNING "mpu401: need io and irq !");
-		return -ENODEV;
+	if (io != -1 && irq != -1) {
+	        cfg.irq = irq;
+		cfg.io_base = io;
+		if (probe_mpu401(&cfg) == 0)
+			return -ENODEV;
+		attach_mpu401(&cfg);
 	}
 	
-	if (probe_mpu401(&cfg) == 0)
-		return -ENODEV;
-	attach_mpu401(&cfg);
-
 	SOUND_LOCK;
 	return 0;
 }

--zYM0uCDKw75PZbzx--
