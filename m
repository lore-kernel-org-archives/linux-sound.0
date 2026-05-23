Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE79233941
	for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 21:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779570258; cv=none; b=IQJmBGvAK/lCCK8rqIaiWi13glhU9gqPP72hj1I/1teXnLPdHSYTzkozhpB33STqrASUJptnd6K+kihxyancI1q5lIGK7jqC+Oc6Q+RCAcHAUQkTfqQD1TKkWzbR5M6XK8ZeNVhhFWVIFecAgKRl31HPGNhJfo36QO8XBrIcHgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779570258; c=relaxed/simple;
	bh=l+Dp7IN7AUgkjcOb09jtrHxpDQrmIA7odo4BmfOkkBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hh/HC0OthKLLfUTVccVrv3OH1jTbEOUT/HcPk8tknynoKoB5pmxOa8JARLM8+2R+XYC1tu9nsOaIGM7/JDBbUmGGGORarjytb0ieryHW/szat/02a+Nnx9q5KzfGUqm26hRNfX4yskgt9RypjB62xQCrZ677BVnHNz4gc+5a2lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=IJ8ix3Pn; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="IJ8ix3Pn"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 3855467D31AB; Sun, 24 May 2026 06:34:14 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 3855467D31AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1779570254; bh=GPfU4P6ZrDqo2fmHRmvvpXc7SUSFSEAlT+CbYhcsZps=;
	h=Date:From:To:Cc:Subject:From;
	b=IJ8ix3PnfSUFvUv3D0IPuVUe11C+EmIWiwbvYBb/IUUl1SkYNt+UNclSJz1YSNeMH
	 6tdo/KYt+ng3U8H5r7uiQ6WnEFBqd+7nJTRyfbQvSNQ3UGNcdJ1DqAjFDnmFmRnOS3
	 RuJ/eZZVNWCdopV8FGzvwr+TIaVAhEAzoZAoDu2XvkSSOPu1lL79TsdlUmJFR1Elup
	 kuQRSdyboQUWzZ0ecjsLOLR/IrjSd7RTphHY8/Lh5mvIqSu2WHM1AMbcowm3Ehwv4q
	 c4qMOQJoXGV7cHvCKaay1X+K04UPMcp5Slbpe2IaPi/YkLDhTkqVRMHmfzqLytGQm4
	 kekOukySqg7dQ==
Date: Sun, 24 May 2026 06:34:14 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor gain on
 firmware 2417
Message-ID: <ahIWTueUlWA5xiV+@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Firmware 2417 for the Scarlett 4th Gen 2i2 moved the direct monitor
gain parameter by 4 bytes, from offset 0x2a0 to 0x2a4, breaking the
"Direct Monitor X Mix Y" controls.

Special-case the offset in the get/set config helpers when the
running firmware is 2417 or later.

Fixes: 4e809a299677 ("ALSA: scarlett2: Add support for Solo, 2i2, and 4i4 Gen 4")
Cc: <stable@vger.kernel.org>
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
Tested on a Scarlett 2i2 4th Gen by writing to "Direct Monitor 1
Mix A Input 01" and observing the USB traffic with usbmon:

- Firmware 2417, unpatched driver: write targets offset 0x2A0 (bug)
- Firmware 2417, patched driver:   write targets offset 0x2A4
- Firmware 2128, patched driver:   write targets offset 0x2A0

 sound/usb/mixer_scarlett2.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 8e80a7165faf..a4fac4652201 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2504,6 +2504,27 @@ static int scarlett2_has_config_item(
 	return !!private->config_set->items[config_item_num].offset;
 }
 
+/* Return the configuration item's offset, applying any per-firmware
+ * overrides.
+ *
+ * Firmware 2417 for the 2i2 Gen 4 moved DIRECT_MONITOR_GAIN by 4
+ * bytes. Apply that shift here so that the rest of the driver can
+ * keep using the single config set. This override can be removed
+ * once the multi-config-set framework lands.
+ */
+static int scarlett2_config_item_offset(
+	struct scarlett2_data *private, int config_item_num)
+{
+	int offset = private->config_set->items[config_item_num].offset;
+
+	if (config_item_num == SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN &&
+	    private->info == &s2i2_gen4_info &&
+	    private->firmware_version >= 2417)
+		offset = 0x2a4;
+
+	return offset;
+}
+
 /* Send a USB message to get configuration parameters; result placed in *buf */
 static int scarlett2_usb_get_config(
 	struct usb_mixer_interface *mixer,
@@ -2513,6 +2534,7 @@ static int scarlett2_usb_get_config(
 	const struct scarlett2_config *config_item =
 		&private->config_set->items[config_item_num];
 	int size, err, i;
+	int item_offset;
 	u8 *buf_8;
 	u8 value;
 
@@ -2522,13 +2544,15 @@ static int scarlett2_usb_get_config(
 	if (!config_item->offset)
 		return -EFAULT;
 
+	item_offset = scarlett2_config_item_offset(private, config_item_num);
+
 	/* Writes to the parameter buffer are always 1 byte */
 	size = config_item->size ? config_item->size : 8;
 
 	/* For byte-sized parameters, retrieve directly into buf */
 	if (size >= 8) {
 		size = size / 8 * count;
-		err = scarlett2_usb_get(mixer, config_item->offset, buf, size);
+		err = scarlett2_usb_get(mixer, item_offset, buf, size);
 		if (err < 0)
 			return err;
 		if (config_item->size == 16) {
@@ -2546,7 +2570,7 @@ static int scarlett2_usb_get_config(
 	}
 
 	/* For bit-sized parameters, retrieve into value */
-	err = scarlett2_usb_get(mixer, config_item->offset, &value, 1);
+	err = scarlett2_usb_get(mixer, item_offset, &value, 1);
 	if (err < 0)
 		return err;
 
@@ -2696,7 +2720,8 @@ static int scarlett2_usb_set_config(
 	 */
 	if (config_item->size >= 8) {
 		size = config_item->size / 8;
-		offset = config_item->offset + index * size;
+		offset = scarlett2_config_item_offset(private, config_item_num) +
+			 index * size;
 
 	/* If updating a bit, retrieve the old value, set/clear the
 	 * bit as needed, and update value
@@ -2705,7 +2730,7 @@ static int scarlett2_usb_set_config(
 		u8 tmp;
 
 		size = 1;
-		offset = config_item->offset;
+		offset = scarlett2_config_item_offset(private, config_item_num);
 
 		err = scarlett2_usb_get(mixer, offset, &tmp, 1);
 		if (err < 0)
-- 
2.54.0

