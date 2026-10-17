Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADF13AE6FD
	for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230707; cv=none; b=HSnVnqc5UCQabHWzSNCllHzRNBzvJaqOgeEjFeJfWqYtCx6BKuU/sS5dZQ+5qWpFCBAG8ytVaI6CAvswEUHcm3LLlLyDwgHJRUHGR6aSuyqgP2Dr4uoJHm2CDUpLlUQLp3Hb1DEJz0JGapXOQ59PI3l1t82cf8eR1JerXGqasJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230707; c=relaxed/simple;
	bh=h5/pNBfgIX4U6g7VbQJ8F76qJ/CQS74E8c/6/NUQOhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mIFzX4RkZbDym2BpntngTShchzjAjF7ewws8vB6hRmkq1RtKKLBPloqFd/BBFZQVddaV/5SLQd9AgdO37uiueNS5YRCwkk0zf0pszwqL+nDPBlocgHMNagxB65gSo6T6pIPC8R11apVZyleIvMjN+PhYrQD0HPElG3mOhT4uS+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXDUs3VQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXDUs3VQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso3052925e9.1
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792230704; x=1792835504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPFE+T+UOex+WfaugXlY6Is3b+0jqxq31VIJ6jkwt28=;
        b=WXDUs3VQQv5xkhGeuSnTXjJV0izBKKhA1MjyCCJwNDZGXZ7GPEMxCwWyAdxdnDFnEI
         PJy4hv7MtCI/xzicgYs1pBeCwvxZoTzpwe+r5E9JYk6KoXCnMy9ia7HLL4LkPFx9ZzIK
         TdLhdeXB59cqyIPSFV4VQCpUxv+mKOGr9H7Y6udaES5bxw/KdrINm/v85iHQ6EVk2for
         7CW7XuN06OAUCidNE9WjzaM6FYo1C92aDemYl9eqzyG8rr/Oar0Ee4aNtuyVyYx60DOr
         QfePjTY3YE5B4QYwuVf5Wz9O4meNmoCNNGLWL0IeOc5bFWsY27MrO42nJD5fnsGpzfgf
         KWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230704; x=1792835504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPFE+T+UOex+WfaugXlY6Is3b+0jqxq31VIJ6jkwt28=;
        b=SYZK3oLJYQ8/Rw2qlY1CitjK3ZdEr+C3y/WZlcx3qQr1B+XVApGv2rEkanvit1jKcS
         pLw4HvObB/UEZQ/OVaaweKdpuABZgwd0kGEkgcYVqT+ZpY6xGG3Tu+uo+eAajDJK0jIa
         vwtEWO+t/HCcaqRFkEXoe64qZgPrEZyDexUgxlGA9eueavOvE0/cjjiCJSTSjY6pBU9T
         f7mFe3Lv7pV44hBYKg4tsPJi28DgI0DHbE18O5R2TEMGga77SwnCSfQmekFbJW6L51xV
         RMqlRLjROBPx7dY4ANHMcnGtwLz9M8va0o1ywfxQBVAMJaQhpMAK/ZeY33cEea5K1hZ1
         5L2A==
X-Forwarded-Encrypted: i=1; AKwUvBz1k/eVenVd2C8pHUzmcfRDPE74HIJT1xKibTP28MDVOmkQjt0Tw6mcyrdAB5P998MD6/v7ffOFoNXTBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLr9+q9laILTlwxdBtPlp1pmJwWzz9xFlo81Tn/Rzxcq3SR2Wxb
	3YMQxxm/rZFsNmhdSwSTmJmlXwOUTvVRK7HEpTzYQt4PSSU4GioshGHI
X-Gm-Gg: AYBFou3ibXgaMELQsMVrGFxrMVafWNorwqwhqA8yw1hLHA+qT9H0tqI5xm0iQnyp8fg
	RkAv8ne6twhuPZCVxNbWubVyufcFqe/3IjoyOlb7KJE2zaiwVccG3XYN1pEyF+6fDMyqTBkTf7b
	0zVdyp4A+1dBDnmKTKMY29mTrCyDZCd5htarmWP0W2ZmbmtUi9rHgppPH2gGk0WNvIUdnliKtMV
	ZYaX1xQi25TUe3+TxksDRJikkN/xd9Xr7XpFidWSq7TkPPLPS1Rj8FWtXhX1jUECvuGEbIaBb8m
	uDKya7uFfXdfi1LyFpKfSyv0b+TSfZX/mYKMyfuIT4NH54f7z2WwxbWq3kTc0gmqIdLA6eSw71V
	IGIm6ZQltzZF6+qmTilAX+dSAkn6LEqCiwIblabR1t5V4H/XZRBrcF71eFHDudEWARoiwCIW/AM
	hIjh1Culhcx2CYspa9iaqHNFL90+EAFzz+tanBTgytdre7fAunDKtc2BJrmRjtdv4eGkMYQaG84
	tH8/ta4P+8=
