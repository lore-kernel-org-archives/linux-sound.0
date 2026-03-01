Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C192DAFB0;
	Sun,  1 Mar 2026 21:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401084; cv=pass; b=OU5wt/PmrqNMM2U+3AAtB643ItJwltMkBFUZ3ty7ZUf+upIyaC+D0XzAO8DFkbjQkltyP1rS3coygrsiA/pPwnUkZByqSEuaU4FpKdhXKCXAfCw87zR8JM2g139HgSe/XSiDTHjHhqQMB6xEGwRE3fP1qA9zkmykmeIjjN2Toc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401084; c=relaxed/simple;
	bh=cmKQeW5KbUAo3wyFi/wc1QyH3nk9s0ofvckbCyAw97E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ew4Xuq35rcWDCPQGtZ2o8V2Wa809Pq6gbAUKudBklm7Ur8Wi5lJ/KE2dDk6q0TiKnwO5UytqnYN+3Jd6rHn85vGbuV4rdeTGcLlZl7ZRp9PpaDIsEl0u3moLDg/eeqZGK+nUEsnbabxNibAtMyNG4+1uaE+SAIS5ogsEUzycIHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=FKcf6lj5; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="FKcf6lj5"
ARC-Seal: i=1; a=rsa-sha256; t=1772401068; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KCbci48IgbAUDvSFECc2doD/ANTMyES+/2D7/Bc74PRnxkXGB9/Mkm0BHNS7KvcTDUYzq0muUPOjIVZLs54lXcdvfeZb6w8gSvstSLWQ/fbCFfKfLgcMR65uqXXRmfqUu4SSVdYnp1xJvRoLZa9I+Bee7qzUyK3LpRN5A3iuHjI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772401068; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wVzjsoySm0puYUAQlobj5BlJAVClteKPejGg2hR7+yc=; 
	b=K211ssyb0Qiw0G3NyNdqi9pYleECUrfYWPY0QQialoqdoc9TGbgDbDSqmVl/SO/riVOUneeoGWgk/6ugY8Go7N1E4F9ZKQK3ngb9L2UzycxqKn9M5uRmw+zoA2Z+7TXA1VSzbOhY1Z4mcxyz9Vggail98QVlaiWGPQnpMTPpYLs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772401068;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wVzjsoySm0puYUAQlobj5BlJAVClteKPejGg2hR7+yc=;
	b=FKcf6lj5PUBYeR2mwR+SijKCfqeQUWnoF7ETI+Zy04NyY7/RZPszJA3cemidbnXT
	ZGvKeI1mzXKqqT/vtZ0PEyrszfk8XZ6BC1yudWYgHNmvdE+Zj3Tn/PJRonTy6cYb3tI
	mOLCVYOih7fDV8dqWsoFehyv67sCghF8Aaozc9QeeVoWe22ljIoCZu7aildkwYce3Rw
	djrnEYquDgofVJwIl0rZ3io8bFJyV0VoC9ObApWD7FzMHiEgF9gD37KxqsT01waDyD/
	fGvPQPDTcKs/vGYxxN9G2Jnubupy0nLtKVpVgrUAHffjTbdJAjsZua7T5eCscK7Gd52
	QFPHCIcMiw==
Received: by mx.zohomail.com with SMTPS id 1772401067209476.7686188353042;
	Sun, 1 Mar 2026 13:37:47 -0800 (PST)
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
Subject: [PATCH 4/9] ALSA: usb-audio: Support string-descriptor-based quirk table entry
Date: Mon,  2 Mar 2026 05:37:20 +0800
Message-ID: <20260301213726.428505-5-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260301213726.428505-1-i@rong.moe>
References: <20260301213726.428505-1-i@rong.moe>
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
 sound/usb/quirks.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c6a78efbcaa30..495dd46ce515c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2,8 +2,10 @@
 /*
  */
 
+#include <linux/build_bug.h>
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
@@ -2558,14 +2585,69 @@ void snd_usb_apply_flag_dbg(const char *reason,
 	}
 }
 
+#define USB_STRING_SIZE 128
+
+static inline int snd_usb_get_strings(struct snd_usb_audio *chip,
+				      char *manufacturer, char *product)
+{
+	int ret;
+
+	if (manufacturer) {
+		ret = usb_string(chip->dev, chip->dev->descriptor.iManufacturer,
+				 manufacturer, USB_STRING_SIZE);
+		if (ret < 0) {
+			usb_audio_warn(chip, "failed to get manufacturer string: %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (product) {
+		ret = usb_string(chip->dev, chip->dev->descriptor.iProduct,
+				 product, USB_STRING_SIZE);
+		if (ret < 0) {
+			usb_audio_warn(chip, "failed to get product string: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 1; /* ok */
+}
+
 void snd_usb_init_quirk_flags_table(struct snd_usb_audio *chip)
 {
 	const struct usb_audio_quirk_flags_table *p;
+	char manufacturer[USB_STRING_SIZE];
+	char product[USB_STRING_SIZE];
+	int got_usb_strings = 0; /* <0: error, 0: pending, >0: ok */
 
 	for (p = quirk_flags_table; p->id; p++) {
 		if (chip->usb_id == p->id ||
 		    (!USB_ID_PRODUCT(p->id) &&
 		     USB_ID_VENDOR(chip->usb_id) == USB_ID_VENDOR(p->id))) {
+			if (!p->usb_string_match)
+				goto apply; /* DEVICE_FLG or VENDOR_FLG */
+
+			/* DEVICE_STRING_FLG or VENDOR_STRING_FLG */
+			if (!got_usb_strings) {
+				got_usb_strings = snd_usb_get_strings(chip,
+					p->usb_string_match->manufacturer ? manufacturer : NULL,
+					p->usb_string_match->product ? product : NULL);
+			}
+
+			BUILD_BUG_ON(!got_usb_strings);
+
+			if (got_usb_strings < 0)
+				continue;
+
+			if (p->usb_string_match->manufacturer &&
+			    strcmp(p->usb_string_match->manufacturer, manufacturer))
+				continue;
+
+			if (p->usb_string_match->product &&
+			    strcmp(p->usb_string_match->product, product))
+				continue;
+
+apply:
 			snd_usb_apply_flag_dbg("builtin table", chip, p->flags);
 			chip->quirk_flags |= p->flags;
 			return;
-- 
2.51.0

