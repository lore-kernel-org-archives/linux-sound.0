From: Simon Huggins <huggie@earth.li>
Date: Mon, 13 Mar 2000 17:18:33 +0000
Subject: Re: [PATCH] Ensoniq SoundScape with 2.3.51 (mpu401 changes broke it)
MIME-Version: 1
Content-Type: multipart/mixed; boundary="XsQoSWH+UP9D9v3l"
Message-Id: <marc-linux-sound-95305880326891@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95287201901215@msgid-missing>
In-Reply-To: <marc-linux-sound-95287201901215@msgid-missing>
To: linux-sound@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii

On Sun, Mar 12, 2000 at 06:54:22PM +0100, Christoph Hellwig wrote:
> > Can you decide whether you want to wrap this in some magical #ifdef's
> > and send it on to Linus?
> You can send it to Linus, the changes seem ok.

This is a better patch.  It now unloads cleanly too.

Linus, please apply this to your tree.  It fixes mpu401.c for the
Ensoniq SoundScape.

-- 
Simon  [ huggie@earth.li ] *\                "Cockroaches!  They're  \**
****** ]-+-+-+-+-+-+-+-+-[ **\            everywhere...uuugghh...I'm  \*
****** [  Htag.pl 0.0.4  ] ***\                 surrounded!" - Mulder  \

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mpu401.diff"

--- mpu401.c.old	Sun Mar 12 14:17:11 2000
+++ mpu401.c	Mon Mar 13 17:13:13 2000
@@ -1726,25 +1726,24 @@
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
 
 void cleanup_mpu401(void)
 {
-	unload_mpu401(&cfg);
+	if (io != -1 && irq != -1) {
+		/* Check for use by, for example, sscape driver */
+		unload_mpu401(&cfg);
+	}
 	SOUND_LOCK_END;
 }
 

--XsQoSWH+UP9D9v3l--
