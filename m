From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 09 Apr 2006 15:09:16 +0000
Subject: [Patch] Dont call ac97_release_codec with NULL argument in
Message-Id: <1144595356.18397.3.camel@alice>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

hi,

this is a fix for coverity id #243. We only jump to err_codec
if ac97_alloc_codec() fails its malloc() in which case codec is NULL.
Since ac97_release_codec dereferences its argument we shouldnt call
it with a NULL argument.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.17-rc1/sound/oss/es1371.c.orig	2006-04-09 17:03:22.000000000 +0200
+++ linux-2.6.17-rc1/sound/oss/es1371.c	2006-04-09 17:03:55.000000000 +0200
@@ -3040,8 +3040,8 @@ static int __devinit es1371_probe(struct
  err_irq:
 	release_region(s->io, ES1371_EXTENT);
  err_region:
- err_codec:
 	ac97_release_codec(s->codec);
+ err_codec:
 	kfree(s);
 	return res;
 }


