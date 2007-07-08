From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 08 Jul 2007 09:33:25 +0000
Subject: [PATCH] SOUND: Replace kcalloc(1,...) calls with kmalloc().
Message-Id: <Pine.LNX.4.64.0707080532220.7907@localhost.localdomain>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
index ba32d1e..4cab03d 100644
--- a/sound/pci/hda/patch_via.c
+++ b/sound/pci/hda/patch_via.c
@@ -819,7 +819,7 @@ static int patch_vt1708(struct hda_codec *codec)
 	int err;

 	/* create a codec specific record */
-	spec = kcalloc(1, sizeof(*spec), GFP_KERNEL);
+	spec = kmalloc(sizeof(*spec), GFP_KERNEL);
 	if (spec = NULL)
 		return -ENOMEM;

@@ -1257,7 +1257,7 @@ static int patch_vt1709_10ch(struct hda_codec *codec)
 	int err;

 	/* create a codec specific record */
-	spec = kcalloc(1, sizeof(*spec), GFP_KERNEL);
+	spec = kmalloc(sizeof(*spec), GFP_KERNEL);
 	if (spec = NULL)
 		return -ENOMEM;

@@ -1347,7 +1347,7 @@ static int patch_vt1709_6ch(struct hda_codec *codec)
 	int err;

 	/* create a codec specific record */
-	spec = kcalloc(1, sizeof(*spec), GFP_KERNEL);
+	spec = kmalloc(sizeof(*spec), GFP_KERNEL);
 	if (spec = NULL)
 		return -ENOMEM;

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
