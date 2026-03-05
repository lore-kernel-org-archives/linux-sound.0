Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E3371054;
	Thu,  5 Mar 2026 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772732867; cv=pass; b=U+RXpDqxZ4uwSYK/8urqKrsCNNPzJHxdZSazcMmfWrf4pA+1bi7ZqVfrNn8Myhqw7pLhLWG/i+mx3RrdajnjZVB0SgCMWvFI1gwpj6uJCZlC9LGLwQkilRAJe7ALGjJqY8k6qAqhUjFpF5OId8QFb3bh6SuZAKtwyj0RyKWhyHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772732867; c=relaxed/simple;
	bh=FHW5U5LimJCxTQHX4k4mumzkhqANr+afJlLHUpM7fQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W6TpN8XTKFjfwqIXg6o5CHE8US4f61pEb0pFyw5oYAJH7LIAPKZ+66Ak8SMn8KQDOH528Y5RnXatxcDVSPmNzR/tN/LHl646dArsqgpQFdKyIVd8y0pYh2aC4mKJDIv1J7ixtTmCb1tPXnc2dIwVyT/r3C/9QRkCKQss9sqAEzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=GzhbzmeR; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="GzhbzmeR"
ARC-Seal: i=1; a=rsa-sha256; t=1772732841; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VtrkeHVb17Pv9UHf/NAaAYs0u091YYbOb6p9nNoGjL90i6DNxMDx5X4BZrcg1TKi10VUujd0fM4ySnf7O93qTfg2/+krUT/6Km0UY/XxQfwO7i+aMdHTLJD5s7XnwStjvb3cRe20NBqKxwmPJZI9NMKTS3X4KGEAvINEHm31jwQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772732841; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/M3Zc6FeipLmvGRey4I0i8sTJWwCU3xoQY4oC+FGgHE=; 
	b=cVDJe1CP9LkE8jlHlhmpEU6xtge+48vYs41FjSp34aunsYOXphsb5TnCzIxiGVvaZDrhXEvBWSC7jDx6LIY5cMNj5Tkb7fz1gcXO4XN5ljHyL5P8ZFgiUNWfsvGPw/d0NWToYqbnSpu9PV6iCQt2S62ZOcxC2ueO5HbBpf3OhMk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772732841;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/M3Zc6FeipLmvGRey4I0i8sTJWwCU3xoQY4oC+FGgHE=;
	b=GzhbzmeR1avIv7UXiahyRDLAUgMXmNUBjv7IccVtvp5grrUsrkDKH1hlTeMMFTDo
	vh5jFq5xjTYjtNusibhamSE4tqHW7BGT2PnkKnfYAqBschKoCqDjm400XF0AV8Qbtno
	/OIAZ5cIv6aiErnVX63HFYEavmSJZgFWI4/7tXbLHzAoH+OHb/6Ot40I0N3I2TKGQf8
	pwXWNNKwqWIJc1E2ilY8CctKs10ib80snCvIKx2pS6TFo5lljw47hzfvSlSwIlaPIG/
	ZRUmE2x6k34w3BW0vboRLjUIH/lhrwakBZYMkgbCAKcQLxmYJslZ411+BO67my5J+55
	tG9KgNF9kQ==
Received: by mx.zohomail.com with SMTPS id 1772732838388757.0467718429193;
	Thu, 5 Mar 2026 09:47:18 -0800 (PST)
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
	Icenowy Zheng <uwu@icenowy.me>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>
Subject: [PATCH] ALSA: usb-audio: Refine string-descriptor-based quirk matching
Date: Fri,  6 Mar 2026 01:46:39 +0800
Message-ID: <20260305174711.1106324-1-i@rong.moe>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Remove snd_usb_get_string() and use the manufacturer and product strings
stored in struct usb_device directly to match quirk table entries. Their
NULLity can be checked to determine if the device has no these strings.
This simplifies the code a lot.

Meanwhile, allow quirk table entries to match "no string" explicitly, and
add appropriate comments to show the expected usages of
DEVICE_STRING_FLG() and VENDOR_STRING_FLG(). These changes are tiny and
doesn't form another separate patch, so that back-and-forth changes can
be avoided.

