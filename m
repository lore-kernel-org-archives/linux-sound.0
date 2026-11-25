Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594604;
	b=z0b4e7mfYJLY1ITW1JMak9C4Er5vldLr83haC1b+r5u/uZfxOAP6NiOLcmxQWZhgqPXS
	 /ZaX7cFKYy9fC1J+QimQQ6NuX16beRXxd9c4p0oCn1DXJPffyD/Z6tCpSBFWALBY6XO6U
	 n9qNwjcLg3p3dhsRjpz4FrQKGC5B7ULgyg0bpg+NgFBmGkWNrRJV2RTbUiAoYPuxDCq8+
	 dzkXy2nVr2EaYOxQSrWLI//Tien7OtQLAd5/3oaBqTao24iS6xx6YWwUuPdevfiJJxHuX
	 dhp9E09E28A7tWvn5hxQWpc9A4wk4Y1gfSGyhEgbSNrrDHuUK2sjYUX04tMaBALaQ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HdbAsT3RhoxelmVCsoDIIpH6BVqCr/7qLnRcLrkPwGo=;
	b=Phuudin7dtY4eBSfg4RuiiR+E4NF8flxgLxcp3zEk8Qqb/MnYJauV7EbzSIGFbzG/yAQ
	 bQLn6FN9XEPW42MvSGay6KSJeMleDKG2woRQqiClalCbXz4gZFJLatcc1+GyipbQhsPAQ
	 WT0IQLhA73yRto7ch26IFwh8bfwCbRts/oLr9N0u7QtUUqrKs1RygrsOB7aHjES//VnEx
	 GST6VqNbBzSLJ12G1zKcOuHYxW0XthYzk5uVblxoXdgXRHuCAH0tL7eIaD2HNWbK7qQf7
	 mYq2yWCtFMM+RtuSM36B4bEVSI3AkESFegFIaAaghhhnagXMFZ4mUyBK6v+trfHwiJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pvZ/01q/";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F3606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 08:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3F3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pvZ/01q/
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso3384703a91.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 00:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594603; x=1796199403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdbAsT3RhoxelmVCsoDIIpH6BVqCr/7qLnRcLrkPwGo=;
        b=pvZ/01q/qJ6P+ie7GrfTzijYyI+fvvdiwizgdBbWHup6X1Hso29mX5KUTiDDyxO/Fv
         h5cVu5SHeMof+SKEBXwcwPoRTeDDPhIiVsL2uBclbWFJZZlaLAv5g59hQkinyMvpledL
         4QiAf8FOkIfWCBugtG/kdHTr4WV72h8KuIHT/IwM1bCVryzG30x8tFVOGAk9mIrgqkmp
         9zj7VBjLYna0Uc8J0OY2HppKc9HC1Nlw76gynkDsPsmeXVSC72SKII3/2Xrb6FwhmgUW
         RMWjTBWgYIhX455jF5J42s77KIb31W8pK/DGAnFUhLYItaM6K26fBtK/t4dpS7E+vBPT
         UDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594603; x=1796199403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdbAsT3RhoxelmVCsoDIIpH6BVqCr/7qLnRcLrkPwGo=;
        b=R1RbynlM7UXx6SlQPi2BquWmCqtYKLNPszRGh/bwJ5TRDM8wshx3FBiZz+Z39CqGc1
         Q9lm/riZPl6ut6UufNfjYSB08b0NkQnTevEbJuohC1iZlYe/ODvUO+17SxUF6n3e+SlS
         b/7XTaYKoJ7QTXeV8eAPK5XgnmHqJWfUj8eq1MnVqv4ogTA+l5DZWYNKtzzFg+Is4q13
         FZYMCavyg6zugzyvGeFBdnOEz1PUC9ETqAJud0dMlPmrQKFP0YXoW67h6tYZhdGIaNlD
         3Rz5hm/EbGlkdhunJ1kAYGy+6gLtK3r6mKhkZRTSukacBhWpumpWmGsGdpWkGrnvBjKe
         tvxQ==
X-Gm-Message-State: APuU4Z+AH/Wqf+Er8tZltKk7Z9PS4+MMn9M5PlX5X4wUkcHU+UTVA3G8
	1KYWiehoYtEBgRh9zAUaUBTJRtM0XdRe5x9pbh+/miSsoLN2VZoF64+qA40hVg==
