Received: from mx-out-01.sud-ouest2.org (mx-out-01.sud-ouest2.org [87.98.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0562D5C68;
	Sun,  2 Aug 2026 19:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.220.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700631; cv=none; b=B8CH+XdRe9qgSDBATHmHGdoGm7Swcp54lawG2EPXtjW58mGgpalyU6RU34N9vvvYJjzBQ7P9UhIypequ8LRuv5kMCrBwrGagj8fYl65+5PTb4SoPmOsqnFsw5KA6U/wILs+SzK8g9OXtLb6fSxP+itCSRf1y4vv5mVuPCemwxPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700631; c=relaxed/simple;
	bh=ghKkXp5tf0l1qY3Hy0loXlmXI8CZXJVXMIkB1oasIgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJTLM3vByu3QsVHcXdqxzqsgqYNdBFy3j4N56baTu4xSdT6WkSbNR0sa34SbNfXhijInghdfOv57R4OVN/gXanXMJZVN4z70/8eoExdSa9lRBiUemH7pkgyLBnLggpO0BBof3Q2LO5w+fmCb9rFbrK5BUT+bjUTuvnJxDykOe5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jeremiez.net; spf=pass smtp.mailfrom=jeremiez.net; dkim=pass (2048-bit key) header.d=jeremiez.net header.i=@jeremiez.net header.b=ZuzVs/NO; arc=none smtp.client-ip=87.98.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jeremiez.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jeremiez.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jeremiez.net header.i=@jeremiez.net header.b="ZuzVs/NO"
DKIM-Filter: OpenDKIM Filter v2.11.0 mx-out-01.sud-ouest2.org 6D26629F4DC
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=jeremiez.net; s=dkim;
	t=1785700118; bh=ghKkXp5tf0l1qY3Hy0loXlmXI8CZXJVXMIkB1oasIgw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZuzVs/NOJN73yBqqa1WGvwW8Zf+nTwCLeysUushNyoCcfcKVd+VuE1se3Ua5pfVLl
	 WBRg2/7E2u5rtNHP+PerShJPTD14qLaKXuLjMM0Loob4vYQZE6LK7KBW0WGFNT0s9k
	 2IXSoNcsfbLrma8iukcrqp6nwIpLfO3LvtKKwXyH8mmnm4lZb6D4md90dR2lNHBWi7
	 GHw7tw/X/4q91+AUm7dd8BOO9sCfKVowWeP5hhuSsB5VkDRPCHeazdHcVRtUIL6+xY
	 Ctli1E3siT2bOtEepdjNo955qxkSOUHnZ5h56vu8fwA5T1Rw5xkDD4A3dqL2YzNTkk
	 Z4z/AD7dAfAqw==
Received: by mx-out-01.sud-ouest2.org (Postfix, from userid 112)
	id 6D26629F4DC; Sun,  2 Aug 2026 21:48:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.sud-ouest2.org (Postfix) with ESMTP id CB695190088;
	Sun,  2 Aug 2026 21:48:37 +0200 (CEST)
Received: from mail.sud-ouest2.org ([127.0.0.1])
	by localhost (mail.sud-ouest2.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vpjfVcZHVFWn; Sun,  2 Aug 2026 21:48:36 +0200 (CEST)
From: Jeremie Pardou <jrmi@jeremiez.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Enable jack detection on Minisforum AI X1 Pro
Date: Sun,  2 Aug 2026 21:48:32 +0200
Message-ID: <20260802194832.49393-1-jrmi@jeremiez.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware of the Minisforum AI X1 Pro leaves the headphone jack detector
reset bit asserted on its ALC245 codec. As a result, pin sense on NID 0x21
always reports the jack as absent.

Clear only the Reset HP JD bit during codec initialization. Preserve the
remaining coefficient bits. This makes pin sense and the generic HDA
auto-mute logic work normally. Apply the fixup at INIT to also reapply the
setting after codec reinitialization and resume.

Tested on a Minisforum AI X1 Pro with codec 0x10ec0245 and subsystem
0x1f4cb020 using Ubuntu 26.04 kernel 7.0.0-28-generic.

Signed-off-by: Jeremie Pardou <jrmi@jeremiez.net>
---
 sound/hda/codecs/realtek/alc269.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 48a2e7f2e..e21cd8b2b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1392,6 +1392,15 @@ static void alc245_fixup_hp_gpio_led(struct hda_codec *codec,
 	alc_fixup_hp_gpio_led(codec, action, 0, 0x04);
 }
 
+static void alc245_fixup_minisforum_jack_detect(struct hda_codec *codec,
+						const struct hda_fixup *fix,
+						int action)
+{
+	if (action == HDA_FIXUP_ACT_INIT)
+		/* Clear Reset HP JD while preserving the other coefficient bits. */
+		alc_update_coef_idx(codec, 0x4a, BIT(15), 0);
+}
+
 /* turn on/off mic-mute LED per capture hook via VREF change */
 static int vref_micmute_led_set(struct led_classdev *led_cdev,
 				enum led_brightness brightness)
@@ -4197,6 +4206,7 @@ enum {
 	ALC287_FIXUP_LENOVO_THKPAD_WH_ALC1318,
 	ALC256_FIXUP_CHROME_BOOK,
 	ALC245_FIXUP_CLEVO_NOISY_MIC,
+	ALC245_FIXUP_MINISFORUM_JACK_DETECT,
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
 	ALC233_FIXUP_STARLABS_STARFIGHTER,
@@ -6729,6 +6739,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	},
+	[ALC245_FIXUP_MINISFORUM_JACK_DETECT] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_minisforum_jack_detect,
+	},
 	[ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -8067,6 +8081,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1e50, 0x7038, "Positivo DN140", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1ee7, 0x2078, "HONOR BRB-X M1010", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1ee7, 0x2081, "HONOR MRB-XXX M1020", ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO),
+	SND_PCI_QUIRK(0x1f4c, 0xb020, "Minisforum AI X1 Pro",
+		      ALC245_FIXUP_MINISFORUM_JACK_DETECT),
 	SND_PCI_QUIRK(0x1f4c, 0xe001, "Minisforum V3 (SE)", ALC245_FIXUP_BASS_HP_DAC),
 	SND_PCI_QUIRK(0x1f66, 0x0105, "Ayaneo Portable Game Player", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x2014, 0x800a, "Positivo ARN50", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
