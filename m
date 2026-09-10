Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F26E49E5D2
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 17:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789062190; cv=none; b=LWfaoazGXNbhb+r/jP6R2e7EVE7osP6JHR0JE8ZFYOo13tNtKvpup86MLWe3YQEzUNsnhzC3YLkAmHmVbWy6CDWlxyYb3GHHaleEEHS3VDMde0WmQXUbPO8D9nf+AIMD50xEs99Wy1URS656+onGSuIXJie/PYtZR//10/ZwEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789062190; c=relaxed/simple;
	bh=+begMGMuX6wapIUXJ+/wvyRffcEI6jV5c9hgs33aP6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nR9TRXXyrd2Z5Cp56VKkXo9EzkDSPI78jfmNB/NsK94BV/IRu4UYjRkiGfDOvIS7rD449r4nEdtzm5qcoID3rjXAW16QcaZkEEM1uAHdbWgyzW6tttaLCbt3IlUphKIz1Z1lrf/oGl3J51mTvIDud78DYvCsvdjt35CELUiV1CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEgK6rc4; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEgK6rc4"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so965154f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789062173; x=1789666973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lrAOUFVmnYnE4uOatSz6X9x2GKFe6/CTdkNVYaI1tsU=;
        b=BEgK6rc4PqL12hFNjbSi4lcNFgENiGsUpLlx+w73XrmIou8vs4lAK9E5rpNaDRuzKk
         t/yIjj5M2zeKZDNn6CIGX7ANCYhUa3n3k9TeoeMGs47XEPQUOfOD6/ohUbMkyinba+BS
         rs91eyFVfOAPhUdVC0iLdDToFXsG1OMoAz0lxtIqVcCvOt3etP79+yAj1cf8GtAlCiEV
         aYzC77SnUezY/0KWrtGqI+rDbfZ86m7/YHwsq43lXiL2bDofxTo8iET0vBvnShhmZnNo
         nDeJS+z9z/VX9Av06Jt2w8m4Uk5pkCOzi7ImkBDLaSL9g4S4XgmbNuZGFWCASJwuRXSD
         7XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789062173; x=1789666973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lrAOUFVmnYnE4uOatSz6X9x2GKFe6/CTdkNVYaI1tsU=;
        b=tRfaqyFevf0mpbpqjvD/13FaiW6kp6EPGle/ca2j7poWl6LAvmIU4ziG5KLfayQ3YP
         FjJMjosME4k4AK3yxgWj/jdMzVXK6tlxaEKo82mAy/jUArSak2a8aiaVFVXvcMLrOUE6
         /BzXN9M9BGXgSr2m2P2vtJS5IxpHT+px8UqCRm/AEYWsiRAo0ispUE76IbH5kP524vXS
         qBl5LCUoHVPE3ASigrfW2K7VwmlNm0iTL4967QnZvnEA6Yfq8qAAgLiDP4ru+58RaUj8
         1OnWjwMUXtnHz/rD+ZYMwGPZC1M0h0iEWHmduzuQ8HfElcQuBtUUpnbmDDxJjZ1PTwuZ
         ihHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJlcOEaD4pSMW5xh2waOdXFnJ8W3GEeOtkfSb2+k07bIyz/VP3iBwVd8b6WVaaL8S2USBtDMLtqN9bOg==@vger.kernel.org
X-Gm-Message-State: AFuF++mJ3gXlc4zMAglKlnVgNrst/1Up7ykyVtBZY1QpdTzejtraGHgB
	A8AldaalusxiQaEiABF4d2rE8xWqmGnXTziYkw3ec356qDdyoo5XIcup
X-Gm-Gg: AYBFou3/KEetCgBMtZw5ynZayPmZetjKpxU7ZS4lANqfhafJxrHlOfrf8FKVljInJrw
	DoUsvZV+w/cgz+iRjIrbKjsHfHuwOd9Qm1lmR5j8emV+101QXO0uHXzR51FYTVzeJLnglAJLY5q
	pxNI7LVqqjsLIOdwelwoLeOtxeldlZJDoupIh3LNDCb9F74GB5XVk1jZno5pjf7dubNFaQpflyO
	/c4mIxgw4ZY00N63GTp0Gj9ttcpfMu6wrVwkyXDP3CMSz0pgmZgEA52iUbUsQ/mlr3CwUsXTRTp
	5DAelq/NpQSt1ppzQToMrFJUkuMeYXpijIYeHCeOoONnJoK7pDQeMZJfqf1D5BanYk+F1g6/hXO
	S+M2qLg9LsbCq3M6XdVrzP7NShuYWt/DO5h7wZuexdngTUcRWXNInZUwTuVFhw6cGJFrJCvaaaX
	xyeZ+zdWn+KW4YYLnV2sGUKmA+uPOC0X2hj8vcqNGoidw4UCZyKFUM2xff78rNUnHzQgCM2v5pZ
	qyDIu3aKwlLeEAggdXcY97aOALBliIv6isTkHA92RkyYlthgoG4mEArenyv06HcFHo+lKBST5VM
	+ntTEisI4fJELpq8iahsUu4bXw==
