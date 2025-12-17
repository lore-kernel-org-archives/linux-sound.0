Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ED02472A8;
	Wed, 17 Dec 2025 03:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765940413; cv=none; b=FNpp9LfwNSHuNkZaIxdokMGeaPcA2mB4Dk7Vssyghs6MM/lNT5YGyGWBss7h5/qS38Y414/w04sDnT15GxWSD54iRw/OU6jR9RWY/BI1YKmy9biEUNOk64BfcvFa0XrSz0SNAKvHBUDU4aeIbzi6rZgFMG1xyUo/2ddzWRWPsYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765940413; c=relaxed/simple;
	bh=pdX6I1TvNwdKYzN1j9l23TqpPnpfHQvlpQoohugFcFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W9hSwor9Hq2OMofftnw0ZFNBTfw1qMRHtXd4SyEtcwRTYHslBotUXFf0kHjHqW6Wh7hPU4Lqa/P0JcgHYYDn/tDde/SBIT6ntihR0h2gu3hHkNfZINpgqNuWumXiZcOuYXo0CNHV7J3qkcFH7TKwAczsDKNJmDw1Ul/9CSvi1vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=GBHdzk/W; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="GBHdzk/W"
Received: from localhost.localdomain (unknown [10.101.197.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 44D2A3FEE8;
	Wed, 17 Dec 2025 02:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765940038;
	bh=LyDRoS0olFDIe1XfW/5n7kAmmLG0nzc8HTbja3DzDQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=GBHdzk/WCHHpOGWnP3JfGPUPLeIAvTj9P4Yxg754LFZjDQTFY8K2wMSehAmDzZKfg
	 GFqk+f3z/J9u/nYKP166Qw+5Vji12q7Pd987F02pI0wOPw/LImSXT1LjzUEIuiKz8J
	 ggBHFuiDrr4YGkI3nr38hSxWHhqmnnW67BjRasCDjAyHEPmHQas8lRkqoaUvjfy4Un
	 Oh1r1ehmL/nQctBHoOjDmYk6WehOVXbG8ZYL4fQ3zD8o6/0WU5uEAQYD+WYy25r/i2
	 DNkyoBsYdN1hLQ2/3v2ML9rOkpUG0kgTR8XEUcVHOA1ukYh0Iaijj4sGwlBdRhqTFt
	 JZnqCxnK7OvjkBDqBiXWLNDd5We9BEFbqXhxS2BgORW06KmRDz4CKxfwrMZLOyWNgT
	 T8rNjZ0pEiaaC5WIT1zhOmhViwqNTCA1LlX91dlo55IqHYzhXwvwhoXg8HQuVi6TJb
	 PbE6hHM3A9D/eXZJJLBD5W3PgIpO9xeQmJqdQAItthsRxGr9IVb0L5itpwhcfbG9g0
	 dhhZ6611ZeSwE2ukfQQT3oEEl63zLYoccVAPqWwhcOB24kQSQeIIAwgpbqQ0aWz50N
	 PU/xbR6HMPqYOfLmIRRi01JtxEjGiznXvixyehrHlmPa5lBXuuo0sfZadBIvEOu6+b
	 xOzD7G3cjkzGFBVX7Jq4cHZU=
From: Dirk Su <dirk.su@canonical.com>
To: 
Cc: Dirk Su <dirk.su@canonical.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: fix micmute LED reversed on HP Abe and Bantie
Date: Wed, 17 Dec 2025 10:52:44 +0800
Message-ID: <20251217025257.44600-1-dirk.su@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Quirk ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO make mute/micmute LEDs
on HP Abe and Bantie functional. But the micmute LED's function
is reversed, LED will be on when Mic enabled and off when Mic
disabled. Create a new function to fix the micmute LED reversed
issue.

Signed-off-by: Dirk Su <dirk.su@canonical.com>
---
 sound/hda/codecs/realtek/alc269.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 171a71457ec3b..75489a9394383 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1656,6 +1656,18 @@ static void alc236_fixup_hp_mute_led_micmute_vref(struct hda_codec *codec,
 	alc236_fixup_hp_micmute_led_vref(codec, fix, action);
 }
 
+static void alc236_fixup_hp_mute_led_micmute_gpio(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->micmute_led_polarity = 1;
+
+	alc236_fixup_hp_mute_led_coefbit2(codec, fix, action);
+	alc_fixup_hp_gpio_led(codec, action, 0x00, 0x01);
+}
+
 static inline void alc298_samsung_write_coef_pack(struct hda_codec *codec,
 						  const unsigned short coefs[2])
 {
@@ -5326,9 +5338,7 @@ static const struct hda_fixup alc269_fixups[] = {
 	},
 	[ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO] = {
 		.type = HDA_FIXUP_FUNC,
-		.v.func = alc236_fixup_hp_mute_led_coefbit2,
-		.chained = true,
-		.chain_id = ALC236_FIXUP_HP_GPIO_LED,
+		.v.func = alc236_fixup_hp_mute_led_micmute_gpio,
 	},
 	[ALC236_FIXUP_LENOVO_INV_DMIC] = {
 		.type = HDA_FIXUP_FUNC,
-- 
2.43.0

