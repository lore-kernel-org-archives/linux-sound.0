From: Oliver Neukum <oneukum@suse.de>
Date: Fri, 12 Jan 2007 13:49:57 +0000
Subject: [patch]cleanup and error reporting for sound/core/init.c
Message-Id: <200701121449.58186.oneukum@suse.de>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@suse.cz>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

please accept this patch, which makes the control flow clear with
indentation, adds some comments and improves error reporting.

	Regards
		Oliver

Signed-off-by: Oliver Neukum <oneukum@suse.de>

--
--- a/sound/core/init.c	2007-01-12 14:26:47.000000000 +0100
+++ b/sound/core/init.c	2007-01-12 14:46:13.000000000 +0100
@@ -114,22 +114,26 @@
 	if (idx < 0) {
 		int idx2;
 		for (idx2 = 0; idx2 < SNDRV_CARDS; idx2++)
+			/* idx = -1 = 0xffff means: take any free slot */
 			if (~snd_cards_lock & idx & 1<<idx2) {
 				idx = idx2;
 				if (idx >= snd_ecards_limit)
 					snd_ecards_limit = idx + 1;
 				break;
 			}
-	} else if (idx < snd_ecards_limit) {
-		if (snd_cards_lock & (1 << idx))
-			err = -ENODEV;	/* invalid */
-	} else if (idx < SNDRV_CARDS)
-		snd_ecards_limit = idx + 1; /* increase the limit */
-	else
-		err = -ENODEV;
+	} else {
+		 if (idx < snd_ecards_limit) {
+			if (snd_cards_lock & (1 << idx))
+				err = -EBUSY;	/* invalid */
+		} else if (idx < SNDRV_CARDS)
+				snd_ecards_limit = idx + 1; /* increase the limit */
+			else
+				err = -ENODEV;
+	}
 	if (idx < 0 || err < 0) {
 		mutex_unlock(&snd_card_mutex);
-		snd_printk(KERN_ERR "cannot find the slot for index %d (range 0-%i)\n", idx, snd_ecards_limit - 1);
+		snd_printk(KERN_ERR "cannot find the slot for index %d (range 0-%i), error: %d\n",
+			 idx, snd_ecards_limit - 1, err);
 		goto __error;
 	}
 	snd_cards_lock |= 1 << idx;		/* lock it */