Suggested-by: Terry Junge <linuxsound@cosmicgizmosystems.com>
Link: https://lore.kernel.org/r/b59da54a-9c80-4212-a337-c5ea98da52d1@cosmicgizmosystems.com
Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 90 +++++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 50 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 17f6be4d2350..ab67f7826e9b 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2153,7 +2153,28 @@ struct usb_audio_quirk_flags_table {
 	{ .id = USB_ID(vid, pid), .flags = (_flags) }
 #define VENDOR_FLG(vid, _flags) DEVICE_FLG(vid, 0, _flags)
 
-/* Use as a last resort if using DEVICE_FLG() is prone to VID/PID conflicts. */
+/*
+ * Use as a last resort if using DEVICE_FLG() is prone to VID/PID conflicts.
+ *
+ * Usage:
+ *   // match vid, pid, "manufacturer", and "product"
+ *   DEVICE_STRING_FLG(vid, pid, "manufacturer", "product", flags)
+ *
+ *   // match vid, pid, "manufacturer", and any product string
+ *   DEVICE_STRING_FLG(vid, pid, "manufacturer", NULL,      flags)
+ *
+ *   // match vid, pid, "manufacturer", and device must have no product string
+ *   DEVICE_STRING_FLG(vid, pid, "manufacturer", "",        flags)
+ *
+ *   // match vid, pid, any manufacturer string, and "product"
+ *   DEVICE_STRING_FLG(vid, pid, NULL,           "product", flags)
+ *
+ *   // match vid, pid, no manufacturer string, and "product"
+ *   DEVICE_STRING_FLG(vid, pid, "",             "product", flags)
+ *
+ *   // match vid, pid, no manufacturer string, and no product string
+ *   DEVICE_STRING_FLG(vid, pid, "",             "",        flags)
+ */
 #define DEVICE_STRING_FLG(vid, pid, _manufacturer, _product, _flags)	\
 {									\
 	.id = USB_ID(vid, pid),						\
@@ -2164,7 +2185,16 @@ struct usb_audio_quirk_flags_table {
 	.flags = (_flags),						\
 }
 
-/* Use as a last resort if using VENDOR_FLG() is prone to VID conflicts. */
+/*
+ * Use as a last resort if using VENDOR_FLG() is prone to VID conflicts.
+ *
+ * Usage:
+ *   // match vid, and "manufacturer"
+ *   VENDOR_STRING_FLG(vid, "manufacturer", flags)
+ *
+ *   // match vid, and device must have no manufacturer string
+ *   VENDOR_STRING_FLG(vid, "",             flags)
+ */
 #define VENDOR_STRING_FLG(vid, _manufacturer, _flags)			\
 	DEVICE_STRING_FLG(vid, 0, _manufacturer, NULL, _flags)
 
@@ -2595,63 +2625,23 @@ void snd_usb_apply_flag_dbg(const char *reason,
 	}
 }
 
-#define USB_STRING_SIZE 128
-
-static char *snd_usb_get_string(struct snd_usb_audio *chip, int id)
-{
-	char *buf;
-	int ret;
-
-	/*
-	 * Devices without the corresponding string descriptor.
-	 * This is non-fatal as *_STRING_FLG have nothing to do in this case.
-	 */
-	if (id == 0)
-		return ERR_PTR(-ENODATA);
-
-	buf = kmalloc(USB_STRING_SIZE, GFP_KERNEL);
-	if (buf == NULL)
-		return ERR_PTR(-ENOMEM);
-
-	ret = usb_string(chip->dev, id, buf, USB_STRING_SIZE);
-	if (ret < 0) {
-		usb_audio_warn(chip, "failed to get string for id%d: %d\n", id, ret);
-		kfree(buf);
-		return ERR_PTR(ret);
-	}
-
-	return buf;
-}
-
 void snd_usb_init_quirk_flags_table(struct snd_usb_audio *chip)
 {
 	const struct usb_audio_quirk_flags_table *p;
-	char *manufacturer __free(kfree) = NULL;
-	char *product __free(kfree) = NULL;
 
 	for (p = quirk_flags_table; p->id; p++) {
 		if (chip->usb_id == p->id ||
 		    (!USB_ID_PRODUCT(p->id) &&
 		     USB_ID_VENDOR(chip->usb_id) == USB_ID_VENDOR(p->id))) {
 			/* Handle DEVICE_STRING_FLG/VENDOR_STRING_FLG. */
-			if (p->usb_string_match && p->usb_string_match->manufacturer) {
-				if (!manufacturer) {
-					manufacturer = snd_usb_get_string(chip,
-						chip->dev->descriptor.iManufacturer);
-				}
-				if (IS_ERR_OR_NULL(manufacturer) ||
-				    strcmp(p->usb_string_match->manufacturer, manufacturer))
-					continue;
-			}
-			if (p->usb_string_match && p->usb_string_match->product) {
-				if (!product) {
-					product = snd_usb_get_string(chip,
-						chip->dev->descriptor.iProduct);
-				}
-				if (IS_ERR_OR_NULL(product) ||
-				    strcmp(p->usb_string_match->product, product))
-					continue;
-			}
+			if (p->usb_string_match && p->usb_string_match->manufacturer &&
+			    strcmp(p->usb_string_match->manufacturer,
+				   chip->dev->manufacturer ? chip->dev->manufacturer : ""))
+				continue;
+			if (p->usb_string_match && p->usb_string_match->product &&
+			    strcmp(p->usb_string_match->product,
+				   chip->dev->product ? chip->dev->product : ""))
+				continue;
 
 			snd_usb_apply_flag_dbg("builtin table", chip, p->flags);
 			chip->quirk_flags |= p->flags;

base-commit: b364a0d23cae157691cde2c0137998d66b45b703
-- 
2.53.0

