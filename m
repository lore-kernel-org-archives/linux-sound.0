Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2837BE75;
	Mon,  2 Mar 2026 18:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477974; cv=pass; b=c3nMWxCNNtNGWqTnqT6SGrcSfUXCLCWDuSBKtLyBhNFzkN+Xc0ZuzEka8cS+wwttCnXYCxv+c/zF9osiLNxeDdpUQVllgaVGjSv88/fM3bhf0ufyh9X2eG1cxqCagWWuFmz74qLnRpRPVB3r8a++MoufBXf2LVAwURNElpZrEM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477974; c=relaxed/simple;
	bh=Qw0zZSYuL7MErMf7Jfleria3+Y6KnwCYVtKLkVGJ9rU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JogsAvB8SQ4SJz+6kx7DUeokAb2txVjVpmcxZXecvD89rnQ7mHYPI9wyrHgkKe0B6VFjVNqRjb+7BYWTxboyMAgVB63kbdtUJIBAd8zoUwxkUTrJ4N5QCuzrRlhZNP///Jb/V6pG10wRWzEQIyViYn1zsUP2+sqYANDKaSJiXYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=LGdXC7TH; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="LGdXC7TH"
ARC-Seal: i=1; a=rsa-sha256; t=1772477961; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i/LVGNbfyX6Tc/cAJ1v7UV5ubx2H0GuyT54efVcTvG6Bz7B9jIY7G3EIaqT+I9ekwKo1gI+gl55D1sCEvQwZ7oZDh2tdDOcGN9tHmyVi7BxxALXhTbBy31EmkgersgaI+KMmTUNGrGJdW96E4NENhvqmJe4XFbQFYx4Jrs6h8NE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772477961; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dv6bdqcyhYgJyaJ0g+4K2PA4ZxzA5UgFv7aCp+89l/U=; 
	b=Jbc6fq/rt44rhtgzslRahAJYA4+KXQdHS9bLY23RvT3UsOlIgT/4ohjlJEyrLSYsUIdTRefrivh31MmKnjDMzXiPtcU7e4KxmsqtoBRRl2+21pkSmx9PaF4sxSFokCD13QXdntLBHhfhcxpekfDIjZbMVn1fcD+iItTH0n+GcYM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772477961;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dv6bdqcyhYgJyaJ0g+4K2PA4ZxzA5UgFv7aCp+89l/U=;
	b=LGdXC7THBaIGzoGEdN50h+IOB/ceusHN0uUAelkifodxdmPl4N0r+OxUQG9y2a6f
	b9Y9T3+mBr4+mhyzTUlAZH1O80xTF0KZJvrJFRu8Xb2bVOBq1pMvWt9tEAWmj+dFfKI
	hMTE+am3fFTtemc1tYruUc82x9OBo8EkHK7RvUXW9xa3w1W1vgrsgH+b6MDCFV8Rn9N
	lywMiM8de2P4lIGnXxcuO6BUfxTH0DTSEnz8muKSoAXoJ+W1XAIhwzY9OqkzL060AT6
	8AHxMgHj2ydSPRolyX52dFpyJzAqcN4V/0C5VvBAlQS6TU4fHaAlA8BdfygdoS+0IZy
	a5ZWG5W7dQ==
Received: by mx.zohomail.com with SMTPS id 1772477959220498.95061102923967;
	Mon, 2 Mar 2026 10:59:19 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Rong Zhang <i@rong.moe>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 4/8] ALSA: usb-audio: Support string-descriptor-based quirk table entry
Date: Tue,  3 Mar 2026 02:58:55 +0800
Message-ID: <20260302185900.427415-5-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302185900.427415-1-i@rong.moe>
References: <20260302185900.427415-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some quirky devices do not have a unique VID/PID. Matching them using
DEVICE_FLG() or VENDOR_FLG() may result in conflicts.

Add two new macros DEVICE_STRING_FLG() and VENDOR_STRING_FLG() to match
USB string descriptors (manufacturer and/or product) in addition to VID
and/or PID, so that we can deconflict these devices safely.

No functional change intended.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Alloc string buffers with kmalloc() instead of on stack (thanks
  Takashi Iwai)
