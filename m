From: Petri Koistinen <petri.koistinen@iki.fi>
Date: Tue, 28 Oct 2003 18:14:53 +0000
Subject: [PATCH] Remove one of sound/oss/cmpci.c compile warnings
Message-Id: <marc-linux-sound-106736555208217@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi!

This patch removes this compile warning:

sound/oss/cmpci.c: In function `cm_release_mixdev':
sound/oss/cmpci.c:1465: warning: unused variable `s'

GCC doesn't seem to unstand that VALIDATE_STATE macro uses s variable.
I hope this is correct way to fix this.

Petri

--- linux-2.6/sound/oss/cmpci.c.orig	2003-10-28 19:54:27.000000000 +0200
+++ linux-2.6/sound/oss/cmpci.c	2003-10-28 19:55:50.000000000 +0200
@@ -1462,7 +1462,9 @@

 static int cm_release_mixdev(struct inode *inode, struct file *file)
 {
-	struct cm_state *s = (struct cm_state *)file->private_data;
+	struct cm_state *s;
+
+	s = (struct cm_state *)file->private_data;

 	VALIDATE_STATE(s);
 	return 0;
