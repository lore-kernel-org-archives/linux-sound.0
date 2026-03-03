Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6AC38424A;
	Tue,  3 Mar 2026 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772567443; cv=pass; b=ayuxqKhmM9eixF5FnUP/MGrrahasA+bULzf8+epfnZRtEXrqF0Qj7KgL2ccjqdGhFFfMgKJN57GWQ8eGOAtp6uttV35S5N/RCCjejA9ILl4nPCWmAZLMYOxh8Y/rK8O86pCYiM34i+kXiYrdx32sr6YlbkCHwHdlq93xeROCx5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772567443; c=relaxed/simple;
	bh=0801/FI/5xMaRDfLzwS0NFqPx/02hgHq1ma1CnB6P78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/5OeIW2iFvyo4iOmRslbzDyxV69fy6R1vXka/RbBbnChdCCckNcOVNrb+ARVQJ6XEm9XtxGxpCszph3hRCaCE/raH2V7VLFMbNN+nhl/PDGGU3oTOOmuyyYfWmYYNJjVAjPaHwXNN2kSDCCTVOlKTEtw4thigqrahTVdFm5leg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=H2INVYKI; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="H2INVYKI"
ARC-Seal: i=1; a=rsa-sha256; t=1772567307; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iy4lQydsmf/AwaAsRcFnosqOhOzvOsBZtVbKLCjiZmcmeoRSiVEew8tHXj/AO6AG2g1DAsxxUjyB1/dmW0kab+jJ5Mn+PM/+LJ2NYMeo//vRczKhRFt3CQlwdEt17VQDAfNr/8uCuJgQOziE4F67VNs+zsTi3nQwwHnd1lWuX8s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772567307; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R8KS6/FH3KrJv34wKtYsvLvuU8TATeZzz2GsOY4pegA=; 
	b=iYMmQ80zV7Ln+W9Rremqe6eJY/4yFA2s6w0G6LvNd0WZpaTG3L1ZWhnxEJlZV3gzPpC1g8dExcW3BH46Wt6KmBDAKK8O+lCdq6LIec/MFI3byNukAWNz0Gf2YEbG65pWdBRCHUGCL9CgeIPvwSlSxOIDf0+oXdqe4FhCbZf8+54=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772567307;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=R8KS6/FH3KrJv34wKtYsvLvuU8TATeZzz2GsOY4pegA=;
	b=H2INVYKIwT66q07XWORI/8ONMWfS5MzByIyvLXdUah9Ke20vkqnh6XnYth5hkyvN
	RryFK02XEc5ujuXHHOsIyRloD0I0adjevFsSfPGUxO2dKRrUwXqtqCE9hRfoFVGqF34
	j2nfR+IzuFwCa5Rb3hQpPGQLA/0eG7skWhZ/kVxC0qKQCYuYa6foFn6Bc8XG3CzK/wt
	FGq08DaZYQHU8woFdVkxuVIeh2B6yUZeKk48loVch/d0SFXQdac+W8w29VlmnYCZqM9
	jJ8gjKaLjEESGsyHaXmJGG33utJH/sD4TN0Vtu8BRY5UAzr4QLS5PrSCGDatHpRyXuy
	WB5iqkoYNQ==
Received: by mx.zohomail.com with SMTPS id 177256730526758.31359118481839;
	Tue, 3 Mar 2026 11:48:25 -0800 (PST)
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
Subject: [PATCH v3 4/8] ALSA: usb-audio: Support string-descriptor-based quirk table entry
Date: Wed,  4 Mar 2026 03:47:59 +0800
Message-ID: <20260303194805.266158-5-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303194805.266158-1-i@rong.moe>
References: <20260303194805.266158-1-i@rong.moe>
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
Changes in v3:
- Adopt __free(kfree) on string buffers as it turns out to be able to
  handle ERR_PTR() gracefully (thanks Takashi Iwai)
- Improve readability by replacing the goto pattern with
  `p->usb_string_match && p->usb_string_match->*'. The compiler should
  generate equivalent control paths thanks to the optimizer

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
 sound/usb/quirks.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d54a1a44a69b..d365eb41910a 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2,8 +2,11 @@
 /*
  */
 
+#include <linux/cleanup.h>
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/usb.h>
 #include <linux/usb/audio.h>
 #include <linux/usb/midi.h>
@@ -2135,16 +2138,39 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
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
@@ -2416,6 +2442,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 
+	/* Vendor and string descriptor matches */
+
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
@@ -2560,14 +2588,64 @@ void snd_usb_apply_flag_dbg(const char *reason,
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
+	char *manufacturer __free(kfree) = NULL;
+	char *product __free(kfree) = NULL;
 
 	for (p = quirk_flags_table; p->id; p++) {
 		if (chip->usb_id == p->id ||
 		    (!USB_ID_PRODUCT(p->id) &&
 		     USB_ID_VENDOR(chip->usb_id) == USB_ID_VENDOR(p->id))) {
+			/* Handle DEVICE_STRING_FLG/VENDOR_STRING_FLG. */
+			if (p->usb_string_match && p->usb_string_match->manufacturer) {
+				if (!manufacturer) {
+					manufacturer = snd_usb_get_string(chip,
+						chip->dev->descriptor.iManufacturer);
+				}
+				if (IS_ERR_OR_NULL(manufacturer) ||
+				    strcmp(p->usb_string_match->manufacturer, manufacturer))
+					continue;
+			}
+			if (p->usb_string_match && p->usb_string_match->product) {
+				if (!product) {
+					product = snd_usb_get_string(chip,
+						chip->dev->descriptor.iProduct);
+				}
+				if (IS_ERR_OR_NULL(product) ||
+				    strcmp(p->usb_string_match->product, product))
+					continue;
+			}
+
 			snd_usb_apply_flag_dbg("builtin table", chip, p->flags);
 			chip->quirk_flags |= p->flags;
 			return;
-- 
2.53.0