- Get string descriptors in a neater way (ditto)
- Tiny differences compared to Takashi's sugeestion:
  - Use `IS_ERR_OR_NULL() || strcmp()' instead of `!IS_ERR_OR_NULL() &&
    strcmp()', so failure in getting the string descriptor won't
    resulting in quirk flags being applied to irrelevant devices
  - Use trivial goto cleanup patterns instead of `__free(kfree)' as the
    latter can't handle ERR_PTR()
- Tiny differences compared to my previous reply:
  - Use usb_string() as Takashi suggested instead of usb_cache_string(),
    so that we can retrieve the errno and print it out on failure
---
 sound/usb/quirks.c | 94 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 3 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c6a78efbcaa30..8deeb9d247500 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2,8 +2,10 @@
 /*
  */
 
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/usb.h>
 #include <linux/usb/audio.h>
 #include <linux/usb/midi.h>
@@ -2135,16 +2137,39 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 /*
  * driver behavior quirk flags
  */
+struct usb_string_match {
+	const char *manufacturer;
+	const char *product;
+};
+
 struct usb_audio_quirk_flags_table {
 	u32 id;
 	u32 flags;
+	const struct usb_string_match *usb_string_match;
 };
 
 #define DEVICE_FLG(vid, pid, _flags) \
 	{ .id = USB_ID(vid, pid), .flags = (_flags) }
 #define VENDOR_FLG(vid, _flags) DEVICE_FLG(vid, 0, _flags)
 
+/* Use as a last resort if using DEVICE_FLG() is prone to VID/PID conflicts. */
+#define DEVICE_STRING_FLG(vid, pid, _manufacturer, _product, _flags)	\
+{									\
+	.id = USB_ID(vid, pid),						\
+	.usb_string_match = &(const struct usb_string_match) {		\
+		.manufacturer = _manufacturer,				\
+		.product = _product,					\
+	},								\
+	.flags = (_flags),						\
+}
+
+/* Use as a last resort if using VENDOR_FLG() is prone to VID conflicts. */
+#define VENDOR_STRING_FLG(vid, _manufacturer, _flags)			\
+	DEVICE_STRING_FLG(vid, 0, _manufacturer, NULL, _flags)
+
 static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
+	/* Device and string descriptor matches */
+
 	/* Device matches */
 	DEVICE_FLG(0x001f, 0x0b21, /* AB13X USB Audio */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
@@ -2414,6 +2439,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 
+	/* Vendor and string descriptor matches */
+
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
@@ -2558,19 +2585,80 @@ void snd_usb_apply_flag_dbg(const char *reason,
 	}
 }
 
+#define USB_STRING_SIZE 128
+
+static char *snd_usb_get_string(struct snd_usb_audio *chip, int id)
+{
+	char *buf;
+	int ret;
+
+	/*
+	 * Devices without the corresponding string descriptor.
+	 * This is non-fatal as *_STRING_FLG have nothing to do in this case.
+	 */
+	if (id == 0)
+		return ERR_PTR(-ENODATA);
+
+	buf = kmalloc(USB_STRING_SIZE, GFP_KERNEL);
+	if (buf == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	ret = usb_string(chip->dev, id, buf, USB_STRING_SIZE);
+	if (ret < 0) {
+		usb_audio_warn(chip, "failed to get string for id%d: %d\n", id, ret);
+		kfree(buf);
+		return ERR_PTR(ret);
+	}
+
+	return buf;
+}
+
 void snd_usb_init_quirk_flags_table(struct snd_usb_audio *chip)
 {
 	const struct usb_audio_quirk_flags_table *p;
+	char *manufacturer = NULL;
+	char *product = NULL;
 
 	for (p = quirk_flags_table; p->id; p++) {
 		if (chip->usb_id == p->id ||
 		    (!USB_ID_PRODUCT(p->id) &&
 		     USB_ID_VENDOR(chip->usb_id) == USB_ID_VENDOR(p->id))) {
-			snd_usb_apply_flag_dbg("builtin table", chip, p->flags);
-			chip->quirk_flags |= p->flags;
-			return;
+			if (!p->usb_string_match)
+				goto apply; /* DEVICE_FLG or VENDOR_FLG */
+
+			/* DEVICE_STRING_FLG or VENDOR_STRING_FLG */
+			if (p->usb_string_match->manufacturer) {
+				if (!manufacturer) {
+					manufacturer = snd_usb_get_string(chip,
+						chip->dev->descriptor.iManufacturer);
+				}
+				if (IS_ERR_OR_NULL(manufacturer) ||
+				    strcmp(p->usb_string_match->manufacturer, manufacturer))
+					continue;
+			}
+			if (p->usb_string_match->product) {
+				if (!product) {
+					product = snd_usb_get_string(chip,
+						chip->dev->descriptor.iProduct);
+				}
+				if (IS_ERR_OR_NULL(product) ||
+				    strcmp(p->usb_string_match->product, product))
+					continue;
+			}
+			goto apply;
 		}
 	}
+	goto clean;
+
+apply:
+	snd_usb_apply_flag_dbg("builtin table", chip, p->flags);
+	chip->quirk_flags |= p->flags;
+
+clean:
+	if (!IS_ERR_OR_NULL(manufacturer))
+		kfree(manufacturer);
+	if (!IS_ERR_OR_NULL(product))
+		kfree(product);
 }
 
 void snd_usb_init_quirk_flags_parse_string(struct snd_usb_audio *chip,
-- 
2.51.0

