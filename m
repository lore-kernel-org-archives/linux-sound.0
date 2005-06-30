From: Jesper Juhl <juhl-lkml@dif.dk>
Date: Thu, 30 Jun 2005 20:28:27 +0000
Subject: [PATCH] vfree cleanup for sound/oss/sequencer.c
Message-Id: <Pine.LNX.4.62.0506302223340.2858@dragon.hyggekrogen.localhost>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Hannu Savolainen <hannu@opensound.com>, linux-sound <linux-sound@vger.kernel.org>, akpm@osdl.org

Don't bother checking for NULL, vfree can handle it.

Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---

 sound/oss/sequencer.c |   14 ++++----------
 1 files changed, 4 insertions(+), 10 deletions(-)

--- linux-2.6.13-rc1-orig/sound/oss/sequencer.c	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc1/sound/oss/sequencer.c	2005-06-30 22:21:49.000000000 +0200
@@ -1671,14 +1671,8 @@ void sequencer_init(void)
 
 void sequencer_unload(void)
 {
-	if(queue)
-	{
-		vfree(queue);
-		queue=NULL;
-	}
-	if(iqueue)
-	{
-		vfree(iqueue);
-		iqueue=NULL;
-	}
+	vfree(queue);
+	queue = NULL;
+	vfree(iqueue);
+	iqueue = NULL;
 }



