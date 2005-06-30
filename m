From: Jesper Juhl <juhl-lkml@dif.dk>
Date: Thu, 30 Jun 2005 20:34:45 +0000
Subject: [PATCH] vfree cleanup for sound/oss/sb_card.c
Message-Id: <Pine.LNX.4.62.0506302230450.2858@dragon.hyggekrogen.localhost>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: linux-sound@vger.kernel.org, Paul Laufer <paul@laufernet.com>, Hannu Savolainen <hannu@opensound.com>, akpm@osdl.org

vfree can take a NULL pointer, no point in checking.

Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---

 sound/oss/sb_card.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

--- linux-2.6.13-rc1-orig/sound/oss/sb_card.c	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc1/sound/oss/sb_card.c	2005-06-30 22:29:46.000000000 +0200
@@ -337,10 +337,8 @@ static void __exit sb_exit(void)
 	pnp_unregister_card_driver(&sb_pnp_driver);
 #endif
 
-	if (smw_free) {
-		vfree(smw_free);
-		smw_free = NULL;
-	}
+	vfree(smw_free);
+	smw_free = NULL;
 }
 
 module_init(sb_init);