X-Received: by 2002:a05:600c:3556:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a1d76051b8mr49522825e9.17.1792230703700;
        Sat, 17 Oct 2026 02:51:43 -0700 (PDT)
Received: from archlinux.dns.quad9.net ([41.90.172.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d30d778bsm97705545e9.9.2026.10.17.02.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:51:43 -0700 (PDT)
From: Keane Mbae <keanembae@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Kailang Yang <kailang@realtek.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Eric Naim <dnaim@cachyos.org>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add mic-mute LED quirk for the HP 245 14 inch G10
Date: Sat, 17 Oct 2026 12:51:32 +0300
Message-ID: <20261017095132.20279-1-keanembae@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP 245 14 inch G10 Notebook PC (codec SSID 103c:8ba4, ALC236) is not
listed in alc269_fixup_tbl[], so the codec falls back to the vendor-wide
HP entry (ALC269_FIXUP_HP_MUTE_LED).  That entry only registers a speaker
mute LED (hda::mute); no microphone mute LED class device (hda::micmute)
is created, so muting the microphone never lights the LED on the F8 key.

On this model the microphone mute LED is wired to COEF 0x35 bits 2-3 (the
same register as ALC236_FIXUP_HP_MUTE_LED), but with the opposite sense:
1 << 2 lights the LED and 2 << 2 turns it off.  Setting
micmute_led_polarity = 1 makes alc_update_coef_led() write the level that
matches the hardware.

The speaker mute LED (F5) keeps being driven through the HP_Mute_LED DMI
string, exactly as the current fallback does.

Add ALC236_FIXUP_HP_MUTE_LED_MICMUTE_COEF_INV for 103c:8ba4.

Signed-off-by: Keane Mbae <keanembae@gmail.com>
Tested-by: Keane Mbae <keanembae@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1623cf9..25f5b51 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1754,6 +1754,25 @@ static void alc295_fixup_hp_pavilion_mute_led_1b(struct hda_codec *codec,
 		spec->mute_led_nid = 0x1b;
 }
 
+/*
+ * HP 245 14 inch G10 Notebook PC (SSID 103c:8ba4): the speaker mute LED is
+ * controlled through the HP_Mute_LED DMI string (NID 0x1a), same as the
+ * ALC269_FIXUP_HP_MUTE_LED fallback, but the microphone mute LED is wired to
+ * COEF 0x35 bits 2-3 with an inverted sense.
+ */
+static void alc236_fixup_hp_mute_led_micmute_coef_inv(struct hda_codec *codec,
+						      const struct hda_fixup *fix,
+						      int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->micmute_led_polarity = 1;
+
+	alc269_fixup_hp_mute_led(codec, fix, action);
+	alc236_fixup_hp_coef_micmute_led(codec, fix, action);
+}
+
 static void alc233_fixup_lenovo_coef_micmute_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -4237,6 +4256,7 @@ enum {
 	ALC236_FIXUP_HP_MUTE_LED_COEFBIT2,
 	ALC236_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
+	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_COEF_INV,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
 	ALC236_FIXUP_HP_15_FD0XXX,
 	ALC236_FIXUP_LENOVO_INV_DMIC,
@@ -6033,6 +6053,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led_micmute_vref,
 	},
+	[ALC236_FIXUP_HP_MUTE_LED_MICMUTE_COEF_INV] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc236_fixup_hp_mute_led_micmute_coef_inv,
+	},
 	[ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led_micmute_gpio,
@@ -7622,6 +7646,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b92, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8ba4, "HP 245 14 inch G10 Notebook PC",
+		      ALC236_FIXUP_HP_MUTE_LED_MICMUTE_COEF_INV),
 	SND_PCI_QUIRK(0x103c, 0x8ba9, "HP Omen 16-wd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bb1, "HP Victus 15-fa1xxx (MB 8BB1)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.56.0

