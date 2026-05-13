Received: from n169-114.mail.139.com (n169-114.mail.139.com [120.232.169.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD3518DB1F;
	Wed, 13 May 2026 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663815; cv=none; b=T5tKW0U/TFnTEWjLKGJaRPdl0Z/MeSMfd0IJyplPECV1PObtYBbpSWE8HADP2JUgA29zQuzP6DqmwQXQj3kDYb41MVbWFi/O8QJFzdfjPA6M0CEDRrmb5rq2TRqEwrsoL6NiYJHL3WJwRpODTqWzf2cMS6D2MNtnxh3RyhbY3l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663815; c=relaxed/simple;
	bh=tTXCaE8OnloOBMJk77Sxpg2xUOb3FXwj+IbEf+qrGFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PwQ7qNsxX5kIk/kW7Se5VKt+Pqh8NYfg8YlQSAtnbB49Ix89J4M6kXL5FVEwPj00uXT48MVGh5RDDX5V3HRygweqVtdOHAtAj2Kojzwt5YzjoejNY83sjLQ9Y4jcwdc3EUXal737dPwr4kkDsHTKMvP9YSbU70kR+4qQy30e/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b=NfPdel+m; arc=none smtp.client-ip=120.232.169.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b="NfPdel+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=NfPdel+mNx/nSLnG5hSHyCGS057Xe73S15ZnzE1ClWOHVJNS4VFrOKDjcFnVcIsp2I34cZeB+zrao
	 5FHTGo5GthFmMB9xnHqBqcCgY9GBZ3GFUmA453GEX/ojkolfzYelr3p9JaOy3rE7ziZn9Z3R9AlAye
	 HCpXOK4zISRCA1vI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from jackie-ThinkPad-X13-Gen-2a.. (unknown[240E:404:B820:71FD:9B29:A96B:64FE:1CB2])
	by rmsmtp-lg-appmail-42-12056 (RichMail) with SMTP id 2f186a0440aa35f-0339e;
	Wed, 13 May 2026 17:13:25 +0800 (CST)
X-RM-TRANSID:2f186a0440aa35f-0339e
From: Jackie Dong <xy-jackie@139.com>
To: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	zhangheng@kylinos.cn,
	kailang@realtek.com,
	edip@medip.dev
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jackie Dong <xy-jackie@139.com>
Subject: [PATCH] ALSA:hda/realtek: ALC269 fixup for Lenovo Yoga Pro 7 15ASH111 audio
Date: Wed, 13 May 2026 17:12:56 +0800
Message-ID: <20260513091256.97584-1-xy-jackie@139.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ALSA:hda/realtek: ALC269 fixup for Lenovo Yoga Pro 7 15ASH111 audio

The amp/speakers on the Lenovo Yoga Pro 7 15ASH11 laptop aren't be
adjusted by Speaker Volume. Reuse the DAC routing selected for ThinkPad
X1 Gen7 function to fix it.

Signed-off-by: Jackie Dong <xy-jackie@139.com>
---
 sound/hda/codecs/realtek/alc269.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 11d0ea8ed859..84aa1d4e7410 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4076,6 +4076,7 @@ enum {
 	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
 	ALC298_FIXUP_LENOVO_C940_DUET7,
 	ALC287_FIXUP_LENOVO_YOGA_BOOK_9I,
+	ALC287_FIXUP_LENOVO_YOGA_PRO7,
 	ALC287_FIXUP_13S_GEN2_SPEAKERS,
 	ALC256_FIXUP_SET_COEF_DEFAULTS,
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
@@ -6100,6 +6101,11 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC287_FIXUP_LENOVO_YOGA_PRO7] = {
+		.type = HDA_FIXUP_FUNC,
+		/* Reuse the DAC routing selected for ThinkPad X1 Gen7 */
+		.v.func = alc285_fixup_thinkpad_x1_gen7,
+	},
 	[ALC623_FIXUP_LENOVO_THINKSTATION_P340] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_no_shutup,
@@ -7752,6 +7758,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	SND_PCI_QUIRK(0x17aa, 0x38fc, "Lenovo Yoga Pro 7 15ASH11", ALC287_FIXUP_LENOVO_YOGA_PRO7),
 	SND_PCI_QUIRK(0x17aa, 0x38fd, "ThinkBook plus Gen5 Hybrid", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
@@ -8043,6 +8050,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC285_FIXUP_HP_SPECTRE_X360_DF1, .name = "alc285-hp-spectre-x360-df1"},
 	{.id = ALC285_FIXUP_HP_ENVY_X360, .name = "alc285-hp-envy-x360"},
 	{.id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP, .name = "alc287-ideapad-bass-spk-amp"},
+	{.id = ALC287_FIXUP_LENOVO_YOGA_PRO7, .name = "alc287-lenovo-yoga-pro7"},
 	{.id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN, .name = "alc287-yoga9-bass-spk-pin"},
 	{.id = ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name = "alc623-lenovo-thinkstation-p340"},
 	{.id = ALC255_FIXUP_ACER_HEADPHONE_AND_MIC, .name = "alc255-acer-headphone-and-mic"},
-- 
2.43.0


