From: Jesper Juhl <juhl-lkml@dif.dk>
Date: Thu, 30 Jun 2005 20:45:29 +0000
Subject: [PATCH] cleanup NULL pointer check before vfree in sound/oss/maestro3.c
Message-Id: <Pine.LNX.4.62.0506302241251.2858@dragon.hyggekrogen.localhost>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: Zach Brown <zab@zabbo.net>, linux-sound@vger.kernel.org, akpm@osdl.org

vfree() can take a NULL pointer so don't waste time checking first.

 sound/oss/maestro3.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

--- linux-2.6.13-rc1-orig/sound/oss/maestro3.c	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc1/sound/oss/maestro3.c	2005-06-30 22:40:42.000000000 +0200
@@ -2580,10 +2580,10 @@ static int alloc_dsp_suspendmem(struct m
 
     return 0;
 }
+
 static void free_dsp_suspendmem(struct m3_card *card)
 {
-   if(card->suspend_mem)
-       vfree(card->suspend_mem);
+	vfree(card->suspend_mem);
 }
 
 #else


