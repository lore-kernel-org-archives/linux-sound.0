Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4788BE7
	for <linux-sound@vger.kernel.org>; Sun, 27 Apr 2025 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745741447; cv=none; b=XjnbiKNACWJKdCQTwkTEEGv7QAer+6+sZ/twh6EwcXVfC++FD3pZgNEaQqrrXjCiAP73M16gyuIIe+tLpxjLF1X2lpW1D2U2ES0B/FgPbCmSh9EP2NNsXNl8va0f2Ksg8hzmHHOXhcwl77LD/njW3EBdcNC/HHYmBUMWdKJ8QTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745741447; c=relaxed/simple;
	bh=l87h+XkipnnAauEKDCLxZMB8md11eX4mfPQGnyreuvA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=usauQf1ykpb2AaKf2Z5KDHv41voiu18dPRC5I/wT1fV+5n0Ev/UpubNIjeexHST3FyByvt5K2c8glRz85WLuXYLPBaYaUzkV60h0reSMPkMYl1VrKG4P2Ot2S/eXh4k+EO9UZSgWla7BL1ei+d6aHl+imhLByMuHYKRk72S5R6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jmsiIyNS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hTYBSZgs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jmsiIyNS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hTYBSZgs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jmsiIyNS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hTYBSZgs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jmsiIyNS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hTYBSZgs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4388221194;
	Sun, 27 Apr 2025 08:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745741437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pqQjRk75srdKKGmhNltzSWZTkF6F7+uwcmqRvybtsxU=;
	b=jmsiIyNSqAK7aEptyBC8Lp+9MXqKc2tRWxDFbug/SnW2TRGX4zTTgsmHcPXO0JWCzQ3cP4
	HQbX6Ad5J/riOsljkoMKhLjG5jCYKDQsBJ7IiPAEqR00V6MBgvL+fugJ8f00iOilyEj1JL
	zshSSr+Ufvj6LeEXzH3o4EygCBknsi4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745741437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pqQjRk75srdKKGmhNltzSWZTkF6F7+uwcmqRvybtsxU=;
	b=hTYBSZgs2+0ohrjrY6ZBNQVe0IogAwRQ1J+ugsNBbe94t1VH+oT20kvbaP298OtboNKr3M
	rkUiaBUuzI3ljKCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745741437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pqQjRk75srdKKGmhNltzSWZTkF6F7+uwcmqRvybtsxU=;
	b=jmsiIyNSqAK7aEptyBC8Lp+9MXqKc2tRWxDFbug/SnW2TRGX4zTTgsmHcPXO0JWCzQ3cP4
	HQbX6Ad5J/riOsljkoMKhLjG5jCYKDQsBJ7IiPAEqR00V6MBgvL+fugJ8f00iOilyEj1JL
	zshSSr+Ufvj6LeEXzH3o4EygCBknsi4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745741437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pqQjRk75srdKKGmhNltzSWZTkF6F7+uwcmqRvybtsxU=;
	b=hTYBSZgs2+0ohrjrY6ZBNQVe0IogAwRQ1J+ugsNBbe94t1VH+oT20kvbaP298OtboNKr3M
	rkUiaBUuzI3ljKCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2635113927;
	Sun, 27 Apr 2025 08:10:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0+DcB33mDWi8KwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 27 Apr 2025 08:10:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Spectre x360 15-df1xxx
Date: Sun, 27 Apr 2025 10:10:34 +0200
Message-ID: <20250427081035.11567-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

HP Spectre x360 15-df1xxx with SSID 13c:863e requires similar
workarounds that were applied to another HP Spectre x360 models;
it has a mute LED only, no micmute LEDs, and needs the speaker GPIO
seup.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220054
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 38ed264c3a49..1799203af35a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6982,6 +6982,41 @@ static void alc285_fixup_hp_spectre_x360_eb1(struct hda_codec *codec,
 	}
 }
 
+/* GPIO1 = amplifier on/off */
+static void alc285_fixup_hp_spectre_x360_df1(struct hda_codec *codec,
+					     const struct hda_fixup *fix,
+					     int action)
+{
+	struct alc_spec *spec = codec->spec;
+	static const hda_nid_t conn[] = { 0x02 };
+	static const struct hda_pintbl pincfgs[] = {
+		{ 0x14, 0x90170110 },  /* front/high speakers */
+		{ 0x17, 0x90170130 },  /* back/bass speakers */
+		{ }
+	};
+
+	// enable mute led
+	alc285_fixup_hp_mute_led_coefbit(codec, fix, action);
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		/* needed for amp of back speakers */
+		spec->gpio_mask |= 0x01;
+		spec->gpio_dir |= 0x01;
+		snd_hda_apply_pincfgs(codec, pincfgs);
+		/* share DAC to have unified volume control */
+		snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn), conn);
+		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		/* need to toggle GPIO to enable the amp of back speakers */
+		alc_update_gpio_data(codec, 0x01, true);
+		msleep(100);
+		alc_update_gpio_data(codec, 0x01, false);
+		break;
+	}
+}
+
 static void alc285_fixup_hp_spectre_x360(struct hda_codec *codec,
 					  const struct hda_fixup *fix, int action)
 {
@@ -7780,6 +7815,7 @@ enum {
 	ALC280_FIXUP_HP_9480M,
 	ALC245_FIXUP_HP_X360_AMP,
 	ALC285_FIXUP_HP_SPECTRE_X360_EB1,
+	ALC285_FIXUP_HP_SPECTRE_X360_DF1,
 	ALC285_FIXUP_HP_ENVY_X360,
 	ALC288_FIXUP_DELL_HEADSET_MODE,
 	ALC288_FIXUP_DELL1_MIC_NO_PRESENCE,
@@ -9857,6 +9893,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_hp_spectre_x360_eb1
 	},
+	[ALC285_FIXUP_HP_SPECTRE_X360_DF1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_hp_spectre_x360_df1
+	},
 	[ALC285_FIXUP_HP_ENVY_X360] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_hp_envy_x360,
@@ -10588,6 +10628,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x86c1, "HP Laptop 15-da3001TU", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x86e7, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
+	SND_PCI_QUIRK(0x103c, 0x863e, "HP Spectre x360 15-df1xxx", ALC285_FIXUP_HP_SPECTRE_X360_DF1),
 	SND_PCI_QUIRK(0x103c, 0x86e8, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x86f9, "HP Spectre x360 13-aw0xxx", ALC285_FIXUP_HP_SPECTRE_X360_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8716, "HP Elite Dragonfly G2 Notebook PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
@@ -11520,6 +11561,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC295_FIXUP_HP_OMEN, .name = "alc295-hp-omen"},
 	{.id = ALC285_FIXUP_HP_SPECTRE_X360, .name = "alc285-hp-spectre-x360"},
 	{.id = ALC285_FIXUP_HP_SPECTRE_X360_EB1, .name = "alc285-hp-spectre-x360-eb1"},
+	{.id = ALC285_FIXUP_HP_SPECTRE_X360_DF1, .name = "alc285-hp-spectre-x360-df1"},
 	{.id = ALC285_FIXUP_HP_ENVY_X360, .name = "alc285-hp-envy-x360"},
 	{.id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP, .name = "alc287-ideapad-bass-spk-amp"},
 	{.id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN, .name = "alc287-yoga9-bass-spk-pin"},
-- 
2.49.0