X-Received: by 2002:a05:6000:2501:b0:486:e5f7:89ca with SMTP id ffacd0b85a97d-486eb1d99c5mr96628f8f.8.1789062173016;
        Thu, 10 Sep 2026 10:42:53 -0700 (PDT)
Received: from cristian-v.. ([62.12.131.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm53693f8f.9.2026.09.10.10.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:42:52 -0700 (PDT)
From: Cristian Verde <verde.cristian2005@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add bass speaker quirk for Lenovo Yoga Pro 7 14IRH8
Date: Thu, 10 Sep 2026 19:42:51 +0200
Message-ID: <20260910174251.22302-1-verde.cristian2005@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Pro 7 14IRH8 suffers from missing bass speaker output and
broken volume scaling (5% volume plays as loud as 100%). The system shares
the PCI SSID 0x17aa:0x3852 with the older Lenovo Yoga 7 14ITL5, causing the
ALSA driver to mistakenly match on the PCI subsystem ID and apply
ALC287_FIXUP_YOGA7_14ITL_SPEAKERS. That quirk only powers on the amplifier
without routing the 4-speaker DAC pins.

Add a fixup helper that disambiguates models by checking the HDA codec
subsystem ID (codec->core.subsystem_id). When the Yoga Pro 7 14IRH8's codec
SSID (0x17aa:0x38b1) is detected, apply ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
which properly configures pin 0x17 as a speaker output and hooks it to the DAC
volume controls. Fall back to ALC287_FIXUP_YOGA7_14ITL_SPEAKERS for older
hardware sharing 0x3852.

Signed-off-by: Cristian Verde <verde.cristian2005@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5b385a82e..e469b45ac 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4077,6 +4077,7 @@ enum {
 	ALC298_FIXUP_LENOVO_C940_DUET7,
 	ALC287_FIXUP_LENOVO_YOGA_BOOK_9I,
 	ALC287_FIXUP_LENOVO_YOGA_PRO7,
+	ALC287_FIXUP_YOGA7_14ITL_PRO7,
 	ALC287_FIXUP_13S_GEN2_SPEAKERS,
 	ALC256_FIXUP_SET_COEF_DEFAULTS,
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
@@ -4192,6 +4193,25 @@ static void alc287_fixup_lenovo_yoga_book_9i(struct hda_codec *codec,
 	__snd_hda_apply_fixup(codec, id, action, 0);
 }
 
+/* A special fixup for Lenovo Yoga Pro 7 14IRH8 and Yoga 7 14ITL5
+ * both have the very same PCI SSID and vendor ID, so we need to
+ * apply different fixups depending on the subsystem ID
+ */
+static void alc287_fixup_lenovo_yoga7_pro7(struct hda_codec *codec,
+					   const struct hda_fixup *fix,
+					   int action)
+{
+	int id;
+
+	if (codec->core.subsystem_id == 0x17aa38b1)
+		id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN;
+	else
+		id = ALC287_FIXUP_YOGA7_14ITL_SPEAKERS;
+
+	__snd_hda_apply_fixup(codec, id, action, 0);
+}
+
+
 static const struct hda_fixup alc269_fixups[] = {
 	[ALC269_FIXUP_GPIO2] = {
 		.type = HDA_FIXUP_FUNC,
@@ -6439,6 +6459,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_CS35L41_I2C_2,
 	},
+	[ALC287_FIXUP_YOGA7_14ITL_PRO7] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_lenovo_yoga7_pro7,
+	},
 	[ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_dell_inspiron_top_speakers,
@@ -7722,7 +7746,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	HDA_CODEC_QUIRK(0x17aa, 0x38cf, "Lenovo Yoga Pro 7 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3847, "Legion 7 16ACHG6", ALC287_FIXUP_LEGION_16ACHG6),
 	SND_PCI_QUIRK(0x17aa, 0x384a, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
-	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5 / Pro 7 14IRH8", ALC287_FIXUP_YOGA7_14ITL_PRO7),
 	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3855, "Legion 7 16ITHG6", ALC287_FIXUP_LEGION_16ITHG6),
 	SND_PCI_QUIRK(0x17aa, 0x3865, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
@@ -7750,6 +7774,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	SND_PCI_QUIRK(0x17aa, 0x38b1, "Lenovo Yoga Pro 7 14IRH8", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	HDA_CODEC_QUIRK(0x17aa, 0x391c, "Lenovo Yoga 7 2-in-1 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x391d, "Lenovo Yoga 7 2-in-1 16AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
-- 
2.43.0

