From: Jesper Juhl <juhl-lkml@dif.dk>
Date: Thu, 30 Jun 2005 20:39:01 +0000
Subject: [PATCH] vfree can handle NULL (sound/oss/msnd.c)
Message-Id: <Pine.LNX.4.62.0506302236250.2858@dragon.hyggekrogen.localhost>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Andrew Veliath <andrewtv@usa.net>, linux-sound@vger.kernel.org, akpm@osdl.org

Nothing wrong in handing vfree a NULL pointer.

 sound/oss/msnd.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

--- linux-2.6.13-rc1-orig/sound/oss/msnd.c	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc1/sound/oss/msnd.c	2005-06-30 22:35:41.000000000 +0200
@@ -96,10 +96,8 @@ void msnd_fifo_init(msnd_fifo *f)
 
 void msnd_fifo_free(msnd_fifo *f)
 {
-	if (f->data) {
-		vfree(f->data);
-		f->data = NULL;
-	}
+	vfree(f->data);
+	f->data = NULL;
 }
 
 int msnd_fifo_alloc(msnd_fifo *f, size_t n)


