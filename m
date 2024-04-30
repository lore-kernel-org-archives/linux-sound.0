Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB7A17F36B
	for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714494720; cv=none; b=EoVa5yW9YcZBmAhteAbeNBIEne7GqqKw+1K6GqBUzp7zymSnucwUHVEtmsXz9iwWi/WkKeKOKbrXnpb2oSRq9Vv0QM+FNe1Vk6nIApVsp6pdQhvhEbADDgfdVEjcQZZXE5PMDjtp0p5RN6OFcM80lvDkUJHRMgWg1P0R7cTWVCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714494720; c=relaxed/simple;
	bh=eC7hbuILYDMQk5g7ZuTp9yMfHaLLtzyo73pTXPOr9Xo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=MJUsQUKm6JKoov5hM0yqpTm1+uG45y3e9ynU6mGpBGOMyPr2rX7Zb5tXxsSVKSPea42lVX18f4dSLxyAPXaXuBnLddBksHNW0bNZDKtbrpIpAOF2Mg6geo5ij0fqr2lBYIjld/Lgfc0Dd9rQ8w3LOTlRgvssihxtqA8pYQXn1Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X2i+q09O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ne1Hq4Aq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X2i+q09O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ne1Hq4Aq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X2i+q09O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ne1Hq4Aq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X2i+q09O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ne1Hq4Aq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 98A58341B7;
	Tue, 30 Apr 2024 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714494716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uHCJXy/Lshzk2Q6F7oQ6wXA/oWyytGl4n62S1jYeXiM=;
	b=X2i+q09OsMeU4p9rS88GyZiwgZt0hJreOH3XQNch2G4CvdmOT2Z3fNmEZLlzhj3lTj5rLM
	oAW+YHtt+CZs49f/Hk+CRSM4mN9yOrzNg11MSk38v2J5cy5LXhjTJcB7sUwEgtS4jMvS36
	hzD22RrGLSgPAcSQ3uq619TXb3DO6Mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714494716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uHCJXy/Lshzk2Q6F7oQ6wXA/oWyytGl4n62S1jYeXiM=;
	b=Ne1Hq4AqOZGGRcMkS0Dqammg/rh0uGYHXNujhoK8QsSKliw7LA+XEdNpW6f/5G4M/KFEUS
	Sa4NafFfGi/gGCCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=X2i+q09O;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ne1Hq4Aq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714494716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uHCJXy/Lshzk2Q6F7oQ6wXA/oWyytGl4n62S1jYeXiM=;
	b=X2i+q09OsMeU4p9rS88GyZiwgZt0hJreOH3XQNch2G4CvdmOT2Z3fNmEZLlzhj3lTj5rLM
	oAW+YHtt+CZs49f/Hk+CRSM4mN9yOrzNg11MSk38v2J5cy5LXhjTJcB7sUwEgtS4jMvS36
	hzD22RrGLSgPAcSQ3uq619TXb3DO6Mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714494716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uHCJXy/Lshzk2Q6F7oQ6wXA/oWyytGl4n62S1jYeXiM=;
	b=Ne1Hq4AqOZGGRcMkS0Dqammg/rh0uGYHXNujhoK8QsSKliw7LA+XEdNpW6f/5G4M/KFEUS
	Sa4NafFfGi/gGCCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B84F137BA;
	Tue, 30 Apr 2024 16:31:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id olhwHPwcMWZNcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Apr 2024 16:31:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix conflicting PCI SSID 17aa:386f for Lenovo Legion models
Date: Tue, 30 Apr 2024 18:32:04 +0200
Message-ID: <20240430163206.5200-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-0.11 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.10)[65.00%];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -0.11
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 98A58341B7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Unfortunately both Lenovo Legion Pro 7 16ARX8H and Legion 7i 16IAX7
got the very same PCI SSID while the hardware implementations are
completely different (the former is with TI TAS2781 codec while the
latter is with Cirrus CS35L41 codec).  The former model got broken by
the recent fix for the latter model.

For addressing the regression, check the codec SSID and apply the
proper quirk for each model now.

Fixes: 24b6332c2d4f ("ALSA: hda: Add Lenovo Legion 7i gen7 sound quirk")
Cc: <stable@vger.kernel.org>
Link: https://bugzilla.suse.com/show_bug.cgi?id=1223462
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3955e8f51bcf..c20d71b8f85c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7466,6 +7466,7 @@ enum {
 	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
 	ALC298_FIXUP_LENOVO_C940_DUET7,
 	ALC287_FIXUP_LENOVO_14IRP8_DUETITL,
+	ALC287_FIXUP_LENOVO_LEGION_7,
 	ALC287_FIXUP_13S_GEN2_SPEAKERS,
 	ALC256_FIXUP_SET_COEF_DEFAULTS,
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
@@ -7551,6 +7552,23 @@ static void alc287_fixup_lenovo_14irp8_duetitl(struct hda_codec *codec,
 	__snd_hda_apply_fixup(codec, id, action, 0);
 }
 
+/* Another hilarious PCI SSID conflict with Lenovo Legion Pro 7 16ARX8H (with
+ * TAS2781 codec) and Legion 7i 16IAX7 (with CS35L41 codec);
+ * we apply a corresponding fixup depending on the codec SSID instead
+ */
+static void alc287_fixup_lenovo_legion_7(struct hda_codec *codec,
+					 const struct hda_fixup *fix,
+					 int action)
+{
+	int id;
+
+	if (codec->core.subsystem_id == 0x17aa38a8)
+		id = ALC287_FIXUP_TAS2781_I2C; /* Legion Pro 7 16ARX8H */
+	else
+		id = ALC287_FIXUP_CS35L41_I2C_2; /* Legion 7i 16IAX7 */
+	__snd_hda_apply_fixup(codec, id, action, 0);
+}
+
 static const struct hda_fixup alc269_fixups[] = {
 	[ALC269_FIXUP_GPIO2] = {
 		.type = HDA_FIXUP_FUNC,
@@ -9445,6 +9463,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc287_fixup_lenovo_14irp8_duetitl,
 	},
+	[ALC287_FIXUP_LENOVO_LEGION_7] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_lenovo_legion_7,
+	},
 	[ALC287_FIXUP_13S_GEN2_SPEAKERS] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -10478,7 +10500,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3865, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3866, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
-	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7/7i", ALC287_FIXUP_LENOVO_LEGION_7),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3878, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.43.0

