Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D0018DF88
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388903; cv=none; b=dBTXPJVIhMrdLcehtWxo7vuCiVRpgrlod8aJc/HnocMSMruOgZkdPUEBWYLv0ggRX+cEuHhcpNQeZE+wC5NM6JdflOMqaK1YPFqb/p/mqZODMbrzHDGVdmbSfst0A+2Q0wyOaBjQHPJLaQL7VuASAF6VyihhhG7cYKuuKYnHank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388903; c=relaxed/simple;
	bh=oyVdMN7wYAwjhB6YJpe6BRNrFmQDTvenjYy07XCtHWk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6rRZ/VutJWZJ/uVI/nFhwJljjI70USOJmAffr1p9tqXqcD/OhX/ImuvGa3iEyGaPM77ONAYDAgA9Gb/CasJRxyIq8x/zup+BDNKLzBF/RxFaW1ijd2GKiaC3bU497WIHuFU0LjIknXpOqwa+AlYvC8XVevic6BovJ1aiIA9CGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X0MbJUdn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x/VT5z1e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X0MbJUdn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x/VT5z1e; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X0MbJUdn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x/VT5z1e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X0MbJUdn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x/VT5z1e"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 691021FF3E;
	Tue,  8 Oct 2024 12:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728388900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sPHH0RDs0BAIXbLB5s753pWsbgeVhLwqCo/nDiiDaOs=;
	b=X0MbJUdn7CdtIHmrNA6eYEXSLWvMiQR7T9/lSPWYf6NGMNLlMEW1PHmN7q4aFaBE8XkM/i
	qvVUU7/4K9iT+ebqSX1Bze2Bp9EXpAophDyNVw4CsxP8tpan9236Pteq0EFk0r9NvWIl8c
	yP2q5pHIPOi9Bna9Rs29N8k1dW/bOY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728388900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sPHH0RDs0BAIXbLB5s753pWsbgeVhLwqCo/nDiiDaOs=;
	b=x/VT5z1eXp/Z5F74lsB+/xRAiHA24qdcmWC9RtTMGqogcc2e+VJoriMFxiiQUNNdlOvX0K
	IOgezGYDuUJ9HnAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728388900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sPHH0RDs0BAIXbLB5s753pWsbgeVhLwqCo/nDiiDaOs=;
	b=X0MbJUdn7CdtIHmrNA6eYEXSLWvMiQR7T9/lSPWYf6NGMNLlMEW1PHmN7q4aFaBE8XkM/i
	qvVUU7/4K9iT+ebqSX1Bze2Bp9EXpAophDyNVw4CsxP8tpan9236Pteq0EFk0r9NvWIl8c
	yP2q5pHIPOi9Bna9Rs29N8k1dW/bOY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728388900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sPHH0RDs0BAIXbLB5s753pWsbgeVhLwqCo/nDiiDaOs=;
	b=x/VT5z1eXp/Z5F74lsB+/xRAiHA24qdcmWC9RtTMGqogcc2e+VJoriMFxiiQUNNdlOvX0K
	IOgezGYDuUJ9HnAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56EB71340C;
	Tue,  8 Oct 2024 12:01:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kKWhFCQfBWdObAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Oct 2024 12:01:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/3] ALSA: hda/realtek: Use codec SSID matching for Lenovo devices
Date: Tue,  8 Oct 2024 14:02:31 +0200
Message-ID: <20241008120233.7154-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008120233.7154-1-tiwai@suse.de>
References: <20241008120233.7154-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.977];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Now we can perform the codec ID matching primarily, and reduce the
conditional application of the quirk for conflicting PCI SSIDs in
various Lenovo devices.

