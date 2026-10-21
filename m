Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792545743;
	b=cOULmJ6fbH0i0rK81PhxgSnVaCwl91v7WjfsooyrAyuX7JsuiMWzHp2GcOtYyT/1OC2o
	 NHC5MmRas4PzBkYL0Vxz8MSBdxGNH7nJnvXGDHPR/YQN7Xgs7mw24YZiQR/NizyKXEEjQ
	 yUdd3B4s27cJn3wPXEK7zzifIJeSOPa2EgBcJbetDLeJXWGZBBsds5C99I6+wzOVfamth
	 neJ3C7u8p1FZiopBt+E3dVEZ5sIPAkOSB53NnDlbc/9zSmV/bW3w8KOHBmsZ+KfZggFOi
	 h5flJtAEafcuWYQ/SXehVW6FBmCUuwU+vyq8i1h5eIDPdmsDmH6GKq5GOZ5rzEz601A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792545743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/06k/OCF8qTJ0wBVY/M8ek9mzAGmnWdgB2kFs8X3vhc=;
	b=EwP5pB1rWQJwIDUEspHXJ34auoqckYmFIlvpf0fpnALkuIKZKiCgDe7O0ivcDVm+0f76
	 6/Pj0nw25W7c/J8FLqG4f3VxohUFrFJY9MxxIbL3ExXnRIaORTGcWLL2pzCAJCZTDJtSd
	 YW+TkoNmWipgxvQRDvCgZ2koxzXR/QHVeSUr22TFfOsPJfO7Wz8fcvmc2I/U1S+BDO/LX
	 mhghpDdqf2n3R162UQjIy2HUCUVb1t8ysW3m4dve0gXNVpyC2FQsRJ07NwL0oqy6QpNT3
	 K//o3nJSK4X4AbKjiPPiJWzpd9NHtG3VEwOGLrM3ATywdoHQrA9p8Ysn6GfQbPSLPrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=obwkoVec;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B558D606A31B
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 01:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B558D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=obwkoVec
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15354aa70e8so615991c88.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 18:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792545742; x=1793150542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/06k/OCF8qTJ0wBVY/M8ek9mzAGmnWdgB2kFs8X3vhc=;
        b=obwkoVecAkYYZz8g4jFcYK7AYWGEYr4NK+xZTIJYXNVAMhuNsmp4RnYr8Sc8c3FFa3
         co7DEXC5uG6TP9+Kmah33xHb3viiK3hRgqddzXyLBLSnVlAcZ2lb/kShvIzYXEU8tkX9
         5RVRiGkYAX3cJFFbDl7YyBFl7AnP8ZJcuNCNEjVznRvZ/cM4SsnS+c83NRNyHqMEkzzn
         wEW6InOM8DXK7nyLH4WZIV6/9eu0YP0JqNTqoKviXrACHl3qhE/6uG3jP9bjYRZ6YYRB
         F9i8S4nmlcu1xnrkIrK5498J3RfErA2Uo61d6DH6+vX/vqZvXTBCt1lGuHDqplU9FQnS
         5yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792545742; x=1793150542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/06k/OCF8qTJ0wBVY/M8ek9mzAGmnWdgB2kFs8X3vhc=;
        b=dfaAS1Ej2d4cSI4KsQJlKnGeDenVSTFXNeLWMfAD/OtEv6pYZGiZ3TErsJnglsnpyw
         iyKo4S9t0eW8caYKJpuPT5SqvKWEMTz9VzPgaE3Kr0JDsrJlOJ+D/RrBs3ugFazWchMe
         TvioQf3TL9LKaymERY5EkZDuBm/m8r9yZhSgoGH3loR0tckW0sizyNo4xjRl7Mo6USSv
         t50PzBphh5QEQy4o3pWLTU7mLG8q+UoZWkibf3y3Gn6B12+wck22XWSXFG7o5HuwlGFH
         4/B3QDz3Luvt5SFTLVGxliIb0Z/EmW7Bx3APlrONiD3gAI6rCS8kISmKlTmNWrAXxgrq
         uleQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4T+js4399NfEoLPpix6lUCFPcNVlCwC/2Ki9AK/wsqUpLvO+WqrWya9vfmooVIIX+h1p7tGyj0A2IKg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJRgmUFJptEgaZ+heQIeb5H0nDjZvus50xqZRH1mo7AKafHJSC0
	sgd5I5YeVRNYRNc5T5TmsUT3dWJGbSzLbCtXgVlxmqPJmjDOB7JvGzDRYSfwfKAqpwI=