X-Gm-Gg: AZFdTZcpcOV07x2yTwNWzaoiOHvVOrokfl9tQZWHOnqdxJ0EZAgaqeL6PRoHQW99Ejj
	JFMyhApqmzHy/zcez/hga6i5oiBCAe1YLP4nvdh+qI0j2iQI4Usw4fjuxBCAa0Gncyx39N1haI8
	jy2qTKugVY/bOp9BItXWYLc1rtZq6mKuIub59s7inzFwPimXtaokSo0ch55qfb7bQs+A9nqSBXd
	DFohm8cgidPdJnx07bETqIueOLL5TzF9gHGkVaghT7H7jryiaR0FpCfnQKwfHG/WH1itCRXhU7T
	NjF1J2K7ZgBuSBynesYcRoXl93nD6QWUTjmJEboC/mNblObk+RF/M2HT7z/HiCbo14PfPEu9aAf
	VV5jhg6ZmX0trhtW1EbNmCOQ+ZQM9abXa0+gQY4VbHsTNPM4kpW9REAImeCagQjlb16ZKEn7Qjs
	KC+MMLJM/+rxyZg0jHLNrTVjiXn/G9gAdYyadbh5lbYP4W7ji2VgLsXpHGUmbR0f7whtFc98wSx
	86nbDpRY+ukWf5d81EVVmsCnUGx+k/5XZMN7tsyL9EwbXbZVmfTd6AOlWBFk5P34TbOZh9S8rzP
	P9fvZ1kQNfFKgmxh/1DNFqbTg7C6xnCZ6ns=
X-Received: by 2002:a17:90b:4e8f:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3b41c959e46mr18764296a91.45.1795594603193;
        Wed, 25 Nov 2026 00:16:43 -0800 (PST)
Received: from neo16.Davolink ([2406:5900:7035:910e:b075:7756:fdfb:facc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm29653734a91.15.2026.11.25.00.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:16:42 -0800 (PST)
From: SungHwan Jung <onenowy@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix distorted headphone audio on Acer Predator PHN16-71
Date: Wed, 25 Nov 2026 17:16:36 +0900
Message-ID: <20261125081636.4619-1-onenowy@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Acer Predator PHN16-71, booting with headphones already
plugged into the 3.5mm jack results in distorted headphone audio
until the headphones are unplugged and replugged.

Vendor COEF 0x4a reads 0x2010 when the distortion occurs, meaning
that the Reset HP JD bit (BIT(15)) is already clear. Clearing the
bit alone doesn't fix the issue.

Add a dedicated fixup (ALC245_FIXUP_ACER_HP_JD_RESET) that sets
and then clears COEF 0x4a BIT(15) during HDA_FIXUP_ACT_INIT while
preserving the remaining coefficient bits.

Chain ALC245_FIXUP_ACER_MICMUTE_LED to retain mic mute LED and
headset microphone support.

Testing confirmed that pulsing COEF 0x4a BIT(15) restores clean
headphone audio.

LLMs were used to assist in analyzing the cause of the headphone
audio distortion and refining the commit message.

Signed-off-by: SungHwan Jung <onenowy@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 0c2442d98a3e..45371686da62 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1462,6 +1462,17 @@ static void alc245_fixup_minisforum_jack_detect(struct hda_codec *codec,
 		alc_update_coef_idx(codec, 0x4a, BIT(15), 0);
 }
 
+static void alc245_fixup_acer_hp_jd_reset(struct hda_codec *codec,
+					  const struct hda_fixup *fix,
+					  int action)
+{
+	if (action == HDA_FIXUP_ACT_INIT) {
+		/* Pulse Reset HP JD */
+		alc_update_coef_idx(codec, 0x4a, BIT(15), BIT(15));
+		alc_update_coef_idx(codec, 0x4a, BIT(15), 0);
+	}
+}
+
 /* turn on/off mic-mute LED per capture hook via VREF change */
 static int vref_micmute_led_set(struct led_classdev *led_cdev,
 				enum led_brightness brightness)
@@ -4554,6 +4565,7 @@ enum {
 	ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY,
 	ALC245_FIXUP_BASS_HP_DAC,
 	ALC245_FIXUP_ACER_MICMUTE_LED,
+	ALC245_FIXUP_ACER_HP_JD_RESET,
 	ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
 	ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED,
 	ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
@@ -7392,6 +7404,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC2XX_FIXUP_HEADSET_MIC,
 	},
+	[ALC245_FIXUP_ACER_HP_JD_RESET] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_acer_hp_jd_reset,
+		.chained = true,
+		.chain_id = ALC245_FIXUP_ACER_MICMUTE_LED,
+	},
 	[ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_fixup_hp_mute_led_coefbit,
@@ -7576,7 +7594,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x166c, "Acer Predator PH16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
-	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC245_FIXUP_ACER_MICMUTE_LED),
+	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC245_FIXUP_ACER_HP_JD_RESET),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_ACER_MICMUTE_LED),

base-commit: aa10c1b25efa97f58680298f609c14cc686dcf1e
-- 
2.56.1