Here, HDA_CODEC_QUIRK() is applied at first so that the device with
the codec SSID matching is picked up, followed by SND_PCI_QUIRK() for
PCI SSID matching with the same ID number.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 98 +++--------------------------------
 1 file changed, 8 insertions(+), 90 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e40f95bfdedc..61df477b0bc4 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7687,8 +7687,6 @@ enum {
 	ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
 	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
 	ALC298_FIXUP_LENOVO_C940_DUET7,
-	ALC287_FIXUP_LENOVO_14IRP8_DUETITL,
-	ALC287_FIXUP_LENOVO_LEGION_7,
 	ALC287_FIXUP_13S_GEN2_SPEAKERS,
 	ALC256_FIXUP_SET_COEF_DEFAULTS,
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
@@ -7732,8 +7730,6 @@ enum {
 	ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1,
 	ALC287_FIXUP_LENOVO_THKPAD_WH_ALC1318,
 	ALC256_FIXUP_CHROME_BOOK,
-	ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7,
-	ALC287_FIXUP_LENOVO_SSID_17AA3820,
 	ALC245_FIXUP_CLEVO_NOISY_MIC,
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 };
@@ -7755,72 +7751,6 @@ static void alc298_fixup_lenovo_c940_duet7(struct hda_codec *codec,
 	__snd_hda_apply_fixup(codec, id, action, 0);
 }
 
-/* A special fixup for Lenovo Slim/Yoga Pro 9 14IRP8 and Yoga DuetITL 2021;
- * 14IRP8 PCI SSID will mistakenly be matched with the DuetITL codec SSID,
- * so we need to apply a different fixup in this case. The only DuetITL codec
- * SSID reported so far is the 17aa:3802 while the 14IRP8 has the 17aa:38be
- * and 17aa:38bf. If it weren't for the PCI SSID, the 14IRP8 models would
- * have matched correctly by their codecs.
- */
-static void alc287_fixup_lenovo_14irp8_duetitl(struct hda_codec *codec,
-					      const struct hda_fixup *fix,
-					      int action)
-{
-	int id;
-
-	if (codec->core.subsystem_id == 0x17aa3802)
-		id = ALC287_FIXUP_YOGA7_14ITL_SPEAKERS; /* DuetITL */
-	else
-		id = ALC287_FIXUP_TAS2781_I2C; /* 14IRP8 */
-	__snd_hda_apply_fixup(codec, id, action, 0);
-}
-
-/* Similar to above the Lenovo Yoga Pro 7 14ARP8 PCI SSID matches the codec SSID of the
-   Legion Y9000X 2022 IAH7.*/
-static void alc287_fixup_lenovo_14arp8_legion_iah7(struct hda_codec *codec,
-					   const struct hda_fixup *fix,
-					   int action)
-{
-	int id;
-
-	if (codec->core.subsystem_id == 0x17aa386e)
-		id = ALC287_FIXUP_CS35L41_I2C_2; /* Legion Y9000X 2022 IAH7 */
-	else
-		id = ALC285_FIXUP_SPEAKER2_TO_DAC1; /* Yoga Pro 7 14ARP8 */
-	__snd_hda_apply_fixup(codec, id, action, 0);
-}
-
-/* Another hilarious PCI SSID conflict with Lenovo Legion Pro 7 16ARX8H (with
- * TAS2781 codec) and Legion 7i 16IAX7 (with CS35L41 codec);
- * we apply a corresponding fixup depending on the codec SSID instead
- */
-static void alc287_fixup_lenovo_legion_7(struct hda_codec *codec,
-					 const struct hda_fixup *fix,
-					 int action)
-{
-	int id;
-
-	if (codec->core.subsystem_id == 0x17aa38a8)
-		id = ALC287_FIXUP_TAS2781_I2C; /* Legion Pro 7 16ARX8H */
-	else
-		id = ALC287_FIXUP_CS35L41_I2C_2; /* Legion 7i 16IAX7 */
-	__snd_hda_apply_fixup(codec, id, action, 0);
-}
-
-/* Yet more conflicting PCI SSID (17aa:3820) on two Lenovo models */
-static void alc287_fixup_lenovo_ssid_17aa3820(struct hda_codec *codec,
-					      const struct hda_fixup *fix,
-					      int action)
-{
-	int id;
-
-	if (codec->core.subsystem_id == 0x17aa3820)
-		id = ALC269_FIXUP_ASPIRE_HEADSET_MIC; /* IdeaPad 330-17IKB 81DM */
-	else /* 0x17aa3802 */
-		id =  ALC287_FIXUP_YOGA7_14ITL_SPEAKERS; /* "Yoga Duet 7 13ITL6 */
-	__snd_hda_apply_fixup(codec, id, action, 0);
-}
-
 static const struct hda_fixup alc269_fixups[] = {
 	[ALC269_FIXUP_GPIO2] = {
 		.type = HDA_FIXUP_FUNC,
@@ -9731,14 +9661,6 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc298_fixup_lenovo_c940_duet7,
 	},
-	[ALC287_FIXUP_LENOVO_14IRP8_DUETITL] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc287_fixup_lenovo_14irp8_duetitl,
-	},
-	[ALC287_FIXUP_LENOVO_LEGION_7] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc287_fixup_lenovo_legion_7,
-	},
 	[ALC287_FIXUP_13S_GEN2_SPEAKERS] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -9923,10 +9845,6 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
 	},
-	[ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc287_fixup_lenovo_14arp8_legion_iah7,
-	},
 	[ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc287_fixup_yoga9_14iap7_bass_spk_pin,
@@ -10057,10 +9975,6 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC225_FIXUP_HEADSET_JACK
 	},
-	[ALC287_FIXUP_LENOVO_SSID_17AA3820] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc287_fixup_lenovo_ssid_17aa3820,
-	},
 	[ALC245_FIXUP_CLEVO_NOISY_MIC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc269_fixup_limit_int_mic_boost,
@@ -10794,11 +10708,13 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x31af, "ThinkCentre Station", ALC623_FIXUP_LENOVO_THINKSTATION_P340),
 	SND_PCI_QUIRK(0x17aa, 0x334b, "Lenovo ThinkCentre M70 Gen5", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
-	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga Pro 9 14IRP8 / DuetITL 2021", ALC287_FIXUP_LENOVO_14IRP8_DUETITL),
+	HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga Pro 9 14IRP8", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_LENOVO_C940_DUET7),
 	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
-	SND_PCI_QUIRK(0x17aa, 0x3820, "IdeaPad 330 / Yoga Duet 7", ALC287_FIXUP_LENOVO_SSID_17AA3820),
+	HDA_CODEC_QUIRK(0x17aa, 0x3820, "IdeaPad 330-17IKB 81DM", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x3820, "Yoga Duet 7 13ITL6", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3824, "Legion Y9000X 2020", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
@@ -10812,8 +10728,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3865, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3866, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
-	SND_PCI_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7 / Yoga Pro 7 14ARP8",  ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7),
-	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7/7i", ALC287_FIXUP_LENOVO_LEGION_7),
+	HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x386e, "Yoga Pro 7 14ARP8", ALC285_FIXUP_SPEAKER2_TO_DAC1),
+	HDA_CODEC_QUIRK(0x17aa, 0x386f, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3878, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.43.0

