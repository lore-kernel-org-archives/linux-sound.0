Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2E223707
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777151837; cv=none; b=YgGMnsBLBkdxFsERYMMwY8X4tluzJYcgUWXy5hurRNyXO0uS5+TqDl1tAYvoXpjoSor77B1YMgsGH1zH981BI56vIkEXK0Cq3P+gHwCeGhCBteRDpD3L/np3oVi4A8C74SwvzFNn5/BANLjCex2vNCn8rncRcZ51zYd7tAyp6EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777151837; c=relaxed/simple;
	bh=YJ/XpQLIVxi/lRYg1ks15A1e0otL4OCuKF5p/NJiUo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FI0MAa+LsbulbpZ4TlFHJeS/ZvB+ZzSwN+djd8AmFg6nLCeWhA7nprSG4YfOyffkNI8CncX1Pegq+ouDNdI12Pr1N0wdSt3Cfcg9qmojCpsU7xXQDQL4qefZXCgxdQmSK8ISjyUVJEiLhXBfJyaOF3XqdbPgqw6bISsu3vJCXoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=OzSWrt8t; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="OzSWrt8t"
Received: by m.b4.vu (Postfix, from userid 1000)
	id C1F3667BDB24; Sun, 26 Apr 2026 06:47:14 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu C1F3667BDB24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1777151834; bh=wO0wkn3l8nizjOTcyCfAsgJkFAyLbV67JyA8uipd5u8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OzSWrt8tEcHONKqjXt+pGPk3PvyIzVMADbWBRiPW2bmLj5nHNSGOJJaSiALMrMYXN
	 n56U07x+20km2eHh3DriFG6XOH20Hu5JMOtXr4UbbcRWA4g9tixMVxiDaUzHy5LMAt
	 47hXOwlyzGaOu09er+NZoiJHCj5RDyzM5LAf4fRKFWryj8TRWEdw62GSNAzmNwbXV1
	 9S0WOqPhTKeDcC/AYrWZoqSg4lWpIl55r7PEnkk9VDO5RcLbbMDQNb9ZDTbdGARc4z
	 PbQ3jKlimBRKCfI0VucE5r5/+Qm0VxzJHm9y3NXVRHOR1S5Tm7msECsHwI9ELgBygA
	 Gfo1/+nIaGSqQ==
Date: Sun, 26 Apr 2026 06:47:14 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 3/3] ALSA: scarlett2: Update offsets for 2i2 Gen 4 firmware
 2417
Message-ID: <ad0fc5a131e76eb656a24e0e198382f7134068fe.1777151532.git.g@b4.vu>
References: <ae0tEsi8dKm1akJd@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae0tEsi8dKm1akJd@m.b4.vu>

Firmware 2417 for the Scarlett 4th Gen 2i2 moved the direct monitor gain
parameters, so add a second config_set with the shifted offset and
select it for firmware versions >= 2417.

Fixes: 4e809a299677 ("ALSA: scarlett2: Add support for Solo, 2i2, and 4i4 Gen 4")
Cc: <stable@vger.kernel.org> # ALSA: scarlett2: Allow selecting config_set by firmware version
Cc: <stable@vger.kernel.org> # ALSA: scarlett2: Fold min_firmware_version into config_sets
Cc: <stable@vger.kernel.org>
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 58 +++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 68adec4f21d9..bb7373fac63a 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -937,6 +937,63 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2 = {
 	}
 };
 
+/* 2i2 Gen 4, firmware version 2417 and above
+ *
+ * Firmware 2417 shifted DIRECT_MONITOR_GAIN by 4 bytes; all other
+ * offsets are unchanged from scarlett2_config_set_gen4_2i2.
+ */
+static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2_2417 = {
+	.notifications = scarlett4_2i2_notifications,
+	.param_buf_addr = 0xfc,
+	.input_gain_tlv = db_scale_gen4_gain,
+	.autogain_status_texts = scarlett2_autogain_status_gen4,
+	.items = {
+		[SCARLETT2_CONFIG_MSD_SWITCH] = {
+			.offset = 0x49, .size = 8, .activate = 4 },
+
+		[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
+			.offset = 0x14a, .size = 8, .activate = 16, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_AUTOGAIN_SWITCH] = {
+			.offset = 0x135, .size = 8, .activate = 10, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_AUTOGAIN_STATUS] = {
+			.offset = 0x137, .size = 8 },
+
+		[SCARLETT2_CONFIG_AG_MEAN_TARGET] = {
+			.offset = 0x131, .size = 8, .activate = 29, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_AG_PEAK_TARGET] = {
+			.offset = 0x132, .size = 8, .activate = 30, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+			.offset = 0x48, .size = 8, .activate = 11, .pbuf = 1,
+			.mute = 1 },
+
+		[SCARLETT2_CONFIG_INPUT_GAIN] = {
+			.offset = 0x4b, .size = 8, .activate = 12, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x3c, .size = 8, .activate = 13, .pbuf = 1,
+			.mute = 1 },
+
+		[SCARLETT2_CONFIG_SAFE_SWITCH] = {
+			.offset = 0x147, .size = 8, .activate = 14, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x3e, .size = 8, .activate = 15, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_INPUT_SELECT_SWITCH] = {
+			.offset = 0x14b, .size = 8, .activate = 17, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_INPUT_LINK_SWITCH] = {
+			.offset = 0x14e, .size = 8, .activate = 18, .pbuf = 1 },
+
+		[SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN] = {
+			.offset = 0x2a4, .size = 16, .activate = 36 }
+	}
+};
+
 /* 4i4 Gen 4 */
 static const struct scarlett2_config_set scarlett2_config_set_gen4_4i4 = {
 	.notifications = scarlett4_4i4_notifications,
@@ -1993,6 +2050,7 @@ static const struct scarlett2_device_info solo_gen4_info = {
 static const struct scarlett2_device_info s2i2_gen4_info = {
 	.config_sets = (const struct scarlett2_config_set_entry[]) {
 		{ 2115, &scarlett2_config_set_gen4_2i2 },
+		{ 2417, &scarlett2_config_set_gen4_2i2_2417 },
 		{ }
 	},
 	.has_devmap = 1,
-- 
2.53.0