X-Gm-Gg: AYBFou09Rs16U78umG6IqfuaxrGkYzyJmBSlTuO/TNuxEPQslIo0rmMKpwq+2dOHk3X
	zSkN7QzhiXVmFlbTrPH5kIzjogi63cxjSjD02lxjOEyoO3utXyB1JKgDItsD5pXQOXBXnPKPNDu
	P7lJ9fFXB3h1WpW9ivshLz1K5EuLxwMWoNPUx/M2cOUaSduKXb82xVwYMzFIZmCuc3BrflQ4IVp
	+7JxxxC1NyBidyvRx6jJjgVPNqzp2QqGkX4KcdMmSFN7eYY5qgzK7JgVI08ATcaC6VQLnlUU7Xz
	2hmYbs1XBRWz+9dOhunnmfuZy/XYF5A+8Z+gP4qCDGqCCX2abqs8xqg2AN6blFj9Y8Nwjhm7/BA
	Nr3gFngAJNGzL1HlzQJjzdTC41AcWM0HIM7rQyMu6hy5F4wrRdbbKLu4mcr8NnHIsFTr+NwrfRL
	42rHg9dEiu2n7wgQ14wn5VdVJHS4OjzwuMWxHRLARzVAYw3wbXv5pKylRZ1FRyWq8FKtQxq9+Oj
	4gGEPBj4yF6k1RBrcEPHs70uZ4hCBeAzLK+HR9yfQfqt1Ip+ahadQJwF18i
X-Received: by 2002:a05:7022:b90c:b0:14d:baf5:c40f with SMTP id a92af1059eb24-190a465c250mr649391c88.14.1792545741421;
        Tue, 20 Oct 2026 18:22:21 -0700 (PDT)
Received: from CachingPlasma ([45.117.246.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm2935541c88.5.2026.10.20.18.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:22:21 -0700 (PDT)
From: DragonicRage13 <ajaneshlal3@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	DragonicRage13 <ajaneshlal3@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Add mute and mic-mute LEDs for HP ENVY 16 (103c:8be5)
Date: Wed, 21 Oct 2026 13:22:05 +1200
Message-ID: <20261021012205.9431-1-ajaneshlal3@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The HP ENVY Laptop 16-h1xxx (PCI SSID 103c:8be5) uses an ALC245 codec
with CS35L41 I2C speaker amplifiers. No LED fixup is applied for this
subsystem ID, so the speaker mute LED and the microphone mute LED are
never driven and do not follow their keys.

Add a fixup that calls the existing ALC245 mute LED COEF helper and the
GPIO mic-mute LED helper directly, then chains to the CS35L41 I2C
amplifier setup so the speakers keep working. Use it for 103c:8be5.

Tested on an HP ENVY Laptop 16-h1xxx running kernel 7.2.11: the
hda::mute and hda::micmute LEDs appear and follow their keys, and the
speaker amplifiers still bind (CS35L41 Bound in dmesg). The mic LED
GPIO pin and polarity are not verified on other hardware.

Assisted-by: Claude:claude-haiku-5-5
Signed-off-by: DragonicRage13 <ajaneshlal3@gmail.com>
---
Changes in v2:
- Resend with intact whitespace (tabs); no code changes.

 sound/hda/codecs/realtek/alc269.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index e98cc42e1..850a15801 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1572,6 +1572,14 @@ static void alc245_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
 	}
 }
 
+/* mute LED via COEF bit and mic-mute LED via GPIO, called directly */
+static void alc245_fixup_cs35l41_mute_micmute(struct hda_codec *codec,
+					      const struct hda_fixup *fix, int action)
+{
+	alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
+	alc245_fixup_hp_gpio_led(codec, fix, action);
+}
+
 static void alc245_fixup_hp_mute_led_v1_coefbit(struct hda_codec *codec,
 					  const struct hda_fixup *fix,
 					  int action)
@@ -4230,6 +4238,7 @@ enum {
 	ALC245_FIXUP_BASS_HP_DAC,
 	ALC245_FIXUP_ACER_MICMUTE_LED,
 	ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
+	ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED,
 	ALC236_FIXUP_HP_DMIC,
 	ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
 	ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX,
@@ -6859,6 +6868,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_CS35L41_I2C_2,
 	},
+	[ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_cs35l41_mute_micmute,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_CS35L41_I2C_2,
+	},
 	[ALC236_FIXUP_HP_DMIC] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7361,7 +7376,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8be1, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be2, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be3, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16", ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8be6, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be7, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.56.0

